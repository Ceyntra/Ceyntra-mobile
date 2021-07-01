import 'dart:io';

import 'package:ceyntra_mobile/views/widgets/greenTagWidget.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class TranslatorScreen extends StatefulWidget {
  // const TranslatorScreen({ Key? key }) : super(key: key);
  final Function pressed;
  final bool isPressed;
  final Function setNull;
  TranslatorScreen({this.pressed, this.isPressed, this.setNull});

  @override
  _TranslatorScreenState createState() => _TranslatorScreenState();
}

class _TranslatorScreenState extends State<TranslatorScreen> {
  String valueChoose;
  String extractedText;
  File image;
  List listItem = [
    "item1",
    "item2",
    "item3",
    "item4",
  ];

  void postData() async {
    final Dio dio = new Dio();
    String fileName = image.path.split('/').last;
    print(fileName);
    FormData formData = new FormData.fromMap({
      "profile": await MultipartFile.fromFile(image.path, filename: fileName)
    });

    String url = "http://10.0.2.2:8000/upload";
    try {
      print("object");
      var response = await dio.post(url, data: formData);
      setState(() {
        extractedText = response.toString();
      });
      print(response);
    } catch (e) {
      print(e);
    }
  }

  Future pickImage() async {
    print("me inne true eke");
    final file = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      image = File(file.path);
    });
    postData();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0xff192537),
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              // Tab(
              //   icon: Icon(Icons.text_fields),
              // ),
              Tab(
                child: Container(
                  child: Row(
                    children: [
                      Icon(Icons.photo),
                      Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text("Photo to Text"))
                    ],
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Row(
                    children: [
                      Icon(Icons.text_fields),
                      Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text("Text to Text"))
                    ],
                  ),
                ),
              ),
            ],
          ),
          title: Text(
            "Ceyntra Translator",
            style: GoogleFonts.montserrat(fontSize: 18),
          ),
          leading: widget.isPressed
              ? InkWell(
                  onTap: () {
                    widget.setNull();
                    print("me inne false eke");
                    widget.pressed(0.0, 0.0, 1.0, false);
                  },
                  child: Icon(Icons.arrow_back))
              : InkWell(
                  onTap: () {
                    widget.setNull();
                    print("me inne true eke");
                    widget.pressed(
                        (MediaQuery.of(context).size.width / 100) * 70,
                        70.0,
                        0.8,
                        true);
                  },
                  child: Icon(
                    Icons.menu,
                  )),
          backgroundColor: Color(0xff192537),
        ),
        body: TabBarView(
          children: [
            ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 150,
                      height: 30,

                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      margin: EdgeInsets.only(
                        top: 20,
                      ),
                      // color: Colors.redAccent,
                      child: DropdownButton(
                        style: GoogleFonts.montserrat(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                        underline: SizedBox(),
                        isExpanded: true,
                        hint: Text(
                          'Language',
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                          ),
                        ),
                        value: valueChoose,
                        onChanged: (newValue) {
                          setState(() {
                            valueChoose = newValue;
                          });
                        },
                        items: listItem.map((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),

                    // GestureDetector(
                    //   onTap: () {
                    //     pickImage();
                    //   },
                    //   child: Container(
                    //     alignment: Alignment.center,
                    //     width: 200,
                    //     height: 40,
                    //     color: Colors.redAccent,
                    //     child: Text("Click here"),
                    //   ),
                    // ),
                    // GestureDetector(
                    //   onTap: () {
                    //     print("iam clicked");
                    //     postData();
                    //   },
                    //   child: Container(
                    //     alignment: Alignment.center,
                    //     width: 200,
                    //     height: 40,
                    //     color: Colors.greenAccent,
                    //     child: Text("extract text"),
                    //   ),
                    // ),
                    // Conta
                    image != null
                        ? Container(
                            margin:
                                EdgeInsets.only(top: 20, right: 20, left: 20),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            width: double.infinity,
                            height: 250,
                            child: Image.file(image),
                          )
                        : Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.amber, width: 5)),
                            height: 200,
                          ),

                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 20, right: 20, left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 100,
                            child: ElevatedButton(
                              onPressed: () {
                                pickImage();
                              },
                              child: Text("skdjfhhh"),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.redAccent),
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text("skdjfh"),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.redAccent),
                            ),
                          )
                        ],
                      ),
                    ),
                    GreenTagWidget(
                      title: "Sinhala translate",
                    ),
                    Container(
                      height: 150,
                      child: ListView(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(right: 20, left: 20),
                            width: double.infinity,
                            color: Colors.white,
                            child: extractedText != null
                                ? Text(
                                    extractedText,
                                    style: GoogleFonts.montserrat(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600),
                                  )
                                : Text(""),
                          ),
                        ],
                      ),
                    ),
                    GreenTagWidget(
                      title: "English translate",
                    ),
                  ],
                )
              ],
            ),
            ListView(
              children: [
                Column(
                  children: [
                    Container(
                      height: (MediaQuery.of(context).size.height / 100) * 50,
                      color: Colors.greenAccent,
                    ),
                    SizedBox(
                      height: 1000,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                      decoration: BoxDecoration(color: Colors.white),
                      child: TextField(
                        style: GoogleFonts.montserrat(
                            fontSize: 17, color: Colors.black),
                        maxLines: 8,
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
