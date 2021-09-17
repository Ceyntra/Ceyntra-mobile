import 'package:ceyntra_mobile/service/BidService.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmedBidWidget extends StatefulWidget {
  final String date;
  final String pickUpTime;
  final String pickUpAddress;
  final String dropAddress;
  final int noOfPassengers;
  final int yourPrice;
  final String travellerNote;
  final Function refresh;
  final int bidId;
  final String contactNumber;

  const ConfirmedBidWidget(
      {this.date,
      this.contactNumber,
      this.pickUpTime,
      this.dropAddress,
      this.noOfPassengers,
      this.pickUpAddress,
      this.travellerNote,
      this.yourPrice,
      this.refresh,
      this.bidId});

  @override
  _ConfirmedBidWidgetState createState() => _ConfirmedBidWidgetState();
}

class _ConfirmedBidWidgetState extends State<ConfirmedBidWidget> {
  BidService bidService = new BidService();
  TextEditingController noteTEC = new TextEditingController();
  void popUpDialogWithButtons(
      BuildContext context, String title, String content, Function yesAction) {
    var alert = AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(onPressed: yesAction, child: Text("Yes")),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("No"))
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  void popUpDialogWithOneButton(
      BuildContext context, String title, String content) {
    var alert = AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              widget.refresh();
            },
            child: Text("Ok"))
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

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
          Container(
            padding: EdgeInsets.only(bottom: 10),
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 1, color: Colors.blue))),
            width: MediaQuery.of(context).size.width * 0.9,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 20,
                  height: 20,
                  margin: EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.notifications,
                    color: Colors.green,
                  ),
                ),
                Text("You have Confirmed Bid",
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white.withOpacity(0.9),
                    )),
              ],
            ),
          ),
          BidDetailsItem(
            title: "* Bid publishedDate",
            details: widget.date != null ? widget.date.substring(0, 10) : "",
          ),
          BidDetailsItem(
            title: "* Pick Up date and time",
            details: widget.pickUpTime,
          ),
          BidDetailsItem(
            title: "* Pick Up address",
            details: widget.pickUpAddress,
          ),
          BidDetailsItem(
            title: "* Drop address",
            details: widget.dropAddress,
          ),
          BidDetailsItem(
            title: "* No. of passengers",
            details: widget.noOfPassengers.toString(),
          ),
          BidDetailsItem(
            title: "* Traveller price",
            details: widget.yourPrice.toString(),
          ),
          BidDetailsItem(
            title: "* Traveller note",
            details: widget.travellerNote.toString(),
          ),
          BidDetailsItem(
            title: "* Traveller Contact number",
            details: widget.contactNumber,
          ),

          SizedBox(
            height: 20,
          ),
          Container(
            // color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: ElevatedButton(
                    // onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                    onPressed: () {
                      popUpDialogWithButtons(
                          context, "Do you want to End trip?", "", () {
                        bidService
                            .taxiDriverEndTrip(widget.bidId)
                            .then((value) {
                          if (value == "updated") {
                            widget.refresh();
                          }
                        });
                        Navigator.of(context).pop();
                      });
                    },
                    child: Text(
                      "End Trip",
                      style: GoogleFonts.montserrat(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          )
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
