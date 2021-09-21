import 'dart:io';
import 'package:ceyntra_mobile/service/GuideProfileService.dart';
import 'package:ceyntra_mobile/views/screens/spHomeScreens/guideHome.dart';
import 'package:ceyntra_mobile/views/widgets/dividerWidget.dart';
import 'package:ceyntra_mobile/views/widgets/profileDetailsWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../firstPage.dart';

class GuideProfileScreen extends StatefulWidget{
  @override
  _GuideProfileScreenState createState() => _GuideProfileScreenState();
}

class _GuideProfileScreenState extends State<GuideProfileScreen> {

  GuideProfileService guideProfileService=new GuideProfileService();
  int gUID=0;
  String gFName="";
  String gLName="";
  String gPhoto="";
  String gEmail="";
  String gTelephone="";
  String gNIC="";
  String description="";
  double gRating=0.0;
  int dayPrice=0;
  String gState="";

  File _imageFiles;
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();

  TextEditingController _firstNameController;
  TextEditingController _lastNameController;
  TextEditingController _nicController;
  TextEditingController _emailController;
  TextEditingController _telephoneController;
  TextEditingController _descriptionController;
  TextEditingController _priceController;

  TextEditingController _currentPController=new TextEditingController();
  TextEditingController _newPController=new TextEditingController();
  TextEditingController _reNewPController=new TextEditingController();
 
  int _radioValue;
  String _updatedVehicleState="";

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

