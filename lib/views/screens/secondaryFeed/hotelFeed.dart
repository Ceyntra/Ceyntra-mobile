import 'package:ceyntra_mobile/service/HotelService.dart';
import 'package:ceyntra_mobile/service/TaxiDriverService.dart';
import 'package:flutter/material.dart';
import 'package:ceyntra_mobile/views/widgets/DisplayRatingWidget.dart';

class HotelFeedScreen extends StatefulWidget {
  final ValueChanged<String> changeMainFeedStateState;
  final Function setClickedHotel;

  HotelFeedScreen({this.changeMainFeedStateState, this.setClickedHotel});
  @override
  _HotelFeedScreenState createState() => _HotelFeedScreenState();
}

class _HotelFeedScreenState extends State<HotelFeedScreen> {
  HotelService hotelService = HotelService();
  var hotelList;
  void setHotelList(res) {
    print(res);
    setState(() {
      hotelList = res;
    });
  }

  @override
  void initState() {
    super.initState();
    hotelService.loadAllHotels(setHotelList);
    // loadAllPlaces();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: hotelList != null
          ? hotelService.loadHotelWidgets(context, hotelList,
              widget.setClickedHotel, widget.changeMainFeedStateState)
          : [],
    );
  }
}
