import 'package:ceyntra_mobile/models/placeModel.dart';
import 'package:ceyntra_mobile/service/HotelService.dart';
import 'package:ceyntra_mobile/service/TaxiDriverService.dart';
import 'package:flutter/material.dart';
import 'package:ceyntra_mobile/views/widgets/DisplayRatingWidget.dart';

class HotelFeedScreen extends StatefulWidget {
  final ValueChanged<String> changeMainFeedStateState;
  final Function setClickedHotel;
  final PlaceModel place;

  HotelFeedScreen(
      {this.place, this.changeMainFeedStateState, this.setClickedHotel});
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
    hotelService.loadAllHotels(
        widget.place.latitude, widget.place.longitude, setHotelList);
    // loadAllPlaces();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: hotelList != null
          ? hotelService.loadHotelWidgets(context, hotelList,
              widget.setClickedHotel, widget.changeMainFeedStateState)
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
    );
  }
}
