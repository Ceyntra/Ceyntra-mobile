import 'dart:io';

import 'package:ceyntra_mobile/service/HotelProfileService.dart';
import 'package:ceyntra_mobile/views/screens/spHomeScreens/hotelHome.dart';
import 'package:ceyntra_mobile/views/widgets/dividerWidget.dart';
import 'package:ceyntra_mobile/views/widgets/profileDetailsWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class HotelProfileScreen extends StatefulWidget{
  @override
  _HotelProfileScreenState createState() => _HotelProfileScreenState();
}

class _HotelProfileScreenState extends State<HotelProfileScreen> {
  HotelProfileService hotelProfileService=new HotelProfileService();

  int hID=0;
  String hName="";
  String hPhoto="";
  String hEmail="";
  String hTelephone="";
  String hDescription;
  String hRegistration;
  String hLocation="";
  double hRating=0.0;

  File _imageFiles;

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
      _imageFiles = File(pickedFile.path);
      if(_imageFiles != null){
        //way to store the image and retreiving the link of it need to be done
        //here took a dummy link to proceed
        String newPhotoHotel="https://firebasestorage.googleapis.com/v0/b/ceyntra-project.appspot.com/o/profile_photos%2Fpp.jpg?alt=media&token=03b89c18-f56c-4831-a497-92433a99f42c";
        var result=hotelProfileService.updateHotelProfilePhoto(newPhotoHotel, hID);
        result.then((value) => {
          if (value == 1){
            setState(() {
              hPhoto=newPhotoHotel;
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
      _imageFiles = File(pickedFile.path);
      if(_imageFiles != null){
        //way to store the image and retreiving the link of it need to be done
        //here took a dummy link to proceed
        String newPhotoHotel="https://firebasestorage.googleapis.com/v0/b/ceyntra-project.appspot.com/o/profile_photos%2Fpp.jpg?alt=media&token=03b89c18-f56c-4831-a497-92433a99f42c";
        var result=hotelProfileService.updateHotelProfilePhoto(newPhotoHotel, hID);
        result.then((value) => {
          if (value == 1){
            setState(() {
              hPhoto=newPhotoHotel;
            })
          }else{
            popUpDialog(context, "Something Went Wrong...", "Update Failed")
          }
        });
      }else{
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

  }

  void getHotelProfileData(response){
    setState(() {
      hName=response.data["hotel"]["name"];
      hPhoto=response.data["hotel"]["profile_photo"];
      hEmail=response.data["contact"]["email"];
      hTelephone=response.data["contact"]["telephone"];
      hDescription=response.data["hotel"]["description"];
      hRegistration=response.data["hotel"]["registration_number"];
      hRating=response.data["hotel"]["rating"];
    });
  }

  void initState() {
    super.initState();
    hotelProfileService.getHotelUsertId().then((value) {
      setState(() {
        hID = value;
      });
      hotelProfileService.getHotelProfileDetails(getHotelProfileData, hID);
    });
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
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HotelHomeScreen()
              )
            );
          },
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
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: hPhoto != ""
                      ? NetworkImage(hPhoto)
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
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                '$hName',
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '$hRating ',
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    WidgetSpan(
                        child: Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 22
                        ),
                    ),
                  ],
                ),
              )
            ),
            ProfileDetailsWidget('Registration No.', '$hRegistration'),
            DividerWidget(),
            ProfileDetailsWidget('Email', '$hEmail'),
            DividerWidget(),
            ProfileDetailsWidget('Phone', '$hTelephone'),
            DividerWidget(),
            ProfileDetailsWidget('Description', '$hDescription'),
            DividerWidget(),
            ProfileDetailsWidget('Location', '--'),
            DividerWidget(),
            ProfileDetailsWidget('Account Type', 'Hotel'),

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
