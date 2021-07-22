import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ComplaintPage extends StatelessWidget {
  //const ComplaintPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2F3546),
      appBar: AppBar(
        title: Text(
          "Complaints",
          style: GoogleFonts.montserrat(fontSize: 18),
        ),
        backgroundColor: Color(0xff192537),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              //color: Colors.red,
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.black38,
              ),

              child: Stack(
                children: [
                  Container(
                    height: 70,
                    width: double.infinity,
                    //color: Colors.black,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.black38,
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                              //color: Colors.blue,
                              image: DecorationImage(
                                image: AssetImage("assets/images/g4.jpg"),
                                fit: BoxFit.cover,
                              )),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Text(
                            'Account name\n@admin',
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 75, left: 10, right: 10),
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec tincidunt pretium semper. In elementum, nibh eu commodo congue.',
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        height: 1.5,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 160, left: 10, right: 10),
                    child: Text(
                      '11.44 A.M\t\t July 20.2021',
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        height: 1.5,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 200,
              width: double.infinity,
              //color: Colors.red,
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.black38,
              ),

              child: Stack(
                children: [
                  Container(
                    height: 70,
                    width: double.infinity,
                    //color: Colors.black,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.black38,
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                              //color: Colors.blue,
                              image: DecorationImage(
                                image: AssetImage("assets/images/g4.jpg"),
                                fit: BoxFit.cover,
                              )),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Text(
                            'Account name\n@admin',
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 75, left: 10, right: 10),
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec tincidunt pretium semper. In elementum, nibh eu commodo congue.',
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        height: 1.5,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 160, left: 10, right: 10),
                    child: Text(
                      '11.44 A.M\t\t July 20.2021',
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        height: 1.5,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 200,
              width: double.infinity,
              //color: Colors.red,
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.black38,
              ),

              child: Stack(
                children: [
                  Container(
                    height: 70,
                    width: double.infinity,
                    //color: Colors.black,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.black38,
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                              //color: Colors.blue,
                              image: DecorationImage(
                                image: AssetImage("assets/images/g4.jpg"),
                                fit: BoxFit.cover,
                              )),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Text(
                            'Account name\n@admin',
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 75, left: 10, right: 10),
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec tincidunt pretium semper. In elementum, nibh eu commodo congue.',
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        height: 1.5,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 160, left: 10, right: 10),
                    child: Text(
                      '11.44 A.M\t\t July 20.2021',
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        height: 1.5,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
