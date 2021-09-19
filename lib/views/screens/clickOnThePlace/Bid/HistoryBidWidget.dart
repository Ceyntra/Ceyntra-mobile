import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryBidWidget extends StatelessWidget {
  final String date;
  final String pickUpdateAndTime;
  final String pickUpAddress;
  final String dropAddress;
  final int noOfPassengers;
  final int yourPrice;
  final String travellerNote;

  const HistoryBidWidget(
      {this.date,
      this.pickUpdateAndTime,
      this.dropAddress,
      this.noOfPassengers,
      this.pickUpAddress,
      this.travellerNote,
      this.yourPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blueAccent, width: 1),
          color: Colors.black.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15)),
      width: MediaQuery.of(context).size.width * 0.9,
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          BidDetailsItem(
            title: "* Bid published Date",
            details: date != null ? date.substring(0, 10) : "",
          ),
          BidDetailsItem(
            title: "* Pickup date and time",
            details: pickUpdateAndTime,
          ),
          BidDetailsItem(
            title: "* Pick Up address",
            details: pickUpAddress,
          ),
          BidDetailsItem(
            title: "* Drop address",
            details: dropAddress,
          ),
          BidDetailsItem(
            title: "* No. of passengers",
            details: noOfPassengers.toString(),
          ),
          BidDetailsItem(
            title: "* Your price",
            details: yourPrice.toString(),
          ),
          BidDetailsItem(
            title: "* Traveller note",
            details: travellerNote.toString(),
          ),
          // BidDetailsItem(
          //   lastElement: true,
          //   title: "* Taxi driver details",
          //   details: "Kasun rashmika, 0710157140",
          // )
        ],
      ),
    );
  }
}

class BidDetailsItem extends StatelessWidget {
  // const BidDetailsItem({ Key? key }) : super(key: key);
  final String title;
  final String details;
  final bool lastElement;

  BidDetailsItem({this.details, this.title, this.lastElement = false});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: lastElement
            ? EdgeInsets.only(bottom: 0)
            : EdgeInsets.only(bottom: 20),
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 2),
              child: Text(title,
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white.withOpacity(0.9),
                  )),
            ),
            Container(
                child: ExpandableText(
              details,
              expandText: 'Read more',
              collapseText: 'show less',
              maxLines: 3,
              linkColor: Colors.blue[900],
              style: GoogleFonts.montserrat(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ))
          ],
        ));
  }
}
