import 'package:ceyntra_mobile/models/placeModel.dart';
import 'package:ceyntra_mobile/service/TaxiDriverService.dart';
import 'package:flutter/material.dart';
import 'package:ceyntra_mobile/views/widgets/DisplayRatingWidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:translator/translator.dart';

class TaxiFeedScreen extends StatefulWidget {
  final PlaceModel place;
  final ValueChanged<String> changeMainFeedStateState;
  final Function setClickedTaxi;

  TaxiFeedScreen(
      {this.place, this.changeMainFeedStateState, this.setClickedTaxi});
  @override
  _TaxiFeedScreenState createState() => _TaxiFeedScreenState();
}

class _TaxiFeedScreenState extends State<TaxiFeedScreen> {
  TaxiDriverService taxiDriverService = TaxiDriverService();
  var taxiDriverList;

  void setTaxiDriverList(res) {
    setState(() {
      taxiDriverList = res;
    });
  }

  @override
  void initState() {
    super.initState();
    print("this is taxifeed " + widget.place.latitude.toString());
    taxiDriverService.loadAllTaxis(
        setTaxiDriverList, widget.place.latitude, widget.place.longitude);
    // loadAllPlaces();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              widget.changeMainFeedStateState("clickOnTheTaxiBid");
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 40,
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green,
              ),
              child: Text(
                "Go to Bid Section Here",
                style: GoogleFonts.montserrat(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              alignment: Alignment.center,
            ),
          ),
          Column(
            children: taxiDriverList != null
                ? taxiDriverService.loadTaxiWidgets(context, taxiDriverList,
                    widget.setClickedTaxi, widget.changeMainFeedStateState)
                : [
                    Container(
                      // color: Colors.green,
                      width: 100,
                      height: 250,
                      child: Container(
                          alignment: Alignment.center,
                          width: 60,
                          height: 60,
                          // color: Colors.red,
                          child: CircularProgressIndicator()),
                    )
                  ],
          ),
        ],
      ),
    );
  }
}
