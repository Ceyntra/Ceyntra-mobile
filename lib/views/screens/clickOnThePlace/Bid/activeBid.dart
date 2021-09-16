import 'package:ceyntra_mobile/service/BidService.dart';
import 'package:ceyntra_mobile/views/widgets/BidResponseWidget.dart';
import 'package:ceyntra_mobile/views/widgets/greenTagWidget.dart';
import 'package:ceyntra_mobile/views/widgets/reviewWidget.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActiveBid extends StatefulWidget {
  // const ActiveBid({ Key? key }) : super(key: key);

  final Function changeEnablePostButtonState;
  ActiveBid({this.changeEnablePostButtonState});

  @override
  _ActiveBidState createState() => _ActiveBidState();
}

class _ActiveBidState extends State<ActiveBid> {
  var activeState = 0;
  var bidResponses = [];
  var choosenDriver;
  int test = 0;
  BidService bidService = new BidService();
  var activeBidDetails;
  @override
  void initState() {
    super.initState();
    if (this.mounted) {
      setState(() {
        activeState = 0;
      });
    }

    bidService.getActiveBidDetails().then((value) {
      if (this.mounted) {
        setState(() {
          activeBidDetails = value;
          if (value['pick_up_location'] != null) {
            setState(() {
              activeState = 1;
            });

            bidService.findCAcceptedTaxiDriver(value['bid_id']).then((value1) {
              setState(() {
                test = value1["taxiDriverDetails"]["taxi_driver_id"];
                choosenDriver = value1;
              });
            });

            bidService.getBidResponses(value['bid_id']).then((value2) {
              print(value2);
              setState(() {
                bidResponses = value2;
              });
            });
          }

          // print(value);
        });
      }
    });
  }

  void refreshActiveBidScreen() {
    print("refresh");
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff031925),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // margin: EdgeInsets.only(top: 20),
                alignment: Alignment.center,
                // color: Colors.redAccent,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    GreenTagWidget(
                      title: "Active Bid Details",
                    ),
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.blueAccent, width: 1),
                              color: Colors.black.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(15)),
                          width: MediaQuery.of(context).size.width * 0.9,
                          padding: EdgeInsets.all(20),
                          child: activeState == 1
                              ? Column(
                                  children: [
                                    BidDetailsItem(
                                      title: "* Date",
                                      details: activeBidDetails['timestamp']
                                          .substring(0, 10),
                                    ),
                                    BidDetailsItem(
                                      title: "* Pick Up address",
                                      details:
                                          activeBidDetails['pick_up_location'],
                                    ),
                                    BidDetailsItem(
                                      title: "* Drop address",
                                      details:
                                          activeBidDetails['drop_location'],
                                    ),
                                    BidDetailsItem(
                                      title: "* No. of passengers",
                                      details: activeBidDetails[
                                              'number_of_passengers']
                                          .toString(),
                                    ),
                                    BidDetailsItem(
                                      title: "* Your price",
                                      details: "Rs. " +
                                          activeBidDetails['traveller_price']
                                              .toString(),
                                    ),
                                    BidDetailsItem(
                                      title: "* Traveller note",
                                      details:
                                          activeBidDetails['traveller_note'],
                                    ),
                                    Container(
                                      // color: Colors.red,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.redAccent,
                                            ),
                                            onPressed: () {
                                              popUpDialogWithButtons(
                                                  context,
                                                  "Do you want to close Bid?",
                                                  "", () {
                                                widget
                                                    .changeEnablePostButtonState(
                                                        true);

                                                setState(() {
                                                  activeState = 0;
                                                });
                                                bidService.closeBid(
                                                    activeBidDetails['bid_id']);
                                                Navigator.of(context).pop();
                                              });
                                            },
                                            child: Text(
                                              "Close",
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
                                            onPressed: () {
                                              popUpDialogWithButtons(
                                                  context,
                                                  "Do you want to Finish Trip?",
                                                  "", () {
                                                widget
                                                    .changeEnablePostButtonState(
                                                        true);

                                                bidService
                                                    .finishBid(activeBidDetails[
                                                        'bid_id'])
                                                    .then((value) {
                                                  if (value == 1) {
                                                    setState(() {
                                                      activeState = 0;
                                                    });
                                                  }
                                                });
                                                Navigator.of(context).pop();
                                              });
                                            },
                                            child: Text(
                                              "Trip done",
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              : Center(
                                  child: Container(
                                    child: Text(
                                      "No active Bid",
                                      style: GoogleFonts.montserrat(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),

                          // CircularProgressIndicator()
                        ),
                        // Positioned(
                        //     top: 20,
                        //     right: 20,
                        //     child: Container(
                        //       width: 80,
                        //       height: 40,
                        //       // margin: EdgeInsets.only(top: 20),
                        //       child: ElevatedButton(
                        //         style: ElevatedButton.styleFrom(
                        //           primary: Colors.redAccent,
                        //         ),
                        //         onPressed: () {},
                        //         child: Text(
                        //           "Close",
                        //           style: GoogleFonts.montserrat(
                        //               fontSize: 15,
                        //               color: Colors.white,
                        //               fontWeight: FontWeight.w600),
                        //         ),
                        //       ),
                        //     ))
                      ],
                    ),
                    GreenTagWidget(
                      title: "Response for Bid",
                    ),
                    test != 0
                        ? Container(
                            width: 100,
                            height: 20,
                            color: Colors.amber,
                          )
                        : Container(
                            child: Column(
                              children: bidResponses.length != 0
                                  ? bidService.loadBidResponses(
                                      context,
                                      bidResponses,
                                      activeBidDetails['bid_id'],
                                      refreshActiveBidScreen)
                                  : [
                                      BidResponseWidget(
                                        comment:
                                            "helloo i like your offer, you can contact me here if you can , that is the best service so far, when i addict to to it it would be marvolus",
                                        date: "2013-04-05",
                                        firstName: "Shehan",
                                        rating: 4.6,
                                        secondeName: "Sandeepa",
                                      ),
                                      BidResponseWidget(
                                        comment:
                                            "helloo i like your offer, you can contact me here if you can , that is the best service so far, when i addict to to it it would be marvolus",
                                        date: "2013-04-05",
                                        firstName: "Shehan",
                                        rating: 4.6,
                                        secondeName: "Sandeepa",
                                      ),
                                      BidResponseWidget(
                                        comment:
                                            "helloo i like your offer, you can contact me here if you can , that is the best service so far, when i addict to to it it would be marvolus",
                                        date: "2013-04-05",
                                        firstName: "Shehan",
                                        rating: 4.6,
                                        secondeName: "Sandeepa",
                                      ),
                                    ],
                            ),
                          ),
                    SizedBox(
                      height: 200,
                    )
                  ],
                ),
              )
            ],
          ),
        ));
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
