import 'package:ceyntra_mobile/service/TaxiDriverService.dart';
import 'package:flutter/material.dart';
import 'package:ceyntra_mobile/views/widgets/DisplayRatingWidget.dart';

class TaxiFeedScreen extends StatefulWidget {
  final ValueChanged<String> changeMainFeedStateState;
  final Function setClickedTaxi;

  TaxiFeedScreen({this.changeMainFeedStateState, this.setClickedTaxi});
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
    taxiDriverService.loadAllTaxis(setTaxiDriverList);
    // loadAllPlaces();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            widget.changeMainFeedStateState("clickOnTheTaxiBid");
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 40,
            margin: EdgeInsets.only(top: 20),
            color: Colors.amber,
            child: Text("Open Package Bid"),
            alignment: Alignment.center,
          ),
        ),
        Column(
          children: taxiDriverList != null
              ? taxiDriverService.loadTaxiWidgets(context, taxiDriverList,
                  widget.setClickedTaxi, widget.changeMainFeedStateState)
              : [],
        ),
      ],
    );
  }
}
