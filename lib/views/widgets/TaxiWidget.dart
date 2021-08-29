import 'package:ceyntra_mobile/views/widgets/DisplayRatingWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaxiWidget extends StatefulWidget {
  final Function setClickedTaxi;
  final ValueChanged<String> changeMainFeedStateState;
  final int taxiId;
  final String driverLicense;
  final String firstName;
  final String lastName;
  final int perKmPrice;
  final int numOfVotes;
  final double rating;
  final String profilePhoto;
  final String taxiPhoto;

  TaxiWidget(
      {this.driverLicense,
      this.firstName,
      this.lastName,
      this.numOfVotes,
      this.perKmPrice,
      this.profilePhoto,
      this.rating,
      this.taxiId,
      this.taxiPhoto,
      this.setClickedTaxi,
      this.changeMainFeedStateState});

  @override
  _TaxiWidgetState createState() => _TaxiWidgetState();
}

class _TaxiWidgetState extends State<TaxiWidget> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> clickedTaxiDetails = {
      "driverLicense": widget.driverLicense,
      "firstName": widget.firstName,
      "lastName": widget.lastName,
      "numOfVotes": widget.numOfVotes,
      "perKmPrice": widget.perKmPrice,
      "profilePhoto": widget.profilePhoto,
      "rating": widget.rating,
      "taxiId": widget.taxiId,
      "taxiPhoto": widget.taxiPhoto,
    };
    return GestureDetector(
      onTap: () {
        widget.changeMainFeedStateState("clickOnTheTaxi");
        widget.setClickedTaxi(clickedTaxiDetails);
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
                    widget.taxiPhoto,
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
                      text: widget.perKmPrice.toString(),
                      style: GoogleFonts.montserrat(
                          fontSize: 16, fontWeight: FontWeight.w400),
                      children: [
                        TextSpan(
                          text: ' per km',
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
