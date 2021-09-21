import 'dart:io';

import 'package:ceyntra_mobile/service/PlaceService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ceyntra_mobile/views/screens/offersScreens/widget/InputFormField.dart';
import 'package:ceyntra_mobile/views/screens/offersScreens/widget/ThreeImageUploadField.dart';

class AddNewPlaceScreen extends StatefulWidget {
  // const AddNewPlaceScreen({ Key? key }) : super(key: key);

  final Function pressed;
  final bool isPressed;
  final Function setNull;

  File image;
  AddNewPlaceScreen({this.pressed, this.isPressed: true, this.setNull});

  @override
  _AddNewPlaceScreenState createState() => _AddNewPlaceScreenState();
}

class _AddNewPlaceScreenState extends State<AddNewPlaceScreen> {
  PlaceService placeService = new PlaceService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget Title(String title) {
    return (Opacity(
      opacity: 0.64,
      child: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
    ));
  }

  String placeName;
  String placeDescription;
  File image1;
  File image2;
  File image3;
  String image1Url;
  String image2Url;
  String image3Url;

  double currenPlaceLatitude = 0.0;
  double currentPlaceLongitude = 1.0;

  Future<Position> getCurrentPosition() async {
    print("skdjf");
    final geoPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    // print(geoPosition);
    return geoPosition;
  }

  void setimage1(name) {
    setState(() {
      image1 = name;
    });
  }

  void setimage2(name) {
    setState(() {
      image2 = name;
    });
  }

  void setimage3(name) {
    setState(() {
      image3 = name;
    });
  }

  // void setlatitude(name) {
  //   setState(() {
  //     latitude = double.parse(name);
  //   });
  // }

  // void setlongitude(name) {
  //   setState(() {
  //     longitude = double.parse(name);
  //   });
  // }
  TextEditingController placeNameTec = new TextEditingController();
  TextEditingController descriptionTec = new TextEditingController();
  TextEditingController districtTec = new TextEditingController();
  TextEditingController latitudeTec = new TextEditingController();
  TextEditingController longitudeTec = new TextEditingController();

  Future<List<String>> uploadFiles(List<File> _images) async {
    var imageUrls =
        await Future.wait(_images.map((_image) => uploadImg(_image)));
    print(imageUrls);
    return imageUrls;
  }

  Future<String> uploadImg(File image1) async {
    final storage = FirebaseStorage.instance;

    var snapshot1 = await storage
        .ref()
        .child('place/' + placeNameTec.text + "/" + image1.path.split('/').last)
        .putFile(image1);

    var downloadUrl1 = await snapshot1.ref.getDownloadURL();

    return downloadUrl1;
  }

  void popUpDialog(BuildContext context, String title, String content) {
    var alert = AlertDialog(
      title: Text(title),
      content: Text(content),
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  @override
  void initState() {
    super.initState();

    getCurrentPosition().then((value) {
      setState(() {
        print(value.latitude);
        currenPlaceLatitude = value.latitude;
        currentPlaceLongitude = value.longitude;
      });
    });
  }

  Widget build(BuildContext context) {
    print(image1Url);
    print(currenPlaceLatitude);
    return Scaffold(
      backgroundColor: Color(0xff192537),
      appBar: AppBar(
        title: Text(
          "Add new place",
          style: GoogleFonts.montserrat(fontSize: 18),
        ),
        leading: widget.isPressed
            ? InkWell(
                onTap: () {
                  widget.setNull();

                  widget.pressed(0.0, 0.0, 1.0, false);
                },
                child: Icon(Icons.arrow_back))
            : InkWell(
                onTap: () {
                  widget.setNull();

                  widget.pressed((MediaQuery.of(context).size.width / 100) * 70,
                      70.0, 0.8, true);
                },
                child: Icon(
                  Icons.menu,
                )),
        backgroundColor: Color(0xff192537),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
            key: _formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Title('Place Name'),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: placeNameTec,
                style: TextStyle(color: Colors.black),
                maxLines: 5,
                minLines: 1,
                validator: (name) {
                  if (name.isEmpty) {
                    return "Place name cannot be null";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(15.0),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              Divider(
                color: Colors.white,
              ),
              SizedBox(
                height: 10,
              ),
              Title('Place Description'),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: descriptionTec,
                style: TextStyle(color: Colors.black),
                maxLines: 5,
                minLines: 1,
                validator: (name) {
                  if (name.isEmpty) {
                    return "Description cannot be null";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(15.0),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              Divider(
                color: Colors.white,
              ),
              SizedBox(
                height: 10,
              ),
              Title("Images"),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ImageUploadField(setImageState: setimage1),
                  ImageUploadField(setImageState: setimage2),
                  ImageUploadField(setImageState: setimage3),
                ],
              ),
              Divider(
                color: Colors.white,
              ),
              SizedBox(
                height: 10,
              ),
              Title('District'),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: districtTec,
                style: TextStyle(color: Colors.black),
                maxLines: 5,
                minLines: 1,
                validator: (name) {
                  if (name.isEmpty) {
                    return "district cannot be null";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(15.0),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              Divider(
                color: Colors.white,
              ),
              SizedBox(
                height: 10,
              ),
              Title('Place Latitude ( current latitude ' +
                  currenPlaceLatitude.toString() +
                  ")"),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.black),
                maxLines: 5,
                minLines: 1,
                controller: latitudeTec,
                validator: (name) {
                  if (name.isEmpty) {
                    return "lattitude cannot be null";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(15.0),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              Divider(
                color: Colors.white,
              ),
              SizedBox(
                height: 10,
              ),
              Title('Place Longitude ( current longitude ' +
                  currentPlaceLongitude.toString() +
                  ")"),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: longitudeTec,
                style: TextStyle(color: Colors.black),
                maxLines: 5,
                minLines: 1,
                validator: (name) {
                  if (name.isEmpty) {
                    return "Longitude cannot be null";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(15.0),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              Divider(
                color: Colors.white,
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.96,
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ))),
                    child: Text("Add Place"),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        if (image1 != null &&
                            image2 != null &&
                            image3 != null) {
                          List<File> imgs = [image1, image2, image3];
                          uploadFiles(imgs).then((value) {
                            placeService
                                .addNewPlace(
                                    placeNameTec.text,
                                    value,
                                    descriptionTec.text,
                                    districtTec.text,
                                    latitudeTec.text,
                                    longitudeTec.text)
                                .then((value1) {
                              if (value1 == 1) {
                                placeNameTec.text = "";
                                descriptionTec.text = "";
                                districtTec.text = "";
                                latitudeTec.text = "";
                                longitudeTec.text = "";
                                setState(() {
                                  image1 = null;
                                  image2 = null;
                                  image3 = null;
                                });
                                popUpDialog(context, "Place is added!", "");
                              } else {
                                popUpDialog(context, "Place is not added!", "");
                              }
                            });
                          });
                        } else {
                          print("please add photos");
                        }
                      }
                    }),
              ),
            ])),
      )),
    );
  }
}
