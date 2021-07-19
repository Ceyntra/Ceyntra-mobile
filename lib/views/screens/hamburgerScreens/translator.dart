import 'dart:io';

import 'package:ceyntra_mobile/models/languageModel.dart';
import 'package:ceyntra_mobile/views/widgets/greenTagWidget.dart';
import 'package:flutter/material.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:translator/translator.dart';
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
  String choosenLanguage = "en";
  String extractedText;
  File image;
  String sinhalaExtractedText;
  bool indicator;
  String LanguageName = "English";

  List languageList = [
    LanguageModel(name: "English", code: "en"),
    // LanguageModel(name: "Chinese", code: "zh-CN"),
    LanguageModel(name: "Spanish", code: "es"),
    LanguageModel(name: "Tamil", code: "ta"),
    LanguageModel(name: "Arabic", code: "ar"),
    LanguageModel(name: "Russian", code: "ru"),
    LanguageModel(name: "Hindi", code: "hi")
  ];

  Widget progress() {
    if (indicator == true) {
      return CircularProgressIndicator();
    } else if (indicator == false) {
      return Container();
    }

    return null;
  }

  // void fetchData() async {
  //   List<LanguageModel> languageListDemo = [];
  //   final Dio dio = new Dio();
  //   var response = await dio.get('https://restcountries.eu/rest/v2/all');
  //   // print(response.data.toList());

  //   var items = response.data;

  //   for (var i = 0; i < items.length; i++) {
  //     print(items[i]['languages']);
  //     for (var j = 0; j < items[i]['languages'].length; j++) {
  //       languageListDemo.add(LanguageModel(
  //           name: items[i]['languages'][j]['name'],
  //           code: items[i]['languages'][j]['iso639_1']));
  //     }
  //   }

  //   print(languageListDemo);

  //   setState(() {
  //     languageList = languageListDemo;
  //   });
  // }

  // void initState() {
  //   print("sjkdfds");
  //   fetchData();
  // }

  void translate(String input) {
    final translator = GoogleTranslator();

    // final input = "Здравствуйте. Ты в порядке?";

    translator.translate(input, from: 'si', to: choosenLanguage).then((s) {
      print(s);
      setState(() {
        extractedText = s.toString();
      });
    });
  }

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
      setState(() {
        indicator = true;
      });
      var response = await dio.post(url, data: formData);
      setState(() {
        indicator = false;
      });
      translate(response.toString());
      setState(() {
        sinhalaExtractedText = response.toString();
      });
      print(response);
    } catch (e) {
      print(e);
    }
  }

  Future pickImage() async {
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
                        value: choosenLanguage,
                        onChanged: (newValue) {
                          setState(() {
                            choosenLanguage = newValue;
                          });

                          if (newValue == "en") {
                            setState(() {
                              LanguageName = "English";
                            });
                          } else if (newValue == "es") {
                            setState(() {
                              LanguageName = "Spanish";
                            });
                          } else if (newValue == "ta") {
                            setState(() {
                              LanguageName = "Tamil";
                            });
                          } else if (newValue == "ar") {
                            setState(() {
                              LanguageName = "Arabic";
                            });
                          } else if (newValue == "ru") {
                            setState(() {
                              LanguageName = "Russian";
                            });
                          } else if (newValue == "hi") {
                            setState(() {
                              LanguageName = "Hindi";
                            });
                          }

                          print(sinhalaExtractedText);

                          if (sinhalaExtractedText != null) {
                            translate(sinhalaExtractedText);
                          }
                        },
                        items: languageList.map((value) {
                          return DropdownMenuItem<String>(
                            value: value.code,
                            child: Text(value.name),
                          );
                        }).toList(),
                      ),
                    ),
                    Container(
                      child: Stack(
                        children: [
                          image != null
                              ? Container(
                                  margin: EdgeInsets.only(
                                      top: 20, right: 20, left: 20),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(10)),
                                  width: double.infinity,
                                  height: 250,
                                  child: Image.file(image),
                                )
                              : Container(
                                  margin: EdgeInsets.only(
                                      top: 20, right: 20, left: 20),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(10)),
                                  width: double.infinity,
                                  height: 250,
                                  // child: Image.file(image),
                                ),
                          Positioned(
                            bottom: 10,
                            right: 110,
                            child: Container(
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Icon(
                                  Icons.camera_alt,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Colors.white.withOpacity(0.2),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            right: 30,
                            child: Container(
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    extractedText = null;
                                    sinhalaExtractedText = null;
                                  });
                                  pickImage();
                                },
                                child: Icon(
                                  Icons.photo,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Colors.white.withOpacity(0.2),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          image != null
                              ? Positioned(
                                  top: 30,
                                  right: 30,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        image = null;
                                        extractedText = null;
                                        sinhalaExtractedText = null;
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey),
                                      child: Icon(Icons.close_rounded),
                                    ),
                                  ))
                              : Container()
                        ],
                      ),
                    ),
                    GreenTagWidget(
                      title: LanguageName + " translate",
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(right: 20, left: 20),
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10)),
                      alignment: Alignment.center,
                      constraints: BoxConstraints(minHeight: 100),
                      child: extractedText != null
                          ? Text(
                              extractedText,
                              style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            )
                          : Container(
                              width: 40,
                              height: 40,
                              child: progress(),
                            ),
                    ),
                    GreenTagWidget(
                      title: "Extracted text",
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(right: 20, left: 20),
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10)),
                      alignment: Alignment.center,
                      constraints: BoxConstraints(minHeight: 100),
                      child: sinhalaExtractedText != null
                          ? Text(
                              sinhalaExtractedText,
                              style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            )
                          : Container(
                              width: 40,
                              height: 40,
                              child: progress(),
                            ),
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
