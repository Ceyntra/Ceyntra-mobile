import 'dart:convert';
import 'dart:io';
import 'package:ceyntra_mobile/views/screens/offersScreens/guide/GuideOfferScreen.dart';
import 'package:ceyntra_mobile/views/screens/offersScreens/widget/updateFormField.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:ceyntra_mobile/models/GuidePackageModel.dart';
import 'package:ceyntra_mobile/views/screens/offersScreens/widget/ImageUploadField.dart';
import 'package:ceyntra_mobile/views/screens/offersScreens/widget/InputFormField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpdateGuideScreen extends StatefulWidget {
  const UpdateGuideScreen({Key key, @required this.guidePackageModel}) 
  : super(key: key);

  //final int userId;
  final GuidePackageModel guidePackageModel;

  @override
  _UpdateGuideScreenState createState() => _UpdateGuideScreenState();
}

class _UpdateGuideScreenState extends State<UpdateGuideScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  GuidePackageModel package;

  String _packageName;
  String _description;
  String _places;
  int _groupCapacity = 1;
  String _language;
  double _price;
  bool _negotiable = true;
  bool _perDay = true;
  File image;
  var imageURL;
  int guideId;

  Widget Title(String title) {
    return (Opacity(
      opacity: 0.64,
      child: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
    ));
  }

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _packageName = widget.guidePackageModel.packageName;
      _description = widget.guidePackageModel.packageDesc;
      _places = widget.guidePackageModel.places;
      _groupCapacity = widget.guidePackageModel.groupCapacity;
      _language = widget.guidePackageModel.language;
      _price = widget.guidePackageModel.price;
      _negotiable = widget.guidePackageModel.negotiable;
      _perDay = widget.guidePackageModel.perDay;
      imageURL = widget.guidePackageModel.imageURL;

    
    });
  }

  Future<void> uploadImage() async {
    FirebaseAuth mAuth = FirebaseAuth.instance;

    final storage = FirebaseStorage.instance;

    if (image != null) {
      var snapshot = await storage
          .ref()
          .child('offers/guide/' +
              widget.guidePackageModel.guideId.toString() +
              '/' +
              image.path.split('/').last)
          .putFile(image);

      var downloadUrl = await snapshot.ref.getDownloadURL();

      setState(() {
        imageURL = downloadUrl;
        image = null;
      });
    } else {
      print('No Image Path Received');
    }
  }

  void setPackageName(String value) {
    _packageName = value;
  }

  void setPackageDesc(String value) {
    _description = value;
  }

  void setPlaces(String value) {
    _places = value;
  }

  void setLanguage(String value) {
    _language = value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff192537),
      appBar: AppBar(
        // elevation: 20,
        brightness: Brightness.dark,
        // leading: Icon(Icons.arrow_back),
        leading: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => GuideOfferScreen()));
          },
          child: Icon(Icons.arrow_back),
        ),
        title: Text(
          'Update Package',
          style: GoogleFonts.montserrat(),
        ),

        backgroundColor: Color(0xff031925),
      ),
      body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Title('Package Name'),

              SizedBox(
                height: 8,
              ),

              //Input Package name field
              UpdateFormField(
                  emptyMsg: "Package name can not be empty",
                  setValue: setPackageName,
                  initialName: widget.guidePackageModel.packageName,
                  maxline: 1,
                  minline: 1),

              SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.white,
              ),
              SizedBox(
                height: 10,
              ),
              Title("Package Description"),
              SizedBox(
                height: 8,
              ),
              UpdateFormField(
                  emptyMsg: "Package Description can not be empty",
                  setValue: setPackageDesc,
                  initialName: widget.guidePackageModel.packageDesc,
                  maxline: 10,
                  minline: 4),

              SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.white,
              ),
              SizedBox(
                height: 10,
              ),
              Title("Places"),
              SizedBox(
                height: 8,
              ),
              UpdateFormField(
                  emptyMsg: "Places can not be empty",
                  setValue: setPlaces,
                  initialName: widget.guidePackageModel.places,
                  maxline: 1,
                  minline: 1),

              SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.white,
              ),
              SizedBox(
                height: 10,
              ),
              Title("Languages"),
              SizedBox(
                height: 8,
              ),
              UpdateFormField(
                  emptyMsg: "Languages can not be empty",
                  setValue: setLanguage,
                  initialName: widget.guidePackageModel.language,
                  maxline: 1,
                  minline: 1),

              SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.white,
              ),
              SizedBox(
                height: 10,
              ),
              Title("Image"),
              SizedBox(
                height: 8,
              ),
              //Image Uploader
              ImageUploadField(setImageState: (img) {
                setState(() {
                  image = img;
                });
              }),

              SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.white,
              ),
              SizedBox(
                height: 10,
              ),
              //No of passengers
              Title("Group Capacity"),
              SizedBox(
                height: 8,
              ),

              Row(
                children: [
                  Expanded(
                      child: Text(
                    "Maximum Group Capacity",
                    style: TextStyle(color: Colors.white),
                  )),
                  Container(
                    child: IconButton(
                      iconSize: 20.0,
                      splashRadius: 20.0,
                      icon: const Icon(
                        Icons.remove_circle_outline,
                        color: Colors.white,
                        size: 25.0,
                      ),
                      onPressed: _groupCapacity > 1
                          ? () {
                              setState(() {
                                _groupCapacity--;
                              });
                            }
                          : null,
                    ),
                  ),
                  Text(_groupCapacity.toString(),
                      style: TextStyle(color: Colors.white)),
                  Container(
                    child: IconButton(
                      iconSize: 20.0,
                      splashRadius: 20.0,
                      icon: const Icon(
                        Icons.add_circle_outline,
                        color: Colors.white,
                        size: 25.0,
                      ),
                      onPressed: () {
                        setState(() {
                          _groupCapacity++;
                        });
                      },
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.white,
              ),
              SizedBox(
                height: 10,
              ),

              //Charging
              Title("Charging Preferances"),
              SizedBox(
                height: 8,
              ),

              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Checkbox(
                          value: _perDay,
                          checkColor: Colors.green,
                          onChanged: (value) {
                            setState(() {
                              if (_perDay == false) {
                                _perDay = !_perDay;
                              }
                            });
                          },
                          fillColor: MaterialStateProperty.all(Colors.green),
                        ),
                        Title("Per day"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Checkbox(
                          value: !_perDay,
                          checkColor: Colors.green,
                          onChanged: (value) {
                            setState(() {
                              if (_perDay == true) {
                                _perDay = !_perDay;
                              }
                            });
                          },
                          fillColor: MaterialStateProperty.all(Colors.green),
                        ),
                        Title("Per Tour"),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.white,
              ),
              SizedBox(
                height: 10,
              ),

              Title("Price"),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                initialValue: widget.guidePackageModel.price.toString(),
                style: TextStyle(color: Colors.black),
                validator: (name) {
                  double p = double.tryParse(name);
                  if (name.isEmpty) {
                    return "Price cannot be empty";
                  } else if (p == null) {
                    return "Invalid value for a price";
                  } else {
                    return null;
                  }
                },
                onSaved: (name) {
                  setState(() {
                    _price = double.parse(name);
                  });
                },
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),

              Row(
                children: [
                  Expanded(child: Title("Negotiable")),
                  Title("No"),
                  Transform.scale(
                      scale: 1,
                      child: Switch(
                        onChanged: (value) {
                          setState(() {
                            _negotiable = !_negotiable;
                          });
                        },
                        value: _negotiable,
                        activeColor: Colors.green,
                        activeTrackColor: Colors.green,
                        inactiveThumbColor: Colors.white,
                        inactiveTrackColor: Colors.white,
                      )),
                  Title("Yes"),
                ],
              ),
              Divider(
                color: Colors.white,
              ),
              SizedBox(
                height: 10,
              ),

              Container(
                width: MediaQuery.of(context).size.width * 0.96,
                child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ))),
                  child: Text("Update Offer"),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      // print("Pressed & Saved! - "+ _packageName);
                      //Upload Image to firebase
                      uploadImage();

                      //Save Data in a model
                      //createPackage();
                      updatePackage(widget.guidePackageModel);
                      successDialog("Update SucessFull");

                      //rest
                      _formKey.currentState.reset();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      ),
    );
    
  }
  void updatePackage(GuidePackageModel packageModel) async {
    packageModel.packageName = _packageName;
    packageModel.packageDesc = _description;
    packageModel.imageURL = imageURL;
    packageModel.perTour = !_perDay;
    packageModel.perDay = _perDay;
    packageModel.price = _price;
    packageModel.language = _language;
    packageModel.places = _places;
    packageModel.groupCapacity = _groupCapacity;
    packageModel.negotiable = _negotiable;

  packageModel.toString();

    http.Response response = await http.put(
      Uri.parse('http://10.0.2.2:9092/updateGuidePackage'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(packageModel.toJson()),
    );

    final messages = json.decode(response.body);
    // print(messages);
  }
 
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
      titlePadding: EdgeInsets.symmetric(horizontal: 25, vertical: 50),

      actions: [
        ElevatedButton(
          child: Text("Done", style: GoogleFonts.montserrat()),
          onPressed: () {
            Navigator.of(context).pop();
            // Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (context) => ComplaintPage()));
            Navigator.push(context, 
            MaterialPageRoute(builder: (context)=> GuideOfferScreen()));
            // deleteAccount();
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.green,
            onPrimary: Colors.white,
          )
        ),
      ],
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
  // void createPackage() async{

  //   GuidePackageModel package=new GuidePackageModel(0,_packageName,_description,_places,imageURL,_language,_groupCapacity,_perDay,!_perDay,_price,_negotiable,widget.userId);
  //   print(package.toString());

  //   http.Response response = await http.post(
  //     Uri.parse('http://10.0.2.2:9092/createGuidePackage'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(package.toJson()),
  //   );
  // }

}
