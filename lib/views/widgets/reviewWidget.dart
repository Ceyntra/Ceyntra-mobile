import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class ReviewWidget extends StatelessWidget {
  // const ReviewWidget({ Key? key }) : super(key: key);
  String descriptionText =
      'This example shows a message that was posted by a user. The username is always visible right before the text and tapping on it opens the user profile. The text is truncated after two lines and can be expanded by tapping on the link show more at the end or the text itself. After the text was expanded it cannot be collapsed again as no collapseText was provided. Links, @mentions and #hashtags in the text are styled differently and can be tapped to open the browser or the user profile.';

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 50,
      // color: Colors.amber,
      margin: EdgeInsets.only(left: 10, top: 10, bottom: 30, right: 10),
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
                          image: AssetImage('assets/images/profile1.jpg'))),
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
                              "Stephanie",
                              style: GoogleFonts.montserrat(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "October, 2019",
                              style: GoogleFonts.montserrat(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
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
                                  "4.5",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 15, color: Colors.white),
                                ),
                              ),
                              Container(
                                child: RatingBar.builder(
                                  itemSize: 20,
                                  ignoreGestures: true,
                                  initialRating: 4.5,
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
            height: 10,
          ),
          Container(
            child: Container(
              // padding: EdgeInsets.symmetric(horizontal: 10),
              child: ExpandableText(
                descriptionText,
                expandText: 'Read more',
                collapseText: 'show less',
                maxLines: 3,
                linkColor: Colors.blue[900],
                style: GoogleFonts.montserrat(
                    fontSize: 15, color: Colors.grey, height: 1.5),
              ),
            ),
          )
        ],
      ),
    );
  }
}
