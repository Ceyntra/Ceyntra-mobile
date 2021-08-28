import 'package:ceyntra_mobile/views/widgets/DisplayRatingWidgetBig.dart';
import 'package:ceyntra_mobile/views/widgets/greenTagWidget.dart';
import 'package:ceyntra_mobile/views/widgets/lineBarIndicatorWidget.dart';
import 'package:ceyntra_mobile/views/widgets/reviewWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ClickedTaxiInfoScreen extends StatefulWidget {
  // const ClickedTaxiInfoScreen({ Key? key }) : super(key: key);
  var clickedTaxiInfo;
  ClickedTaxiInfoScreen({this.clickedTaxiInfo});

  @override
  _ClickedTaxiInfoScreenState createState() => _ClickedTaxiInfoScreenState();
}

class _ClickedTaxiInfoScreenState extends State<ClickedTaxiInfoScreen> {
  bool favourite = false;
  bool toggle = false;
  double myRating = 0;
  String descriptionText =
      'This example shows a message that was posted by a user. The username is always visible right before the text and tapping on it opens the user profile. The text is truncated after ';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff031925),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              margin: EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                //color: Colors.red,
                child: Carousel(
                  dotSize: 6.0,
                  boxFit: BoxFit.cover,
                  dotBgColor: Colors.transparent,
                  indicatorBgPadding: 8,
                  dotPosition: DotPosition.bottomRight,
                  images: [
                    AssetImage("assets/images/hotel1.jpg"),
                    AssetImage("assets/images/hotel2.jpg"),
                    AssetImage("assets/images/hotel3.jpg")
                  ],
                ),
              ),
            ),
            Container(
              child: Row(children: [
                Container(
                  height: 40,
                  width: 40,
                  margin: EdgeInsets.only(left: 40),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                  ),
                  child: Stack(
                    children: [
                      Icon(
                        Icons.favorite_border_outlined,
                        //color: Colors.white,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30),
                  child: ElevatedButton.icon(
                    icon: Icon(
                      Icons.directions,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Directions',
                      //style: GoogleFonts.montserrat(fontSize: 14,color: Colors.black)),
                    ),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      //primary: Colors.white,
                      textStyle: GoogleFonts.montserrat(color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 14),
                  child: Row(
                    children: [
                      Container(
                        child: Text(
                          "Check In",
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
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
                          size: 40,
                        ),
                      )
                    ],
                  ),
                ),
              ]),
            ),
            GreenTagWidget(
              title: "Description",
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ExpandableText(
                descriptionText,
                expandText: 'Read more',
                collapseText: 'show less',
                maxLines: 5,
                linkColor: Colors.blue[900],
                style: GoogleFonts.montserrat(
                    fontSize: 15, color: Colors.grey, height: 1.5),
              ),
            ),
            GreenTagWidget(title: "Rating"),
            Container(
              child: Row(
                children: [
                  DisplayRatingBigWidget(
                    rating: 4.6,
                    votes: 546,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 10),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    child: Text(
                      'Interesting',
                      style: GoogleFonts.montserrat(
                          fontSize: 14, color: Colors.grey),
                    ),
                  ),
                  LineBarIndicatorWidget(1.0),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 10),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    child: Text(
                      'Guide',
                      style: GoogleFonts.montserrat(
                          fontSize: 14, color: Colors.grey),
                    ),
                  ),
                  LineBarIndicatorWidget(1.0),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 10),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    child: Text(
                      'Service',
                      style: GoogleFonts.montserrat(
                          fontSize: 14, color: Colors.grey),
                    ),
                  ),
                  LineBarIndicatorWidget(0.9),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 10),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    child: Text(
                      'Price',
                      style: GoogleFonts.montserrat(
                          fontSize: 14, color: Colors.grey),
                    ),
                  ),
                  LineBarIndicatorWidget(0.7),
                ],
              ),
            ),
            GreenTagWidget(
              title: "My Rating",
            ),
            // DisplayRatingWidget(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    myRating.toString(),
                    style: GoogleFonts.montserrat(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  RatingBar(
                      initialRating: myRating,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemSize: 30,
                      itemCount: 5,
                      ratingWidget: RatingWidget(
                        full: Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        half: Icon(
                          Icons.star_half,
                          color: Colors.amber,
                        ),
                        empty: Icon(
                          Icons.star_border,
                          color: Colors.amber,
                        ),
                      ),
                      itemPadding: EdgeInsets.symmetric(horizontal: 3.0),
                      onRatingUpdate: (rating) {
                        setState(() {
                          myRating = rating;
                        });
                      }),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15, right: 10, left: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: (MediaQuery.of(context).size.width / 100) * 70,
                    height: 40,
                    child: TextField(
                      style: GoogleFonts.montserrat(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(
                            Icons.comment,
                            color: Colors.green,
                          ),
                          contentPadding: EdgeInsets.only(
                              left: 2, top: 2, bottom: 2, right: 20),
                          // isDense: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          hintText: 'Comment here...',
                          hintStyle: GoogleFonts.montserrat(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green,
                    ),
                    child: Text(
                      "Post",
                      style: GoogleFonts.montserrat(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ),
            ReviewWidget(),
            ReviewWidget(),
            ReviewWidget(),
          ],
        ),
      ),
    );
  }
}
