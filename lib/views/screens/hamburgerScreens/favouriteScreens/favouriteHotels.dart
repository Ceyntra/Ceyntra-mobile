import 'package:ceyntra_mobile/service/HotelService.dart';
import 'package:ceyntra_mobile/service/TaxiDriverService.dart';
import 'package:flutter/material.dart';
import 'package:ceyntra_mobile/views/widgets/DisplayRatingWidget.dart';

class FavouriteHotelsScreen extends StatefulWidget {
  final ValueChanged<String> changeMainFeedStateState;
  final Function setClickedHotel;
  final Function setHamburgerStateNull;

  FavouriteHotelsScreen(
      {this.setHamburgerStateNull,
      this.changeMainFeedStateState,
      this.setClickedHotel});
  @override
  _FavouriteHotelsScreenState createState() => _FavouriteHotelsScreenState();
}

class _FavouriteHotelsScreenState extends State<FavouriteHotelsScreen> {
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
          ? hotelService.loadFavHotelWidgets(
              widget.setHamburgerStateNull,
              context,
              hotelList,
              widget.setClickedHotel,
              widget.changeMainFeedStateState)
          : [],
    );
  }
}
