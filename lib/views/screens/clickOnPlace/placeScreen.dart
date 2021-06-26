import 'package:ceyntra_mobile/views/widgets/DisplayRatingWidget.dart';
import 'package:ceyntra_mobile/views/widgets/feedPlaceWidget.dart';
import 'package:ceyntra_mobile/views/widgets/greenTagWidget.dart';
import 'package:ceyntra_mobile/views/widgets/reviewWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class PlaceScreen extends StatefulWidget {
  // const PlaceScreen({ Key? key }) : super(key: key);
  final String place;
  PlaceScreen({this.place});

  @override
  _PlaceScreenState createState() => _PlaceScreenState();
}

class _PlaceScreenState extends State<PlaceScreen> {
  bool favourite = false;
  bool toggle = false;
  double myRating = 0;
  String descriptionText =
      'This example shows a message that was posted by a user. The username is always visible right before the text and tapping on it opens the user profile. The text is truncated after two lines and can be expanded by tapping on the link show more at the end or the text itself. After the text was expanded it cannot be collapsed again as no collapseText was provided. Links, @mentions and #hashtags in the text are styled differently and can be tapped to open the browser or the user profile.';
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
          height: 10,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // color: Colors.green,
                child: Container(
                  // color: Colors.blue,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // color: Colors.black26,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DisplayRatingWidget(
                              rating: 4.8,
                              votes: 4539,
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
                                        !toggle
                                            ? toggle = true
                                            : toggle = false;
                                      });
                                    },
                                    child: Icon(
                                      toggle
                                          ? Icons.toggle_on
                                          : Icons.toggle_off,
                                      color:
                                          toggle ? Colors.green : Colors.grey,
                                      size: 40,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 0),
                        child: Text(
                          widget.place,
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
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
        // SizedBox(
        //   height: 20,
        // ),
        GreenTagWidget(
          title: 'Description',
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
        GreenTagWidget(
          title: "Reviews(54)",
        ),
        ReviewWidget(),
        ReviewWidget(),
        SizedBox(
          height: 600,
        ),
      ],
    );
  }
}