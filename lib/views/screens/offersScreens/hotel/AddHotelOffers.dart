import 'dart:convert';
import 'package:ceyntra_mobile/models/HotelPackageModel.dart';
import 'package:ceyntra_mobile/views/screens/offersScreens/widget/ImageUploadField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:ceyntra_mobile/views/screens/offersScreens/widget/InputFormField.dart';

class AddHotelOfferScreen extends StatefulWidget {
  const AddHotelOfferScreen({Key key, @required this.userId}) : super(key: key);

  final int userId;

  @override
  _AddHotelOfferScreenState createState() => _AddHotelOfferScreenState();
}

class _AddHotelOfferScreenState extends State<AddHotelOfferScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  HotelPackageModel package;

  String _packageName;

  String _description;

  String _otherFacilities;

  int _roomCapacity = 1;

  double _price;

  bool _negotiable = true;

  bool _perDay = true;

  File image;

  var imageURL;

  //values for check boxes
  bool withAC = false;
  bool swimPool = false;
  bool meal = false;
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

  Future<void> uploadImage() async {
    final storage = FirebaseStorage.instance;

    if (image != null) {
      var snapshot = await storage
          .ref()
          .child('offers/hotel/' +
              widget.userId.toString() +
              '/' +
              image.path.split('/').last)
          .putFile(image);

      var downloadUrl = await snapshot.ref.getDownloadURL();

      setState(() {
        imageURL = downloadUrl;
        image = null;
        print(imageURL);
      });
    } else {
      print('No Image Path Received');
    }
  }

  void setPackageName(String value) {
    setState(() {
      _packageName = value;
    });
  }

  void setPackageDesc(String value) {
    setState(() {
      _description = value;
    });
  }

  void setOtherFacility(String value) {
    setState(() {
      _otherFacilities = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
              InputFormField(
                  emptyMsg: "Package name can not be empty",
                  setValue: setPackageName,
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
              InputFormField(
                  emptyMsg: "Package Description can not be empty",
                  setValue: setPackageDesc,
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
                          value: withAC,
                          checkColor: Colors.green,
                          onChanged: (value) {
                            setState(() {
                              // this.value = value;
                              withAC = !withAC;
                            });
                          },
                          fillColor: MaterialStateProperty.all(Colors.green),
                        ),
                        Title("With AC"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Checkbox(
                          value: swimPool,
                          checkColor: Colors.green,
                          onChanged: (value) {
                            setState(() {
                              // this.value = value;
                              swimPool = !swimPool;
                            });
                          },
                          fillColor: MaterialStateProperty.all(Colors.green),
                        ),
                        Title("Swim Pool"),
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
                          value: meal,
                          checkColor: Colors.green,
                          onChanged: (value) {
                            setState(() {
                              // this.value = value;
                              meal = !meal;
                            });
                          },
                          fillColor: MaterialStateProperty.all(Colors.green),
                        ),
                        Title("Meal"),
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
                        InputFormField(
                            emptyMsg: "Other Facilities can't leave blank",
                            setValue: setOtherFacility,
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
              Title("Room Capacity"),
              SizedBox(
                height: 8,
              ),

              Row(
                children: [
                  Expanded(
                      child: Text(
                    "Max Room Capacity",
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
                      onPressed: _roomCapacity > 1
                          ? () {
                              setState(() {
                                _roomCapacity--;
                              });
                            }
                          : null,
                    ),
                  ),
                  Text(_roomCapacity.toString(),
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
                          _roomCapacity++;
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
                        Title("Per Package"),
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
                  child: Text("Add Offer"),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      // print("Pressed & Saved! - "+ _packageName);
                      //Upload Image to firebase

                      //Save Data in a model
                      createPackage();

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
    );
  }

  void createPackage() async {
    await uploadImage();

    HotelPackageModel package = new HotelPackageModel(
        _packageName,
        _description,
        imageURL,
        withAC,
        swimPool,
        meal,
        other,
        _otherFacilities,
        _roomCapacity,
        _perDay,
        !_perDay,
        _price,
        _negotiable,
        widget.userId);

    print(package.toString());

    http.Response response = await http.post(
      Uri.parse('http://10.0.2.2:9092/createHotelPackage'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(package.toJson()),
    );

    // final messages = json.decode(response.body);
    // // print(messages);
  }
}
