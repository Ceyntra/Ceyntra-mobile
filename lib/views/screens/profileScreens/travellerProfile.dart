import 'package:ceyntra_mobile/service/ProfileService.dart';
import 'package:ceyntra_mobile/views/widgets/dividerWidget.dart';
import 'package:ceyntra_mobile/views/widgets/profileDetailsWidget.dart';
import 'package:flutter/material.dart';
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

  void popUpDialog(BuildContext context) {
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();  
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Something Went Wrong..."),
      content: Text("Profile Photo Update Failed"),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
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
          child: Text('Profile'),
        ),
        actions: [
          IconButton(
            onPressed: null,
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
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            ProfileDetailsWidget('NIC', '$nic'),
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
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
