import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class HamburgerMenu extends StatefulWidget {
  // const HamburgerMenu({ Key? key }) : super(key: key);

  @override
  _HamburgerMenuState createState() => _HamburgerMenuState();
}

class _HamburgerMenuState extends State<HamburgerMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width / 100) * 70,
      height: MediaQuery.of(context).size.height,
      // color: Colors.amberAccent,
      margin: EdgeInsets.only(left: 20),
      child: Column(
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
                          image: AssetImage('assets/images/profile1.jpg'))),
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
                        child: Text(
                          "Stephanie illiamson",
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text(
                          "San Francisco, CA",
                          style: GoogleFonts.montserrat(
                              fontSize: 15, color: Colors.grey),
                        ),
                      )
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
            margin: EdgeInsets.only(top: 20),
            height: 40,
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
          Container(
            margin: EdgeInsets.only(top: 20),
            height: 40,
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
          Container(
            margin: EdgeInsets.only(top: 20),
            height: 40,
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
          Container(
            margin: EdgeInsets.only(top: 20),
            height: 40,
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
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    "Settings",
                    style: GoogleFonts.montserrat(
                      fontSize: 15,
                      color: Colors.white,
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
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Text("Log out",
                      style: GoogleFonts.montserrat(
                        fontSize: 15,
                        color: Colors.white,
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
