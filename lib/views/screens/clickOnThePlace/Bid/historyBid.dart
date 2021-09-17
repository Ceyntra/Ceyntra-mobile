import 'package:ceyntra_mobile/service/BidService.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                      width: MediaQuery.of(context).size.width * 0.9,
                      margin: EdgeInsets.only(top: 20),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue, width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text("No history",
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white.withOpacity(0.9),
                            )),
                      ),
                    )
                  ],
          ),
        )));
  }
}
