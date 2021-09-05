import 'package:ceyntra_mobile/views/widgets/DisplayRatingWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HotelWidget extends StatefulWidget {
  final Function setClickedHotel;
  final ValueChanged<String> changeMainFeedStateState;
  final int hotelId;
  final String name;
  final String description;
  final String profilePhoto;
  final String regNumber;
  final int numOfVotes;
  final double rating;

  HotelWidget(
      {this.description,
      this.hotelId,
      this.name,
      this.numOfVotes,
      this.regNumber,
      this.profilePhoto,
      this.rating,
      this.setClickedHotel,
      this.changeMainFeedStateState});

  @override
  _HotelWidgetState createState() => _HotelWidgetState();
}

class _HotelWidgetState extends State<HotelWidget> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> clickedHotelDetails = {
      "description": widget.description,
      "name": widget.name,
      "regNum": widget.regNumber,
      "numOfVotes": widget.numOfVotes,
      "profilePhoto": widget.profilePhoto,
      "rating": widget.rating,
      "hotelId": widget.hotelId,
    };
    return GestureDetector(
      onTap: () {
        widget.changeMainFeedStateState("clickOnTheHotel");
        widget.setClickedHotel(clickedHotelDetails);
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
                    widget.name,
                    style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  DisplayRatingWidget(
                    rating: double.parse(widget.rating.toStringAsFixed(1)),
                    votes: widget.numOfVotes,
                  ),
                  SizedBox(height: 10),
                  // RichText(
                  //   text: TextSpan(
                  //     text: widget.perKmPrice.toString(),
                  //     style: GoogleFonts.montserrat(
                  //         fontSize: 16, fontWeight: FontWeight.w400),
                  //     children: [
                  //       TextSpan(
                  //         text: ' per km',
                  //         style: TextStyle(
                  //           fontSize: 12,
                  //           color: Colors.white.withOpacity(0.5),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
