import 'package:ceyntra_mobile/service/BidService.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AvailableBidWidget extends StatefulWidget {
  final String date;
  final String pickUpAddress;
  final String dropAddress;
  final int noOfPassengers;
  final int yourPrice;
  final String travellerNote;
  final Function refresh;
  final int bidId;

  const AvailableBidWidget(
      {this.date,
      this.dropAddress,
      this.noOfPassengers,
      this.pickUpAddress,
      this.travellerNote,
      this.yourPrice,
      this.refresh,
      this.bidId});

  @override
  _AvailableBidWidgetState createState() => _AvailableBidWidgetState();
}

class _AvailableBidWidgetState extends State<AvailableBidWidget> {
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
                    color: Colors.amber,
                  ),
                ),
                Text("You have Bid Request",
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white.withOpacity(0.9),
                    )),
              ],
            ),
          ),
          BidDetailsItem(
            title: "* Date",
            details: widget.date,
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
            title: "* Your price",
            details: widget.yourPrice.toString(),
          ),
          BidDetailsItem(
            title: "* Traveller note",
            details: widget.travellerNote.toString(),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("* Note for traveller",
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white.withOpacity(0.9),
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: (MediaQuery.of(context).size.width / 100) * 90,
                  child: TextField(
                    controller: noteTEC,
                    maxLines: 1,
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
                        hintText: 'put your offer details here',
                        hintStyle: GoogleFonts.montserrat(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.w500)),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            // color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  // onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent,
                  ),
                  onPressed: () {
                    popUpDialogWithButtons(
                        context, "Do you want to reject Bid?", "", () {
                      bidService
                          .taxiDriverRejectBid(widget.bidId)
                          .then((value) {
                        if (value == 1) {
                          popUpDialogWithOneButton(context, "Bid rejected", "");
                        } else {
                          popUpDialogWithOneButton(
                              context, "Bid not rejected please try again", "");
                        }
                      });

                      Navigator.of(context).pop();
                    });
                  },
                  child: Text(
                    "Reject",
                    style: GoogleFonts.montserrat(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                  // onPressed: () {},
                  onPressed: () {
                    popUpDialogWithButtons(
                        context, "Do you want to Accept Bid?", "", () {
                      bidService
                          .taxiDriverAcceptBid(widget.bidId, noteTEC.text)
                          .then((value) {
                        if (value == 1) {
                          popUpDialogWithOneButton(context, "Bid accepted", "");
                        } else {
                          popUpDialogWithOneButton(
                              context, "Bid not accepted please try again", "");
                        }
                      });

                      Navigator.of(context).pop();
                    });
                  },
                  child: Text(
                    "Accept",
                    style: GoogleFonts.montserrat(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                )
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
