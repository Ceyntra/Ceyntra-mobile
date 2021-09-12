import 'package:ceyntra_mobile/views/screens/clickOnThePlace/Bid/activeBid.dart';
import 'package:ceyntra_mobile/views/screens/clickOnThePlace/Bid/addNewBidScreen.dart';
import 'package:ceyntra_mobile/views/screens/clickOnThePlace/clickOnTheTaxi/clickedTaxiInfo.dart';
import 'package:ceyntra_mobile/views/screens/clickOnThePlace/clickOnaTheHotel/clickedHotelChat.dart';
import 'package:ceyntra_mobile/views/screens/clickOnThePlace/clickOnaTheHotel/clickedHotelInfo.dart';
import 'package:ceyntra_mobile/views/screens/clickOnThePlace/clickOnaTheHotel/clickedHotelPackages.dart';
import 'package:ceyntra_mobile/views/screens/privateChatScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ClickOnTheTaxiFeedBid extends StatefulWidget {
  // const ClickOnTheTaxiFeedBid({ Key? key }) : super(key: key);

  final ValueChanged<String> changeClickedOnThePlaceState;
  final ValueChanged<String> changeMainFeedStateState;
  ClickOnTheTaxiFeedBid(
      {this.changeMainFeedStateState, this.changeClickedOnThePlaceState});

  @override
  _ClickOnTheTaxiFeedBidState createState() => _ClickOnTheTaxiFeedBidState();
}

class _ClickOnTheTaxiFeedBidState extends State<ClickOnTheTaxiFeedBid> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Color(0xff192537),
        appBar: AppBar(
          backgroundColor: Color(0xff192537),
          title: Text(
            "Package Bid",
            style: GoogleFonts.montserrat(fontSize: 18, color: Colors.white),
          ),
          leading: InkWell(
            onTap: () {
              widget.changeClickedOnThePlaceState("taxi");
              widget.changeMainFeedStateState("clickOnThePlace");
            },
            child: Icon(Icons.arrow_back),
          ),
          bottom: TabBar(
            labelColor: Colors.green,
            unselectedLabelColor: Colors.yellow[700],
            tabs: [
              Tab(
                icon: Icon(Icons.info),
                child: Text(
                  "New bid",
                  style: GoogleFonts.montserrat(color: Colors.white),
                ),
              ),
              Tab(
                icon: Icon(Icons.chat_outlined),
                child: Text(
                  "Active",
                  style: GoogleFonts.montserrat(color: Colors.white),
                ),
              ),
              Tab(
                icon: Icon(Icons.backpack),
                child: Text(
                  "History",
                  style: GoogleFonts.montserrat(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            AddNewBidScree(),
            ActiveBid(),
            Container(
              child: Text("history"),
            )
          ],
        ),
      ),
    );
  }
}
