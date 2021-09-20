import 'package:ceyntra_mobile/auth.dart';
import 'package:ceyntra_mobile/service/TaxiDriverService.dart';
import 'package:ceyntra_mobile/views/screens/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class HamburgerMenu extends StatefulWidget {
  // const HamburgerMenu({ Key? key }) : super(key: key);

  Function changeMainFeedState;

  HamburgerMenu({this.changeMainFeedState});

  @override
  _HamburgerMenuState createState() => _HamburgerMenuState();
}

class _HamburgerMenuState extends State<HamburgerMenu> {
  TaxiDriverService taxiDriverService = new TaxiDriverService();
  var travellerDetails;
  @override
  void initState() {
    super.initState();

    taxiDriverService.getTravellerData().then((value) {
      print(value);
      setState(() {
        travellerDetails = value;
      });
    });
  }

  Auth auth = new Auth();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width / 100) * 70,
      height: MediaQuery.of(context).size.height,
      // color: Colors.amberAccent,
      margin: EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // color: Colors.green,
            margin: EdgeInsets.only(
              top: 40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: travellerDetails != null
                              ? NetworkImage(travellerDetails["photo"])
                              : AssetImage('assets/images/profile1.jpg'))),
                ),
                Container(
                  // height: 40,
                  //
                  margin: EdgeInsets.only(top: 10),
                  alignment: Alignment.bottomLeft,
                  // margin: EdgeInsets.only(left: 10),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // color: Colors.amber,
                        child: travellerDetails != null
                            ? Text(
                                travellerDetails["firstName"] +
                                    " " +
                                    travellerDetails["lastName"],
                                style: GoogleFonts.montserrat(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              )
                            : Text(""),
                      ),
                      // Container(
                      //   margin: EdgeInsets.only(top: 5),
                      //   child: Text(
                      //     "San Francisco, CA",
                      //     style: GoogleFonts.montserrat(
                      //         fontSize: 15, color: Colors.grey),
                      //   ),
                      // )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            // color: Colors.greenAccent,
            width: (MediaQuery.of(context).size.width / 100) * 55,
            margin: EdgeInsets.only(top: 20),
            height: 40,
            child: InkWell(
              borderRadius: BorderRadius.circular(5),
              onTap: () {
                widget.changeMainFeedState("favourites");
              },
              child: Row(
                children: [
                  Container(
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      "Favourites",
                      style: GoogleFonts.montserrat(
                          fontSize: 15, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: (MediaQuery.of(context).size.width / 100) * 55,
            margin: EdgeInsets.only(top: 20),
            height: 40,
            child: InkWell(
              borderRadius: BorderRadius.circular(5),
              onTap: () {
                widget.changeMainFeedState("translator");
              },
              child: Row(
                children: [
                  Container(
                    child: Icon(
                      Icons.translate,
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      "Translator",
                      style: GoogleFonts.montserrat(
                          fontSize: 15, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: (MediaQuery.of(context).size.width / 100) * 55,
            margin: EdgeInsets.only(top: 20),
            height: 40,
            child: InkWell(
              borderRadius: BorderRadius.circular(5),
              onTap: () {
                widget.changeMainFeedState("animalDetection");
              },
              child: Row(
                children: [
                  Container(
                    child: Icon(
                      Icons.pets,
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      "Animal Detection",
                      style: GoogleFonts.montserrat(
                          fontSize: 15, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: (MediaQuery.of(context).size.width / 100) * 55,
            margin: EdgeInsets.only(top: 20),
            height: 40,
            child: InkWell(
              borderRadius: BorderRadius.circular(5),
              onTap: () {
                widget.changeMainFeedState("addNewPlace");
              },
              child: Row(
                children: [
                  Container(
                    child: Icon(
                      Icons.place,
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      "Add New Place",
                      style: GoogleFonts.montserrat(
                          fontSize: 15, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
          // Container(
          //   margin: EdgeInsets.only(top: 20),
          //   height: 40,
          //   child: Row(
          //     children: [
          //       Container(
          //         child: Icon(
          //           Icons.cloud,
          //           color: Colors.grey,
          //         ),
          //       ),
          //       Container(
          //         margin: EdgeInsets.only(left: 10),
          //         child: Text(
          //           "Whether",
          //           style: GoogleFonts.montserrat(
          //               fontSize: 15, color: Colors.white),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          Spacer(),
          // Container(
          //   margin: EdgeInsets.only(bottom: 20),
          //   height: 40,
          //   color: Colors.red,
          // ),
          Container(
            height: 40,
            // color: Colors.amber,
            margin: EdgeInsets.only(bottom: 20),
            child: Row(
              children: [
                Container(
                  child: Icon(
                    Icons.settings,
                    color: Colors.grey,
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(5),
                  onTap: () {
                    print("jhgj");
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 30,
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      "Settings",
                      style: GoogleFonts.montserrat(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Text("|",
                      style: GoogleFonts.montserrat(
                        fontSize: 15,
                        color: Colors.white,
                      )),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(5),
                  onTap: () {
                    auth.logout(context);

                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 30,
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Text("Log out",
                        style: GoogleFonts.montserrat(
                          fontSize: 15,
                          color: Colors.white,
                        )),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
