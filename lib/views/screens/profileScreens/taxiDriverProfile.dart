import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:ceyntra_mobile/service/TaxiProfileService.dart';
import 'package:ceyntra_mobile/views/widgets/dividerWidget.dart';
import 'package:ceyntra_mobile/views/widgets/profileDetailsWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaxiDriverProfileScreen extends StatefulWidget{
  @override
  _TaxiDriverProfileScreenState createState() => _TaxiDriverProfileScreenState();
}

class _TaxiDriverProfileScreenState extends State<TaxiDriverProfileScreen> {

  TaxiProfileService taxiProfileService=new TaxiProfileService();
  int tUID=0;
  String tFName="";
  String tLName="";
  String tPhoto="";
  String tEmail="";
  String tTelephone="";
  String dlNo="";
  String workingLocation="";
  double tRating=0.0;

  File imageFiles;
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();

  TextEditingController _firstNameController;
  TextEditingController _lastNameController;
  TextEditingController _licenseController;
  TextEditingController _emailController;
  TextEditingController _telephoneController;
  TextEditingController _locationController=new TextEditingController();

  TextEditingController _currentPController=new TextEditingController();
  TextEditingController _newPController=new TextEditingController();
  TextEditingController _reNewPController=new TextEditingController();

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

  void getDriverPasswordData(){
    Map<String, dynamic> _passwordDetails = {
      "userID": tUID,
      "currentPassword": _currentPController.text,
      "newPassword": _newPController.text,
    };
    var changedResult=taxiProfileService.updateDriverPassword(_passwordDetails);
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
      _currentPController.text="";
      _newPController.text="";
      _reNewPController.text="";
    });
  }

  void getUpdatedDriverData(){
    Map<String, dynamic> _updatedDetails = {
      "userID": tUID,
      "firstName": _firstNameController.text,
      "lastName": _lastNameController.text,
      "license": _licenseController.text,
      "email": _emailController.text,
      "contactNumber": _telephoneController.text,
    };
    var updatedResults=taxiProfileService.updateTaxiProfileDetails(_updatedDetails);
    updatedResults.then((value) => {
      if (value == 1){
        setState(() {
          successDialog("Profile Updated Successfully");
          tFName=_firstNameController.text;
          tLName=_lastNameController.text;
          dlNo=_licenseController.text;
          tEmail=_emailController.text;
          tTelephone=_telephoneController.text;
        })
      }else{
        popUpDialog(context, "Something Went Wrong...", "Update Failed")
      }
    });
  }

  void driverPasswordEditForm(BuildContext context){
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
                    controller: _currentPController,
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
                    controller: _newPController,
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
                    controller: _reNewPController,
                    validator: (val) {
                      return _newPController.text==_reNewPController.text
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
                _currentPController.text="";
                _newPController.text="";
                _reNewPController.text="";
              }
            ),
            ElevatedButton(
              child: Text("Save Changes", style: GoogleFonts.montserrat()),
              onPressed: () {
                if (_formKey2.currentState.validate()) {
                  Navigator.of(context).pop();
                  getDriverPasswordData();
                }
              }
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal:5)),
          ],
        );
      }
    );
  }

  void driverDetailsEditForm(BuildContext context){
    showDialog(
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.7),
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
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
                    style: GoogleFonts.montserrat(),
                    controller: _firstNameController,
                    validator: (val) {
                      return val.isEmpty
                        ? "First name cannot be empty"
                        : null;
                    },
                    decoration: InputDecoration(
                      labelText: 'First Name',
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical:10)),

                  TextFormField(
                    style: GoogleFonts.montserrat(),
                    controller: _lastNameController,
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
                    controller: _licenseController,
                    validator: (val) {
                      return val.isEmpty || val.length < 4
                        ? "License No. should be greater than 4"
                        : null;
                    },
                    decoration: InputDecoration(
                      labelText: 'License No.',
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical:10)),

                  TextFormField(
                    style: GoogleFonts.montserrat(),
                    controller: _emailController,
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
                    controller: _telephoneController,
                    validator: (val) {
                      return RegExp(r"^[0-9]*$").hasMatch(val) && val.length > 8
                        ? null
                        : "Please enter a valid phone number";
                    },
                    decoration: InputDecoration(
                      labelText: 'Telephone',
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical:10)),

                  TextFormField(
                    style: GoogleFonts.montserrat(),
                    controller: _locationController,
                    decoration: InputDecoration(
                      labelText: 'Working Location',
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
                _firstNameController.text=tFName;
                _lastNameController.text=tLName;
                _licenseController.text=dlNo;
                _emailController.text=tEmail;
                _telephoneController.text=tTelephone;
                _locationController.text="";
              }
            ),
            ElevatedButton(
              child: Text("Save Changes", style: GoogleFonts.montserrat()),
              onPressed: () {
                if (_formKey1.currentState.validate()) {
                  Navigator.of(context).pop();
                  getUpdatedDriverData();
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
      imageFiles = File(pickedFile.path);
      if(imageFiles != null){
        //way to store the image and retreiving the link of it need to be done
        //here took a dummy link to proceed
        String newPhotoTaxi="https://firebasestorage.googleapis.com/v0/b/ceyntra-project.appspot.com/o/profile_photos%2Fpp.jpg?alt=media&token=03b89c18-f56c-4831-a497-92433a99f42c";
        var result=taxiProfileService.updateTaxiProfilePhoto(newPhotoTaxi, tUID);
        result.then((value) => {
          if (value == 1){
            setState(() {
              tPhoto=newPhotoTaxi;
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
      imageFiles = File(pickedFile.path);
      if(imageFiles != null){
        //way to store the image and retreiving the link of it need to be done
        //here took a dummy link to proceed
        String newPhotoTaxi="https://firebasestorage.googleapis.com/v0/b/ceyntra-project.appspot.com/o/profile_photos%2Fpp.jpg?alt=media&token=03b89c18-f56c-4831-a497-92433a99f42c";
        var result=taxiProfileService.updateTaxiProfilePhoto(newPhotoTaxi, tUID);
        result.then((value) => {
          if (value == 1){
            setState(() {
              tPhoto=newPhotoTaxi;
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

  void getTaxiProfileData(response){
    setState(() {
      _firstNameController=new TextEditingController(text: response.data["taxiDriver"]["first_name"]);
      _lastNameController=new TextEditingController(text: response.data["taxiDriver"]["last_name"]);
      _licenseController=new TextEditingController(text: response.data["taxiDriver"]["driver_license"]);
      _emailController=new TextEditingController(text: response.data["contact"]["email"]);
      _telephoneController=new TextEditingController(text: response.data["contact"]["telephone"]);
      tFName=response.data["taxiDriver"]["first_name"];
      tLName=response.data["taxiDriver"]["last_name"];
      tPhoto=response.data["taxiDriver"]["profile_photo"];
      tEmail=response.data["contact"]["email"];
      tTelephone=response.data["contact"]["telephone"];
      dlNo=response.data["taxiDriver"]["driver_license"];
      tRating=response.data["taxiDriver"]["rating"];
    });
  }

  void initState() {
    super.initState();
    taxiProfileService.getTaxiUsertId().then((value) {
      setState(() {
        tUID = value;
      });
      taxiProfileService.getTaxiProfileDetails(getTaxiProfileData, tUID);
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
              driverDetailsEditForm(context);
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
                    image: tPhoto != ""
                      ? NetworkImage(tPhoto)
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
                '$tFName $tLName',
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
                      text: '$tRating ',
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
            ProfileDetailsWidget('DrivingLicense No.', '$dlNo'),
            DividerWidget(),
            ProfileDetailsWidget('Email', '$tEmail'),
            DividerWidget(),
            ProfileDetailsWidget('Phone', '$tTelephone'),
            DividerWidget(),
            ProfileDetailsWidget('Working Location', '--'),
            DividerWidget(),
            ProfileDetailsWidget('Account Type', 'Taxi Driver'),

            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              width: 300.0,
              height: 40.0,
              child: ElevatedButton(
                onPressed: () {
                  driverPasswordEditForm(context);
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
              margin: EdgeInsets.only(bottom: 30),
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
