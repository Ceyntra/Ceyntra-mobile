import 'dart:ui';

import 'package:ceyntra_mobile/service/BidService.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatefulWidget {
  //const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  BidService bidService = new BidService();

  var availbaleBidList = [];
  var confirmedList = [];
  @override
  void initState() {
    super.initState();

    bidService.getAvailableBids().then((value) {
      print(value);
      setState(() {
        availbaleBidList = value;
      });
    });

    bidService.bidConfirmationNotification().then((value1) {
      setState(() {
        confirmedList = value1;
      });
    });
  }

  void refreshPage() {
    bidService.getAvailableBids().then((value) {
      print(value);
      setState(() {
        availbaleBidList = value;
      });
    });

    bidService.bidConfirmationNotification().then((value1) {
      setState(() {
        confirmedList = value1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2F3546),
      appBar: AppBar(
        title: Text(
          "Notifications",
          style: GoogleFonts.montserrat(fontSize: 18),
        ),
        backgroundColor: Color(0xff192537),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: availbaleBidList.length != 0
                    ? bidService.loadAvailableBids(
                        context, availbaleBidList, refreshPage)
                    : [Container()],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: confirmedList.length != 0
                    ? bidService.loadConfirmedBids(
                        context, confirmedList, refreshPage)
                    : [Container()],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
