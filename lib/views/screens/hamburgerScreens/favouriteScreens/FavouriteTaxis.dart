import 'package:ceyntra_mobile/service/TaxiDriverService.dart';
import 'package:flutter/material.dart';
import 'package:ceyntra_mobile/views/widgets/DisplayRatingWidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:translator/translator.dart';

class FavouriteTaxisScreen extends StatefulWidget {
  final ValueChanged<String> changeMainFeedStateState;
  final Function setClickedTaxi;
  final Function setHamburgerStateNull;

  FavouriteTaxisScreen(
      {this.changeMainFeedStateState,
      this.setClickedTaxi,
      this.setHamburgerStateNull});
  @override
  _FavouriteTaxisScreenState createState() => _FavouriteTaxisScreenState();
}

class _FavouriteTaxisScreenState extends State<FavouriteTaxisScreen> {
  TaxiDriverService taxiDriverService = TaxiDriverService();
  var taxiDriverList = [];

  @override
  void initState() {
    super.initState();
    taxiDriverService.loadFavTaxies().then((value) {
      setState(() {
        taxiDriverList = value;
      });
    });
    // loadAllPlaces();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: taxiDriverList.length != 0
                ? taxiDriverService.loadFavTaxiWidgets(
                    widget.setHamburgerStateNull,
                    context,
                    taxiDriverList,
                    widget.setClickedTaxi,
                    widget.changeMainFeedStateState)
                : [],
          ),
        ],
      ),
    );
  }
}
