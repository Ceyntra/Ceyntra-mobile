import 'package:ceyntra_mobile/views/widgets/DisplayRatingWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GuideWidget2 extends StatefulWidget {
  final Function setClickedGuide;
  final ValueChanged<String> changeMainFeedStateState;
  final int guideId;
  final String firstName;
  final String lastName;
  final String description;
  final String profilePhoto;
  final String photo;
  final String nic;
  final int perDayPrice;
  final String vehicleState;
  final int numOfVotes;
  final double rating;
  final Function setHamburgerStateNull;

  GuideWidget2(
      {this.photo,
      this.perDayPrice,
      this.vehicleState,
      this.description,
      this.guideId,
      this.firstName,
      this.numOfVotes,
      this.nic,
      this.lastName,
      this.profilePhoto,
      this.rating,
      this.setClickedGuide,
      this.changeMainFeedStateState,
      this.setHamburgerStateNull});

  @override
  _GuideWidget2State createState() => _GuideWidget2State();
}

class _GuideWidget2State extends State<GuideWidget2> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> clickedGuideDetails = {
      "description": widget.description,
      "firstName": widget.firstName,
      "lastName": widget.lastName,
      "nic": widget.nic,
      "numOfVotes": widget.numOfVotes,
      "profilePhoto": widget.profilePhoto,
      "photo": widget.photo,
      "rating": widget.rating,
      "guideId": widget.guideId,
      "vehicleState": widget.vehicleState
    };
    return GestureDetector(
      onTap: () {
        widget.setHamburgerStateNull();
        widget.changeMainFeedStateState("clickOnTheFavGuide");
        widget.setClickedGuide(clickedGuideDetails);
      },
      child: Container(
        margin: EdgeInsets.only(top: 20, left: 20),
        height: 100,
        decoration: BoxDecoration(
          color: Color(0xff2F3546),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            bottomLeft: Radius.circular(15),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    widget.profilePhoto,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.firstName + " " + widget.lastName,
                    style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  DisplayRatingWidget(
                    rating: widget.rating,
                    votes: widget.numOfVotes,
                  ),
                  SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      text: widget.perDayPrice.toString(),
                      style: GoogleFonts.montserrat(
                          fontSize: 16, fontWeight: FontWeight.w400),
                      children: [
                        TextSpan(
                          text: ' per day' +
                              " " +
                              widget.vehicleState +
                              " " +
                              "vehicle",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
