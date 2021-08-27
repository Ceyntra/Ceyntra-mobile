import 'package:ceyntra_mobile/service/TaxiDriverService.dart';
import 'package:flutter/material.dart';
import 'package:ceyntra_mobile/views/widgets/DisplayRatingWidget.dart';

class TaxiFeedScreen extends StatefulWidget {
  final ValueChanged<String> changeMainFeedStateState;
  final ValueChanged<String> setClickedTaxi;

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
      children: taxiDriverList != null
          ? taxiDriverService.loadTaxiWidgets(context, taxiDriverList)
          : [],
    );
  }
}
