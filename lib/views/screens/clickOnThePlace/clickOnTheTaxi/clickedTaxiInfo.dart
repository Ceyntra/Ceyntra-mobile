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

class ClickedTaxiInfoScreen extends StatefulWidget {
  // const ClickedTaxiInfoScreen({ Key? key }) : super(key: key);
  var clickedTaxiInfo;
  ClickedTaxiInfoScreen({this.clickedTaxiInfo});

  @override
  _ClickedTaxiInfoScreenState createState() => _ClickedTaxiInfoScreenState();
}

class _ClickedTaxiInfoScreenState extends State<ClickedTaxiInfoScreen> {
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
          setPageData, value, widget.clickedTaxiInfo["taxiId"]);
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

  TextEditingController complaint = new TextEditingController();

  void generalPopUpDialog(BuildContext context, title, content) {
    var alert = AlertDialog(
      title: Text(title),
      content: Text(content),
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  void complainPopUpDialog(BuildContext context) {
    var alert = AlertDialog(
      title: Text(
        "Complaint to " + widget.clickedTaxiInfo["firstName"].toString(),
        style: GoogleFonts.montserrat(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
      ),
      content: Container(
        // color: Colors.redAccent,
        height: 200,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    // color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.blue, width: 1)),
                width: (MediaQuery.of(context).size.width / 100) * 60,
                child: TextField(
                  controller: complaint,
                  maxLines: 5,
                  style: GoogleFonts.montserrat(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      // prefixIcon: Icon(
                      //   Icons.comment,
                      //   color: Colors.green,
                      // ),
                      contentPadding: EdgeInsets.all(10),
                      // isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      hintText: 'Add your complain here',
                      hintStyle: GoogleFonts.montserrat(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w500)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                width: MediaQuery.of(context).size.width * 0.6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Colors.redAccent),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Cancle",
                        style: GoogleFonts.montserrat(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.green),
                      onPressed: () {
                        if (complaint.text != "") {
                          Navigator.of(context).pop();
                          taxiDriverService
                              .addComplaint(widget.clickedTaxiInfo["taxiId"],
                                  complaint.text)
                              .then((value) {
                            if (value == 1) {
                              generalPopUpDialog(
                                  context,
                                  "Your complain is received, Our team inquiry about complaint soon. Thank you",
                                  "");
                            } else {
                              generalPopUpDialog(
                                  context,
                                  "Your complain is not placed, Please try again!",
                                  "");
                            }
                          });
                        }
                      },
                      child: Text(
                        "Complaint",
                        style: GoogleFonts.montserrat(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  // Map<String, dynamic> clickedTaxiDetails = {
  //     "driverLicense": widget.driverLicense,
  //     "firstName": widget.firstName,
  //     "lastName": widget.lastName,
  //     "numOfVotes": widget.numOfVotes,
  //     "perKmPrice": widget.perKmPrice,
  //     "profilePhoto": widget.profilePhoto,
  //     "rating": widget.rating,
  //     "taxiId": widget.taxiId,
  //     "taxiPhoto": widget.taxiPhoto,
  //   };

  @override
  Widget build(BuildContext context) {
    print(widget.clickedTaxiInfo);
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
                child: widget.clickedTaxiInfo != null
                    ? Carousel(
                        dotSize: 6.0,
                        boxFit: BoxFit.cover,
                        dotBgColor: Colors.transparent,
                        indicatorBgPadding: 8,
                        dotPosition: DotPosition.bottomRight,
                        images: [
                          NetworkImage(widget.clickedTaxiInfo['taxiPhoto']),
                          NetworkImage(widget.clickedTaxiInfo['profilePhoto'])
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
                              userId, widget.clickedTaxiInfo["taxiId"]);
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
                    // GestureDetector(
                    //   onTap: () {
                    //     complainPopUpDialog(context);
                    //   },
                    //   child: Container(
                    //     width: 100,
                    //     height: 20,
                    //     color: Colors.amber,
                    //   ),
                    // ),

                    Container(
                      height: 30,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blueAccent),
                        onPressed: () {
                          complainPopUpDialog(context);
                        },
                        child: Text(
                          "Complaint",
                          style: GoogleFonts.montserrat(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    DisplayRatingWidget(
                      rating: double.parse(placeRating.toStringAsFixed(1)),
                      votes: numOfVotes,
                    ),
                  ]),
            ),
            GreenTagWidget(
              title: "My Ratings",
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
                        var isDone = taxiDriverService.addReview(comment.text,
                            myRating, widget.clickedTaxiInfo["taxiId"], userId);
                        isDone.then((value) => {
                              if (value == 1)
                                {
                                  comment.clear(),
                                  taxiDriverService.loadAllReviewsAndScreenData(
                                      setPageData,
                                      userId,
                                      widget.clickedTaxiInfo["taxiId"])
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
