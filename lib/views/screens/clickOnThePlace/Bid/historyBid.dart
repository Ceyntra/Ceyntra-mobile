import 'package:ceyntra_mobile/service/BidService.dart';
import 'package:flutter/material.dart';

import 'activeBid.dart';

class HistoryBid extends StatefulWidget {
  // const HistoryBid({ Key? key }) : super(key: key);

  @override
  _HistoryBidState createState() => _HistoryBidState();
}

class _HistoryBidState extends State<HistoryBid> {
  BidService bidService = new BidService();
  var historyBidList;
  var activeState = 0;
  @override
  void initState() {
    super.initState();
    if (this.mounted) {
      setState(() {
        print("skjdf");
        activeState = 0;
      });
    }

    print("loaded");
    bidService.getBidHistory().then((value) {
      if (this.mounted) {
        setState(() {
          historyBidList = value;
          if (value.length != 0) {
            setState(() {
              activeState = 1;
            });
          }

          // print(value);
        });
      }
    });

    // widget.changeEnablePostButtonState(false);
    // bidService.getActiveBidDetailsForAddNewBid().then((value) {
    //   if (value == 1) {
    //     print("there is active bid");
    //     activeState = 1;
    //   } else {
    //     print("there is no active bid");
    //     setState(() {
    //       activeState = 0;
    //     });
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff031925),
        body: SingleChildScrollView(
            child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: activeState == 1
                ? bidService.loadHistory(context, historyBidList)
                : [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.blueAccent, width: 1),
                          color: Colors.black.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(15)),
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          BidDetailsItem(
                            title: "* Date",
                            details: "2013-06-24",
                          ),
                          BidDetailsItem(
                            title: "* Pick Up address",
                            details: "Kurunegala, Maraluwawa",
                          ),
                          BidDetailsItem(
                            title: "* Drop address",
                            details: "Kurunegala, Wellawa",
                          ),
                          BidDetailsItem(
                            title: "* No. of passengers",
                            details: "10",
                          ),
                          BidDetailsItem(
                            title: "* Your price",
                            details: "Rs. 1876",
                          ),
                          BidDetailsItem(
                            title: "* Traveller note",
                            details:
                                "I want to go here and there and it was beatiful and like that. blaa when i see you , in my heart fallen for you",
                          ),
                          BidDetailsItem(
                            lastElement: true,
                            title: "* Taxi driver details",
                            details: "Kasun rashmika, 0710157140",
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.blueAccent, width: 1),
                          color: Colors.black.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(15)),
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          BidDetailsItem(
                            title: "* Date",
                            details: "2013-06-24",
                          ),
                          BidDetailsItem(
                            title: "* Pick Up address",
                            details: "Kurunegala, Maraluwawa",
                          ),
                          BidDetailsItem(
                            title: "* Drop address",
                            details: "Kurunegala, Wellawa",
                          ),
                          BidDetailsItem(
                            title: "* No. of passengers",
                            details: "10",
                          ),
                          BidDetailsItem(
                            title: "* Your price",
                            details: "Rs. 1876",
                          ),
                          BidDetailsItem(
                            title: "* Traveller note",
                            details:
                                "I want to go here and there and it was beatiful and like that. blaa when i see you , in my heart fallen for you",
                          ),
                          BidDetailsItem(
                            lastElement: true,
                            title: "* Taxi driver details",
                            details: "Kasun rashmika, 0710157140",
                          )
                        ],
                      ),
                    )
                  ],
          ),
        )));
  }
}
