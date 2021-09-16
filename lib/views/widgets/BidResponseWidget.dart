import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class BidResponseWidget extends StatelessWidget {
  // const BidResponseWidget({ Key? key }) : super(key: key);
  final String comment;
  final String profilePhoto;
  final String firstName;
  final String secondeName;
  final double rating;
  final String date;
  final int bidId;
  final int taxiId;
  final Function refresh;

  BidResponseWidget(
      {this.comment,
      this.date,
      this.firstName,
      this.profilePhoto,
      this.rating,
      this.secondeName,
      this.bidId,
      this.taxiId,
      this.refresh});

  @override
  Widget build(BuildContext context) {
    // var rateDate = date.substring(0, 10);
    return Container(
      // height: 50,
      // color: Colors.amber,
      width: MediaQuery.of(context).size.width * 0.9,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.blueAccent),
          borderRadius: BorderRadius.circular(10)),
      // margin: EdgeInsets.only(left: 10, top: 10, bottom: 30, right: 10),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: profilePhoto != null
                              ? NetworkImage(profilePhoto)
                              : AssetImage("assets/images/notFound.jpg"))),
                ),
                Container(
                  height: 40,
                  // color: Colors.amber,
                  margin: EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Text(
                              firstName,
                              style: GoogleFonts.montserrat(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            // Text(
                            //   rateDate,
                            //   style: GoogleFonts.montserrat(
                            //     fontSize: 15,
                            //     color: Colors.grey,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      Container(
                        child: Container(
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Text(
                                  rating.toString(),
                                  style: GoogleFonts.montserrat(
                                      fontSize: 15, color: Colors.white),
                                ),
                              ),
                              Container(
                                child: RatingBar.builder(
                                  itemSize: 20,
                                  ignoreGestures: true,
                                  initialRating: rating,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 1.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 0,
          ),
          Container(
            child: Container(
              // padding: EdgeInsets.symmetric(horizontal: 10),
              child: ExpandableText(
                comment,
                expandText: 'Read more',
                collapseText: 'show less',
                maxLines: 3,
                linkColor: Colors.blue[900],
                style: GoogleFonts.montserrat(
                    fontSize: 15, color: Colors.grey, height: 1.5),
              ),
            ),
          ),
          Container(
            // color: Colors.amber,
            margin: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 90,
                  height: 40,
                  // margin: EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                    onPressed: () {},
                    child: Text(
                      "Accept",
                      style: GoogleFonts.montserrat(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 90,
                  height: 40,
                  // margin: EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent,
                    ),
                    onPressed: () {},
                    child: Text(
                      "Reject",
                      style: GoogleFonts.montserrat(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
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
