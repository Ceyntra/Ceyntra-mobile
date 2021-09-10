import 'package:ceyntra_mobile/service/ProfileService.dart';
import 'package:ceyntra_mobile/views/widgets/dividerWidget.dart';
import 'package:ceyntra_mobile/views/widgets/profileDetailsWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../firstPage.dart';

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
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();

  TextEditingController firstNameController;
  TextEditingController lastNameController;
  TextEditingController nicController;
  TextEditingController emailController;
  TextEditingController telephoneController;

  TextEditingController currentPController=new TextEditingController();
  TextEditingController newPController=new TextEditingController();
  TextEditingController reNewPController=new TextEditingController();

  void successDialog(sentence){
    AlertDialog alert = AlertDialog(
      title: Column(
        children: [
          Icon(
            Icons.done_all,
            color: Colors.green,
            size: 80,
          ),
          Text(sentence, style: GoogleFonts.montserrat(), textAlign: TextAlign.center)
        ],
      ),
      titlePadding: EdgeInsets.symmetric(horizontal: 25, vertical: 50)
    );

    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.7),
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 3), () {
          Navigator.of(context).pop();
        });
        return alert;
      });
  }

  void getPasswordData(){
    Map<String, dynamic> passwordDetails = {
      "userID": uID,
      "currentPassword": currentPController.text,
      "newPassword": newPController.text,
    };
    var changedResult=profileService.updatePassword(passwordDetails);
    changedResult.then((value) => {
      if (value == 1){
        successDialog("Password Changed Successfully")
      }else if(value == 2){
        popUpDialog(context, "Current Password you entered is incorrect", "Update Failed")
      }else{
        popUpDialog(context, "Something Went Wrong...", "Update Failed")
      }
    });
    setState(() {
      currentPController.text="";
      newPController.text="";
      reNewPController.text="";
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
          successDialog("Profile Updated Successfully");
          fName=firstNameController.text;
          lName=lastNameController.text;
          nic=nicController.text;
          email=emailController.text;
          telephone=telephoneController.text;
        })
      }else{
        setState(() {
          popUpDialog(context, "Something Went Wrong...", "Update Failed");
          firstNameController.text=fName;
          lastNameController.text=lName;
          nicController.text=nic;
          emailController.text=email;
          telephoneController.text=telephone;
        })
      }
    });
  }

  void passwordEditForm(BuildContext context){
    showDialog(
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.7),
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          title: Text('Change Password', style: GoogleFonts.montserrat()),
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    obscureText: true,
                    style: GoogleFonts.montserrat(),
                    controller: currentPController,
                    validator: (val) {
                      return val.isEmpty
                        ? "Please enter the current password"
                        : null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Enter the current password',
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical:10)),

                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    obscureText: true,
                    style: GoogleFonts.montserrat(),
                    controller: newPController,
                    validator: (val){
                      String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                      RegExp regExp = new RegExp(pattern);
                      return regExp.hasMatch(val)
                        ? null
                        : "Please enter a strong password with atleast 8 characters ([a][A][1][!])";
                    },
                    decoration: InputDecoration(
                      labelText: 'Enter the new password',
                      errorMaxLines: 2
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical:10)),

                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    obscureText: true,
                    style: GoogleFonts.montserrat(),
                    controller: reNewPController,
                    validator: (val) {
                      return newPController.text==reNewPController.text
                        ? null
                        : "Does not match with above password";
                    },
                    decoration: InputDecoration(
                      labelText: 'Re-type the new password',
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
                currentPController.text="";
                newPController.text="";
                reNewPController.text="";
              }
            ),
            ElevatedButton(
              child: Text("Save Changes", style: GoogleFonts.montserrat()),
              onPressed: () {
                if (_formKey2.currentState.validate()) {
                  Navigator.of(context).pop();
                  getPasswordData();
                }
              }
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal:5)),
          ],
        );
      }
    );
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
              key: _formKey1,
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
                if (_formKey1.currentState.validate()) {
                  Navigator.of(context).pop();
                  getUpdatedData();
                }
              }
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal:5)),
          ],
        );
      }
    );
  }

  void popUpDialog(BuildContext context, sentence1, sentence2) {
    Widget okButton = TextButton(
      child: Text("OK", style: GoogleFonts.montserrat()),
      onPressed: () {
        Navigator.of(context).pop();  
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text(sentence1, style: GoogleFonts.montserrat()),
      content: Text(sentence2, style: GoogleFonts.montserrat()),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.7),
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
            popUpDialog(context, "Something Went Wrong...", "Update Failed")
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
            setState(() {
              photo=newPhoto;
            })
          }else{
            popUpDialog(context, "Something Went Wrong...", "Update Failed")
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

  void deleteAccount(){
    var deleteResult=profileService.removeAccount(uID);
    deleteResult.then((value) => {
      if (value == 1){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FirstPageScreen()),
        )
      }else{
        popUpDialog(context, "Something Went Wrong...", "Account Deletion Failed")
      }
    });
  }

  void confirmDialog(){
    AlertDialog alert = AlertDialog(
      title: Column(
        children: [
          Icon(
            Icons.warning_amber_outlined,
            color: Colors.red,
            size: 80,
          ),
          Text("Are you sure?", style: GoogleFonts.montserrat(), textAlign: TextAlign.center)
        ],
      ),
      titlePadding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      content: Text("This action will delete your account permanently", style: GoogleFonts.montserrat(), textAlign: TextAlign.center),
      actions: [
        ElevatedButton(
          child: Text("Cancel", style: GoogleFonts.montserrat()),
          onPressed: () {
            Navigator.of(context).pop();
          }
        ),
        ElevatedButton(
          child: Text("OK", style: GoogleFonts.montserrat()),
          onPressed: () {
            Navigator.of(context).pop();
            deleteAccount();
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
            onPrimary: Colors.white,
          )
        ),
        Padding(padding: EdgeInsets.symmetric(horizontal:5)),
      ],
    );

    showDialog(
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.9),
      context: context,
      builder: (BuildContext context) {
        return alert;
      }
    );
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
                onPressed: () {
                  passwordEditForm(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff2d9cdb),
                  onPrimary: Colors.white,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(15.0),
                  ),
                ),
                child: Text(
                  'Change Password',
                  style: GoogleFonts.montserrat(fontSize: 17),
                ),
              ),
            ),
            Container(
              // margin: EdgeInsets.symmetric(vertical: 30),
              width: 300.0,
              height: 40.0,
              child: ElevatedButton(
                onPressed: confirmDialog,
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
