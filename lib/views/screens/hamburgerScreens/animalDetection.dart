import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ceyntra_mobile/views/widgets/greenTagWidget.dart';
import 'package:tflite/tflite.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AnimalDetectionScreen extends StatefulWidget {
  // const AnimalDetectionScreen({ Key? key }) : super(key: key);
  final Function pressed;
  final bool isPressed;
  final Function setNull;
  AnimalDetectionScreen({this.pressed, this.isPressed, this.setNull});

  @override
  _AnimalDetectionScreenState createState() => _AnimalDetectionScreenState();
}

class _AnimalDetectionScreenState extends State<AnimalDetectionScreen> {
  File imageFile;
  List _results;
  String queryResults;
  var link;

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future _imgFromCamera() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    imageClassification(pickedFile);
    setState(() {
      imageFile = File(pickedFile.path);
    });
  }

  Future _imgFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    imageClassification(pickedFile);
    setState(() {
      imageFile = File(pickedFile.path);
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
                      }),
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
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff192537),
      appBar: AppBar(
        title: Text(
          "Ceyntra animal identification",
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
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: GreenTagWidget(
                title: "Photo",
              ),
            ),
            imageFile != null
                ? Container(
                    margin: EdgeInsets.only(right: 10, left: 10),
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      image: DecorationImage(
                        image: FileImage(imageFile),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 140),
                          height: 60,
                          decoration: BoxDecoration(
                            // color: Colors.black.withOpacity(0.4),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Material(
                                color: Colors.transparent,
                                child: Ink(
                                  decoration: const ShapeDecoration(
                                    color: Colors.white,
                                    shape: CircleBorder(),
                                  ),
                                  child: IconButton(
                                    icon: const Icon(Icons.camera_alt_outlined),
                                    // color: Colors.white,
                                    onPressed: _imgFromCamera,
                                  ),
                                ),
                              ),
                              SizedBox(width: 5),
                              Material(
                                color: Colors.transparent,
                                child: Ink(
                                  decoration: const ShapeDecoration(
                                    color: Colors.white,
                                    shape: CircleBorder(),
                                  ),
                                  child: IconButton(
                                    icon: const Icon(
                                        Icons.photo_library_outlined),
                                    // color: Colors.white,
                                    onPressed: _imgFromGallery,
                                  ),
                                ),
                              ),
                              SizedBox(width: 5),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                : Container(
                    margin: EdgeInsets.only(right: 10, left: 10),
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.2),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: IconButton(
                        onPressed: () {
                          _showPicker(context);
                        },
                        icon: Icon(
                          Icons.add_photo_alternate_rounded,
                          size: 80.0,
                          color: Colors.white,
                        )),
                  ),
            Container(
              alignment: Alignment.centerLeft,
              child: GreenTagWidget(
                title: "Result",
              ),
            ),
            imageFile != null
                ? Container(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(right: 10, left: 10),
                          // height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            // color: Colors.grey.withOpacity(0.5),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),

                          child: Column(
                            children: _results != null
                                ? _results.map((result) {
                                    return Card(
                                      color: Color(0xff192537),
                                      child: Container(
                                        child: Text(
                                          "${result["label"].toString().substring(
                                                2,
                                              )} (Confidence -  ${result["confidence"].toStringAsFixed(2)})",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    );
                                  }).toList()
                                : [],
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(
                                top: 40.0, left: 10.0, right: 10.0),
                            constraints: BoxConstraints(
                              maxHeight: 300,
                            ),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                            child: WebView(
                              key: Key(_results[0]["label"].toString()),
                              initialUrl:
                                  'https://en.wikipedia.org/wiki/${_results[0]["label"].toString().substring(
                                        2,
                                      )}',
                            )),
                      ],
                    ),
                  )
                : Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(right: 10, left: 10),
                    // height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      // color: Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),

                    child: Text(
                      'Please select the image to view results',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Future loadModel() async {
    Tflite.close();
    String res;
    res = await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
    );
    print(res);
  }

  Future imageClassification(var image) async {
    // Run tensorflowlite image classification model on the image
    final List results = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 1,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _results = results;
      print(_results);
      print(_results[0]["label"]);
    });
  }
}
