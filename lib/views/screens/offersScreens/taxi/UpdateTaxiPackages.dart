import 'dart:convert';
import 'package:ceyntra_mobile/models/TaxiPackageModel.dart';
import 'package:ceyntra_mobile/service/PackageService.dart';
import 'package:ceyntra_mobile/service/TaxiPackageService.dart';
import 'package:ceyntra_mobile/views/screens/offersScreens/taxi/TaxiOfferScreen.dart';
import 'package:ceyntra_mobile/views/screens/offersScreens/taxi/taxiPackages.dart';
import 'package:ceyntra_mobile/views/screens/offersScreens/widget/ImageUploadField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:ceyntra_mobile/views/screens/offersScreens/widget/UpdateFormField.dart';

class UpdateTaxiPackageScreen extends StatefulWidget {
  const UpdateTaxiPackageScreen({Key key, @required this.taxiPackageModel}) : super(key: key);

  final TaxiPackageModel taxiPackageModel;

  @override
  _UpdateTaxiPackageScreenState createState() => _UpdateTaxiPackageScreenState();
}

class _UpdateTaxiPackageScreenState extends State<UpdateTaxiPackageScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TaxiPackageModel package;


  String _packageName;

  String _description;

  String _otherFacilities;

  int _numOfPassengers = 1;

  double _price;

  bool _negotiable = true;

  bool _perDay = true;

  File image;

  var imageURL;
  //values for check boxes
  bool withDriver = false;
  bool fuel = false;
  bool fullDayService = false;
  bool ownRoutine = false;
  bool other = false;

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
      _packageName = widget.taxiPackageModel.packageName;
      _description = widget.taxiPackageModel.packageDesc;
      _otherFacilities = widget.taxiPackageModel.otherFacility;
      _price = widget.taxiPackageModel.price;
      withDriver = widget.taxiPackageModel.withDriver;
      fuel = widget.taxiPackageModel.fuel;
      fullDayService = widget.taxiPackageModel.fullDayService;
      ownRoutine = widget.taxiPackageModel.ownRoutine;
      other = widget.taxiPackageModel.other;
      _perDay = widget.taxiPackageModel.perDay;
      _negotiable = widget.taxiPackageModel.negotiable;
      _numOfPassengers = widget.taxiPackageModel.numberOfPassengers;
      imageURL = widget.taxiPackageModel.imageURL;
    });
  }

  
  Future<void> uploadImage() async {
    FirebaseAuth mAuth = FirebaseAuth.instance;

    final storage = FirebaseStorage.instance;

    if (image != null) {
      var snapshot = await storage
          .ref()
          .child('offers/taxi/' +
              widget.taxiPackageModel.taxiId.toString() +
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
   // widget.taxiPackageModel.packageName=value;
  }

  void setPackageDesc(String value) {
   _description = value;
   // widget.taxiPackageModel.packageDesc=value;
  }

  void setOtherFacility(String value) {
    _otherFacilities = value;
     //widget.taxiPackageModel.otherFacility=value;
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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TaxiOfferScreen()
              )
            );
          },
          child: Icon(Icons.arrow_back),
        ),
        title: Text(
            'Update Package',
            style: GoogleFonts.montserrat(),
          ),
        
        backgroundColor: Color(0xff031925),
      ),
    body:SingleChildScrollView(
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
                  initialName: widget.taxiPackageModel.packageName,
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
              //Package Description Input
              UpdateFormField(
                  emptyMsg: "Package Description can not be empty",
                  setValue: setPackageDesc,
                  initialName: widget.taxiPackageModel.packageDesc,
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

              Title("Details"),
              SizedBox(
                height: 8,
              ),

              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Checkbox(
                          value: withDriver,
                          checkColor: Colors.green,
                          onChanged: (value) {
                            setState(() {
                              // this.value = value;
                              withDriver = !withDriver;
                            });
                          },
                          fillColor: MaterialStateProperty.all(Colors.green),
                        ),
                        Title("With Driver"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Checkbox(
                          value: fullDayService,
                          checkColor: Colors.green,
                          onChanged: (value) {
                            setState(() {
                              // this.value = value;
                              fullDayService = !fullDayService;
                            });
                          },
                          fillColor: MaterialStateProperty.all(Colors.green),
                        ),
                        Title("Full Day service"),
                      ],
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Checkbox(
                          value: fuel,
                          checkColor: Colors.green,
                          onChanged: (value) {
                            setState(() {
                              // this.value = value;
                              fuel = !fuel;
                            });
                          },
                          fillColor: MaterialStateProperty.all(Colors.green),
                        ),
                        Title("Fuel"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Checkbox(
                          value: other,
                          checkColor: Colors.green,
                          onChanged: (value) {
                            setState(() {
                              // this.value = value;
                              other = !other;
                            });
                          },
                          fillColor: MaterialStateProperty.all(Colors.green),
                        ),
                        Title("Other"),
                      ],
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Checkbox(
                          value: ownRoutine,
                          checkColor: Colors.green,
                          onChanged: (value) {
                            setState(() {
                              // this.value = value;
                              ownRoutine = !ownRoutine;
                              print("Own routine ");
                              print(ownRoutine);
                            });
                          },
                          fillColor: MaterialStateProperty.all(Colors.green),
                        ),
                        Title("Own Routine"),
                      ],
                    ),
                  ),
                ],
              ),

              other
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        Title("Other Facilities & Service"),

                        SizedBox(
                          height: 8,
                        ),
                        //Package Description Input
                        UpdateFormField(
                            emptyMsg: "Other Facilities can't leave blank",
                            setValue: setOtherFacility,
                            initialName: widget.taxiPackageModel.otherFacility==null?"":widget.taxiPackageModel.otherFacility,
                            maxline: 10,
                            minline: 4),

                        SizedBox(
                          height: 10,
                        ),
                      ],
                    )
                  : SizedBox(
                      height: 10,
                    ),

              Divider(
                color: Colors.white,
              ),
              SizedBox(
                height: 10,
              ),

              //No of passengers
              Title("No of Passengers"),
              SizedBox(
                height: 8,
              ),

              Row(
                children: [
                  Expanded(
                      child: Text(
                    "Maximum Passengers",
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
                      onPressed: _numOfPassengers > 1
                          ? () {
                              setState(() {
                                _numOfPassengers--;
                              });
                            }
                          : null,
                    ),
                  ),
                  Text(_numOfPassengers.toString(),
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
                          _numOfPassengers++;
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
                        Title("Per Km"),
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
                initialValue: widget.taxiPackageModel.price.toString(),
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
                     updatePackage(widget.taxiPackageModel);

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
    ),);
  }

  void updatePackage(TaxiPackageModel packageModel) async {
    packageModel.packageName = _packageName;
    packageModel.packageDesc = _description;
    packageModel.imageURL = imageURL;
    packageModel.withDriver = withDriver;
    packageModel.fuel = fuel;
    packageModel.fullDayService = fullDayService;
    packageModel.ownRoutine = ownRoutine;
    packageModel.other = other;
    packageModel.otherFacility = _otherFacilities;
    packageModel.numberOfPassengers = _numOfPassengers;
    packageModel.perDay = _perDay;
    packageModel.perKm = !_perDay;
    packageModel.price = _price;
    packageModel.negotiable = _negotiable;


    // TaxiPackageModel package = new TaxiPackageModel(
      //  widget.packageId,
      //   _packageName,
      //   _description,
      //   imageURL,
      //   withDriver,
      //   fuel,
      //   fullDayService,
      //   ownRoutine,
      //   other,
      //   _otherFacilities,
      //   _numOfPassengers,
      //   _perDay,
      //   !_perDay,
      //   _price,
      //   _negotiable,
      //   widget.userId,    
      //   );
    print(packageModel.toString());
    
    http.Response response = await http.put(
      Uri.parse('http://10.0.2.2:9092/updateTaxiPackage'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(packageModel.toJson()),
    );

    final messages = json.decode(response.body);
    // print(messages);
  }
}