  void getGuidePasswordData(){
    Map<String, dynamic> _passwordDetails = {
      "userID": gUID,
      "currentPassword": _currentPController.text,
      "newPassword": _newPController.text,
    };
    var changedResult=guideProfileService.updateGuidePassword(_passwordDetails);
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

  void getUpdatedGuideData(){
    if(_radioValue==0){
      setState(() {
        _updatedVehicleState="with";
      });
    }else{
      setState(() {
        _updatedVehicleState="without";
      });
    }

    Map<String, dynamic> _updatedDetails = {
      "userID": gUID,
      "firstName": _firstNameController.text,
      "lastName": _lastNameController.text,
      "nic": _nicController.text,
      "email": _emailController.text,
      "contactNumber": _telephoneController.text,
      "pricePerDay": int.parse(_priceController.text),
      "description": _descriptionController.text,
      "vehicleState": _updatedVehicleState,
    };
    var updatedResults=guideProfileService.updateGuideProfileDetails(_updatedDetails);
    updatedResults.then((value) => {
      if (value == 1){
        setState(() {
          successDialog("Profile Updated Successfully");
          gFName=_firstNameController.text;
          gLName=_lastNameController.text;
          gNIC=_nicController.text;
          gEmail=_emailController.text;
          gTelephone=_telephoneController.text;
          dayPrice=int.parse(_priceController.text);
          description=_descriptionController.text;
          gState=_updatedVehicleState;
        }),
      }else{
        setState(() {
          popUpDialog(context, "Something Went Wrong...", "Update Failed");
          _firstNameController.text=gFName;
          _lastNameController.text=gLName;
          _nicController.text=gNIC;
          _emailController.text=gEmail;
          _telephoneController.text=gTelephone;
          _priceController.text=dayPrice.toString();
          _descriptionController.text=description;
          if(gState=="with"){
            setState(() {
              _radioValue=0;
            });
          }else{
              _radioValue=1;
          }
        })
      }
    });
  }

  void guidePasswordEditForm(BuildContext context){
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
                  getGuidePasswordData();
                }
              }
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal:5)),
          ],
        );
      }
    );
  }

  void guideDetailsEditForm(BuildContext context){
    showDialog(
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.7),
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
      builder: (context, setState) {
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
                    controller: _nicController,
                    validator: (val) {
                      return val.isEmpty || val.length < 4
                        ? "NIC should be greater than 4"
                        : null;
                    },
                    decoration: InputDecoration(
                      labelText: 'NIC',
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
                    controller: _descriptionController,
                    maxLines: 5,
                    validator: (val) {
                      return val.isNotEmpty
                        ? null
                        : "Please enter a description";
                    },
                    decoration: InputDecoration(
                      labelText: 'Description to be displayed',
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical:10)),

                  TextFormField(
                    style: GoogleFonts.montserrat(),
                    controller: _priceController,
                    validator: (val) {
                      return RegExp(r"^[0-9]*$").hasMatch(val) && val.isNotEmpty
                        ? null
                        : "Please enter a valid price";
                    },
                    decoration: InputDecoration(
                      labelText: 'Price (/day) in LKR',
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical:10)),

                  Text("Vehicle State", style:GoogleFonts.montserrat(fontSize: 13)),

                  Row(
                    children: [
                       new Radio(
                        value: 0,
                        groupValue: _radioValue,
                        onChanged: (int value){
                          setState(() {
                            _radioValue=value;
                          });
                        },
                      ),
                      new Text(
                        'With vehicle',
                        style: GoogleFonts.montserrat(fontSize: 16.0),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      new Radio(
                        value: 1,
                        groupValue: _radioValue,
                        onChanged: (int value){
                          setState(() {
                            _radioValue=value;
                          });
                        },
                      ),
                      new Text(
                        'Without vehicle',
                        style: GoogleFonts.montserrat(fontSize: 16.0),
                      ),
                    ],
                  )      
                ],
              ),
            ),
          ),
          actions: [
            ElevatedButton(
              child: Text("Cancel", style: GoogleFonts.montserrat()),
              onPressed: () {
                Navigator.of(context).pop();
                _firstNameController.text=gFName;
                _lastNameController.text=gLName;
                _nicController.text=gNIC;
                _emailController.text=gEmail;
                _telephoneController.text=gTelephone;
                _priceController.text=dayPrice.toString();
                _descriptionController.text=description;
                if(gState=="with"){
                  setState(() {
                    _radioValue=0;
                  });
                }else{
                  setState(() {
                    _radioValue=1;
                  });
                }
              }
            ),
            ElevatedButton(
              child: Text("Save Changes", style: GoogleFonts.montserrat()),
              onPressed: () {
                if (_formKey1.currentState.validate()) {
                  Navigator.of(context).pop();
                  getUpdatedGuideData();
                }
              }
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal:5)),
          ],
        );
      }
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
      _imageFiles = File(pickedFile.path);
      if(_imageFiles != null){
        //way to store the image and retreiving the link of it need to be done
        //here took a dummy link to proceed
        String newPhotoGuide="https://firebasestorage.googleapis.com/v0/b/ceyntra-project.appspot.com/o/profile_photos%2Fpp.jpg?alt=media&token=03b89c18-f56c-4831-a497-92433a99f42c";
        var result=guideProfileService.updateGuideProfilePhoto(newPhotoGuide, gUID);
        result.then((value) => {
          if (value == 1){
            setState(() {
              gPhoto=newPhotoGuide;
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
        String newPhotoGuide="https://firebasestorage.googleapis.com/v0/b/ceyntra-project.appspot.com/o/profile_photos%2Fpp.jpg?alt=media&token=03b89c18-f56c-4831-a497-92433a99f42c";
        var result=guideProfileService.updateGuideProfilePhoto(newPhotoGuide, gUID);
        result.then((value) => {
          if (value == 1){
            setState(() {
              gPhoto=newPhotoGuide;
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

  void _deleteAccount(){
    var deleteResult=guideProfileService.removeGuideAccount(gUID);
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

  void _confirmDialog(){
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
            _deleteAccount();
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

  void getGuideProfileData(response){
    setState(() {
      _firstNameController=new TextEditingController(text: response.data["guide"]["first_name"]);
      _lastNameController=new TextEditingController(text: response.data["guide"]["last_name"]);
      _nicController=new TextEditingController(text: response.data["guide"]["nic"]);
      _emailController=new TextEditingController(text: response.data["contact"]["email"]);
      _telephoneController=new TextEditingController(text: response.data["contact"]["telephone"]);
      _descriptionController=new TextEditingController(text: response.data["guide"]["description"]);
      _priceController=new TextEditingController(text: (response.data["guide"]["per_day_price"]).toString());
      gFName=response.data["guide"]["first_name"];
      gLName=response.data["guide"]["last_name"];
      gPhoto=response.data["guide"]["profile_photo"];
      gEmail=response.data["contact"]["email"];
      gTelephone=response.data["contact"]["telephone"];
      gNIC=response.data["guide"]["nic"];
      description=response.data["guide"]["description"];
      gRating=response.data["guide"]["rating"];
      dayPrice=response.data["guide"]["per_day_price"];
      gState=response.data["guide"]["vehicle_state"];
    });
    if(gState=="with"){
      setState(() {
        _radioValue=0;
      });
    }else{
      setState(() {
        _radioValue=1;
      });
    }
  }

  void initState() {
    super.initState();
    guideProfileService.getGuideUsertId().then((value) {
      setState(() {
        gUID = value;
      });
      guideProfileService.getGuideProfileDetails(getGuideProfileData, gUID);
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
            Navigator.pop(context);
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
            onPressed: () {
              guideDetailsEditForm(context);
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
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: gPhoto != ""
                      ? NetworkImage(gPhoto)
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
                '$gFName $gLName',
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
                      text: '$gRating ',
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
            ProfileDetailsWidget('NIC', '$gNIC'),
            DividerWidget(),
            ProfileDetailsWidget('Email', '$gEmail'),
            DividerWidget(),
            ProfileDetailsWidget('Phone', '$gTelephone'),
            DividerWidget(),
            ProfileDetailsWidget('Description', '$description'),
            DividerWidget(),
            ProfileDetailsWidget('Price (/day)', '$dayPrice LKR'),
            DividerWidget(),
            ProfileDetailsWidget('Vehicle State', '$gState vehicle'),
            DividerWidget(),
            ProfileDetailsWidget('Account Type', 'Guide'),

            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              width: 300.0,
              height: 40.0,
              child: ElevatedButton(
                onPressed: () {
                  guidePasswordEditForm(context);
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
                onPressed: _confirmDialog,
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
