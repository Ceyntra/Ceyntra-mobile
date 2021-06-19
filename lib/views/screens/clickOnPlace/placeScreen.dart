import 'package:ceyntra_mobile/views/widgets/feedPlaceWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_pro/carousel_pro.dart';

class PlaceScreen extends StatefulWidget {
  // const PlaceScreen({ Key? key }) : super(key: key);

  @override
  _PlaceScreenState createState() => _PlaceScreenState();
}

class _PlaceScreenState extends State<PlaceScreen> {
  bool favourite = false;
  bool toggle = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              // margin: EdgeInsets.only(top: 10),
              height: 250,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                child: Carousel(
                  dotSize: 6.0,
                  boxFit: BoxFit.cover,
                  dotBgColor: Colors.transparent,
                  indicatorBgPadding: 8,
                  dotPosition: DotPosition.bottomRight,
                  images: [
                    AssetImage("assets/images/sigiriya.jpg"),
                    AssetImage("assets/images/polo.jpg"),
                    AssetImage("assets/images/dambulla.jpg")
                  ],
                ),
              ),
            ),
            Positioned(
              height: 35,
              width: 35,
              right: 20,
              top: 30,
              child: Container(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      !favourite ? favourite = true : favourite = false;
                    });
                  },
                  child: Icon(
                    favourite ? Icons.favorite_sharp : Icons.favorite_border,
                    color: Colors.redAccent,
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(35))),
              ),
            ),
            Positioned(
              height: 35,
              width: 35,
              right: 20,
              top: 80,
              child: Container(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    setState(() {});
                  },
                  child: Icon(
                    Icons.map,
                    color: Colors.green,
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(35))),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Text(
                                  "4.9",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 15, color: Colors.white),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 5),
                                child: Icon(
                                  Icons.star,
                                  color: Colors.amber[300],
                                  size: 16,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 5),
                                child: Icon(
                                  Icons.star,
                                  color: Colors.amber[300],
                                  size: 16,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 5),
                                child: Icon(
                                  Icons.star,
                                  color: Colors.amber[300],
                                  size: 16,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 5),
                                child: Icon(
                                  Icons.star,
                                  color: Colors.amber[300],
                                  size: 16,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 5),
                                child: Icon(
                                  Icons.star,
                                  color: Colors.amber[300],
                                  size: 16,
                                ),
                              ),
                              Container(
                                // margin: EdgeInsets.only(left: 5),
                                child: Text(
                                  "(4782)",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 10, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Text(
                              "Sigiriya",
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      // color: Colors.redAccent,

                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Text(
                              "Check In",
                              style: GoogleFonts.montserrat(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                !toggle ? toggle = true : toggle = false;
                              });
                            },
                            child: Icon(
                              toggle ? Icons.toggle_on : Icons.toggle_off,
                              color: toggle ? Colors.green : Colors.grey,
                              size: 50,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  "Central Province, Matale District, Dambulla",
                  style:
                      GoogleFonts.montserrat(fontSize: 15, color: Colors.grey),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Text(
              "Nearest Destinations",
              style: GoogleFonts.montserrat(fontSize: 15, color: Colors.white),
            ),
            decoration: BoxDecoration(
                color: Colors.green[800],
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
          ),
        ),
        FeedPlaceWidget(
          imagePath: "assets/images/polo.jpg",
          placeName: "Polonnaruwa",
          votes: 2429,
          rating: 4.5,
        ),
        FeedPlaceWidget(
          imagePath: "assets/images/dambulla.jpg",
          placeName: "Dambulla cave temple",
          votes: 1356,
          rating: 4.3,
        ),
        SizedBox(
          height: 60,
        ),
      ],
    );
  }
}
