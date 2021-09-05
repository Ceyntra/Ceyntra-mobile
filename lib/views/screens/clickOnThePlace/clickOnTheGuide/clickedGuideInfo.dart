import 'package:ceyntra_mobile/service/TaxiDriverService.dart';
import 'package:ceyntra_mobile/views/widgets/DisplayRatingWidget.dart';
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

class clickedGuideInfoScreen extends StatefulWidget {
  // const clickedGuideInfoScreen({ Key? key }) : super(key: key);
  var clickedGuideInfo;
  clickedGuideInfoScreen({this.clickedGuideInfo});

  @override
  _clickedGuideInfoScreenState createState() => _clickedGuideInfoScreenState();
}

class _clickedGuideInfoScreenState extends State<clickedGuideInfoScreen> {
  TextEditingController comment = new TextEditingController();
  bool favourite = false;
  double myRating = 0;
  double placeRating = 0.0;
  int numOfVotes = 0;
  var userId = 0;

  TaxiDriverService taxiDriverService = TaxiDriverService();
  var pageData;
  var numOfReviews;

  void setPageData(data) {
    setState(() {
      pageData = data;
      favourite = data['favourite'];
      myRating = data['myRating'];
      numOfReviews = data['list'].length;
      numOfVotes = data['numOfVotesForPlace'];
      placeRating = data['placeRating'];
    });
  }

  @override
  void initState() {
    super.initState();
    taxiDriverService.getUsertId().then((value) {
      setState(() {
        userId = value;
      });

      taxiDriverService.loadAllReviewsAndScreenData(
          setPageData, value, widget.clickedGuideInfo["guideId"]);
    });
  }

  void popUpDialog(BuildContext context) {
    var alert = AlertDialog(
      title: Text("Comment Field Is Empty"),
      content: Text("Please fill and try again"),
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  // Map<String, dynamic> clickedGuideDetails = {
  //   "description": widget.description,
  //   "firstName": widget.firstName,
  //   "lastName": widget.lastName,
  //   "nic": widget.nic,
  //   "numOfVotes": widget.numOfVotes,
  //   "profilePhoto": widget.profilePhoto,
  //   "photo": widget.photo,
  //   "rating": widget.rating,
  //   "guideId": widget.guideId,
  //   "vehicleState": widget.vehicleState
  // };

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
                child: widget.clickedGuideInfo != null
                    ? Carousel(
                        dotSize: 6.0,
                        boxFit: BoxFit.cover,
                        dotBgColor: Colors.transparent,
                        indicatorBgPadding: 8,
                        dotPosition: DotPosition.bottomRight,
                        images: [
                          NetworkImage(widget.clickedGuideInfo['profilePhoto']),
                          NetworkImage(widget.clickedGuideInfo['photo'])
                        ],
                      )
                    : Carousel(
                        dotSize: 6.0,
                        boxFit: BoxFit.cover,
                        dotBgColor: Colors.transparent,
                        indicatorBgPadding: 8,
                        dotPosition: DotPosition.bottomRight,
                        images: [
                          // AssetImage("assets/images/sigiriya.jpg"),
                          // AssetImage("assets/images/sigiriya.jpg"),
                          // AssetImage("assets/images/sigiriya.jpg"),
                          AssetImage("assets/images/notFound.jpg"),
                          AssetImage("assets/images/notFound.jpg"),
                          AssetImage("assets/images/notFound.jpg")
                        ],
                      ),
              ),
            ),
            Container(
              // color: Colors.red,
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            !favourite ? favourite = true : favourite = false;
                          });
                          taxiDriverService.updateFavouritePlace(favourite,
                              userId, widget.clickedGuideInfo["guideId"]);
                        },
                        child: Icon(
                          favourite
                              ? Icons.favorite_sharp
                              : Icons.favorite_border,
                          color: Colors.redAccent,
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(35))),
                    ),
                    DisplayRatingWidget(
                      rating: double.parse(placeRating.toStringAsFixed(1)),
                      votes: numOfVotes,
                    ),
                  ]),
            ),

            GreenTagWidget(
              title: "Description",
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ExpandableText(
                widget.clickedGuideInfo["description"],
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
                      controller: comment,
                      style: GoogleFonts.montserrat(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
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
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    onPressed: () {
                      if (comment.text.isNotEmpty) {
                        var isDone = taxiDriverService.addReview(
                            comment.text,
                            myRating,
                            widget.clickedGuideInfo["guideId"],
                            userId);
                        isDone.then((value) => {
                              if (value == 1)
                                {
                                  comment.clear(),
                                  taxiDriverService.loadAllReviewsAndScreenData(
                                      setPageData,
                                      userId,
                                      widget.clickedGuideInfo["guideId"])
                                }
                            });
                      } else {
                        popUpDialog(context);
                      }
                    },
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
              title: "Reviews(" + numOfReviews.toString() + ")",
            ),
            Column(
              children: pageData != null
                  ? taxiDriverService.loadReviews(context, pageData)
                  : [
                      Container(
                        // color: Colors.green,
                        width: 100,
                        height: 250,
                        child: Container(
                            alignment: Alignment.center,
                            width: 60,
                            height: 60,
                            // color: Colors.red,
                            child: CircularProgressIndicator()),
                      )
                    ],
            )
          ],
        ),
      ),
    );
  }
}
