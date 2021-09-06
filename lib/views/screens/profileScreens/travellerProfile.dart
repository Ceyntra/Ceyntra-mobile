import 'package:ceyntra_mobile/service/ProfileService.dart';
import 'package:ceyntra_mobile/views/widgets/dividerWidget.dart';
import 'package:ceyntra_mobile/views/widgets/profileDetailsWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';

class TravellerProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TravellerProfileScreenState();
  }
}

class _TravellerProfileScreenState extends State<TravellerProfileScreen> {

  ProfileService profileService=new ProfileService();
  int uID=0;
  String fName="";
  String lName="";
  String nic="";
  String email="";
  String telephone="";
  String photo="";

  File imageFile;
  final _formKey = GlobalKey<FormState>();

  TextEditingController firstNameController;
  TextEditingController lastNameController;
  TextEditingController nicController;
  TextEditingController emailController;
  TextEditingController telephoneController;

  void successDialog(){
    AlertDialog alert = AlertDialog(
      title: Column(
        children: [
          Icon(
            Icons.done_all,
            color: Colors.green,
            size: 80,
          ),
          Text("Profile Updated Successfully", style: GoogleFonts.montserrat()),
        ],
      ),
      titlePadding: EdgeInsets.symmetric(horizontal: 25, vertical: 50)
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 3), () {
          Navigator.of(context).pop();
        });
        return alert;
      });
  }

  void getUpdatedData(){
    Map<String, dynamic> updatedDetails = {
      "userID": uID,
      "firstName": firstNameController.text,
      "lastName": lastNameController.text,
      "nic": nicController.text,
      "email": emailController.text,
      "contactNumber": telephoneController.text,
    };
    var updatedResult=profileService.updateProfileDetails(updatedDetails);
    updatedResult.then((value) => {
      if (value == 1){
        setState(() {
          successDialog();
          fName=firstNameController.text;
          lName=lastNameController.text;
          nic=nicController.text;
          email=emailController.text;
          telephone=telephoneController.text;
        })
      }else{
        popUpDialog(context)
      }
    });
  }

  void detailsEditForm(BuildContext context){
    showDialog(
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.7),
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // backgroundColor: Color(0xff031925),
          // contentTextStyle: TextStyle(
          //   color: Colors.red
          // ),
          scrollable: true,
          title: Text('Edit Profile', style: GoogleFonts.montserrat()),
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    // style: TextStyle(
                    //   color: Colors.white
                    // ),
                    style: GoogleFonts.montserrat(),
                    controller: firstNameController,
                    validator: (val) {
                      return val.isEmpty
                        ? "First name cannot be empty"
                        : null;
                    },
                    decoration: InputDecoration(
                      labelText: 'First Name',
                      // labelStyle: TextStyle(
                      //   fontSize: 25,
                      //   color: Colors.blue,
                      //   fontWeight: FontWeight.bold
                      // )
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical:10)),

                  TextFormField(
                    style: GoogleFonts.montserrat(),
                    controller: lastNameController,
                    validator: (val) {
                      return val.isEmpty
                        ? "Last name cannot be empty"
                        : null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Last Name',
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical:10)),

                  TextFormField(
                    style: GoogleFonts.montserrat(),
                    controller: nicController,
                    validator: (val) {
                      return val.isEmpty || val.length < 4
                        ? "NIC/Passport should be greater than 4"
                        : null;
                    },
                    decoration: InputDecoration(
                      labelText: 'NIC',
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical:10)),

                  TextFormField(
                    style: GoogleFonts.montserrat(),
                    controller: emailController,
                    validator: (val) {
                      return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val)
                        ? null
                        : "Please enter a valid email";
                    },
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical:10)),

                  TextFormField(
                    style: GoogleFonts.montserrat(),
                    controller: telephoneController,
                    validator: (val) {
                      return RegExp(r"^[0-9]*$").hasMatch(val) && val.length > 8
                        ? null
                        : "Please enter a valid phone number";
                    },
                    decoration: InputDecoration(
                      labelText: 'Telephone',
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            ElevatedButton(
              child: Text("Cancel", style: GoogleFonts.montserrat()),
              onPressed: () {
                Navigator.of(context).pop();
                firstNameController.text=fName;
                lastNameController.text=lName;
                nicController.text=nic;
                emailController.text=email;
                telephoneController.text=telephone;
              }
            ),
            ElevatedButton(
              child: Text("Save Changes", style: GoogleFonts.montserrat()),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  Navigator.of(context).pop();
                  getUpdatedData();
                }
              }
            )
          ],
        );
      }
    );
  }

  void popUpDialog(BuildContext context) {
    Widget okButton = TextButton(
      child: Text("OK", style: GoogleFonts.montserrat()),
      onPressed: () {
        Navigator.of(context).pop();  
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Something Went Wrong...", style: GoogleFonts.montserrat()),
      content: Text("Update Failed", style: GoogleFonts.montserrat()),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      }
    );
  }

  _imgFromCamera() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );

    setState(() {
      imageFile = File(pickedFile.path);
      if(imageFile != null){
        //way to store the image and retreiving the link of it need to be done
        //here took a dummy link to proceed
        String newPhoto="https://firebasestorage.googleapis.com/v0/b/ceyntra-project.appspot.com/o/profile_photos%2Fpp.jpg?alt=media&token=03b89c18-f56c-4831-a497-92433a99f42c";
        var result=profileService.updateProfilePhoto(newPhoto, uID);
        result.then((value) => {
          if (value == 1){
            setState(() {
              photo=newPhoto;
            })
          }else{
            popUpDialog(context)
          }
        });
      }else{
        // return;
        print("no");
      }
    });
  }

  _imgFromGallery() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );

    setState(() {
      imageFile = File(pickedFile.path);
      if(imageFile != null){
        //way to store the image and retreiving the link of it need to be done
        //here took a dummy link to proceed
        String newPhoto="https://firebasestorage.googleapis.com/v0/b/ceyntra-project.appspot.com/o/profile_photos%2Fpp.jpg?alt=media&token=03b89c18-f56c-4831-a497-92433a99f42c";
        var result=profileService.updateProfilePhoto(newPhoto, uID);
        result.then((value) => {
          if (value == 1){
            photo=newPhoto,
          }else{
            popUpDialog(context)
          }
        });
      }else{
        // return;
        print("no");
      }
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: Icon(
                    Icons.photo_library,
                    color: Colors.black,
                  ),
                  title: Text('Photo Library'),
                  onTap: () {
                    _imgFromGallery();
                    Navigator.of(context).pop();
                  }
                ),
                ListTile(
                  leading: Icon(
                    Icons.photo_camera,
                    color: Colors.black,
                  ),
                  title: Text('Camera'),
                  onTap: () {
                    _imgFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      }
    );
  }

  void deleteAccount() async{
    
  }

  void getProfileData(response){
    setState(() {
      firstNameController=new TextEditingController(text: response.data["traveller"]["firstName"]);
      lastNameController=new TextEditingController(text: response.data["traveller"]["lastName"]);
      nicController=new TextEditingController(text: response.data["traveller"]["nic"]);
      emailController=new TextEditingController(text: response.data["user"]["email"]);
      telephoneController=new TextEditingController(text: response.data["user"]["telephone"]);
      fName=response.data["traveller"]["firstName"];
      lName=response.data["traveller"]["lastName"];
      nic=response.data["traveller"]["nic"];
      email=response.data["user"]["email"];
      telephone=response.data["user"]["telephone"];
      photo=response.data["traveller"]["photo"];
    });
  }

  void initState() {
    super.initState();
    profileService.getUsertId().then((value) {
      setState(() {
        uID = value;
      });
      profileService.getProfileDetails(getProfileData, uID);
    });
    // getProfileData();
    // WidgetsBinding.instance.addPostFrameCallback((_) => getProfileData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff031925),
      appBar: AppBar(
        // elevation: 20,
        brightness: Brightness.dark,
        // leading: Icon(Icons.arrow_back),
        leading: InkWell(
          onTap: null,
          child: Icon(Icons.arrow_back),
        ),
        title: Center(
          child: Text(
            'Profile',
            style: GoogleFonts.montserrat(),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              detailsEditForm(context);
            },
            icon: Icon(
              Icons.edit,
              color: Colors.white,
            ),
          )
        ],
        backgroundColor: Color(0xff031925),
      ),
      body: SingleChildScrollView(
        child:Column(
          children: [
            Center(
              child: Container(
                alignment: Alignment.bottomRight,
                margin: EdgeInsets.only(top: 20, bottom: 5),
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  // color: Colors.brown,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: photo != null
                      ? NetworkImage(photo)
                      : AssetImage(
                          'assets/images/nodp.png',
                        ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: Ink(
                    decoration: ShapeDecoration(
                      color: Colors.white.withOpacity(0.5),
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.camera_alt,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        _showPicker(context);
                      },
                    ),
                  ),
                ),
              ),
            ),
            
            Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Text(
                '$fName $lName',
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            ProfileDetailsWidget('NIC/Passport', '$nic'),
            DividerWidget(),
            ProfileDetailsWidget('Email', '$email'),
            DividerWidget(),
            ProfileDetailsWidget('Phone', '$telephone'),
            DividerWidget(),
            ProfileDetailsWidget('Account Type', 'Traveller'),

            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              width: 300.0,
              height: 40.0,
              child: ElevatedButton(
                onPressed: deleteAccount,
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  onPrimary: Colors.white,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(15.0),
                  ),
                ),
                child: Text(
                  'Delete account',
                  style: GoogleFonts.montserrat(fontSize: 17),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
