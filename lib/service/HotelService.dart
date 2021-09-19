import 'package:ceyntra_mobile/views/widgets/HotelWidget.dart';
import 'package:ceyntra_mobile/views/widgets/HotelWidget2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HotelService {
  var dio = Dio();
  Future<int> getUsertId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int res = prefs.getInt("userID");

    return res;
  }

  loadAllHotels(Function setHotels) async {
    // final geoPosition = await Geolocator.getCurrentPosition(
    //     desiredAccuracy: LocationAccuracy.high);
    // Map<String, double> currentLocation = {
    //   "latitude": geoPosition.latitude,
    //   "longitude": geoPosition.longitude
    // };

    Map<String, double> currentLocation = {
      "latitude": 7.9573,
      "longitude": 80.7600
    };

    var response = await dio.post(
        "http://10.0.2.2:9092/getAllHotelsForLocation",
        data: currentLocation);

    setHotels(response.data);
  }

  Future<dynamic> loadFavHotels() async {
    return getUsertId().then((value) async {
      var response = await dio.get('http://10.0.2.2:9092/loadFavHotels/$value');
      return response.data;
    });
  }

  List<Widget> loadHotelWidgets(BuildContext context, hotelList,
      setClickedHotel, changeMainFeedStateState) {
    final items = List<Widget>.generate(
      hotelList.length,
      (index) => HotelWidget(
        changeMainFeedStateState: changeMainFeedStateState,
        setClickedHotel: setClickedHotel,
        description: hotelList[index]['description'],
        name: hotelList[index]['name'],
        regNumber: hotelList[index]['registration_number'],
        numOfVotes: hotelList[index]['number_of_votes'],
        profilePhoto: hotelList[index]['profile_photo'],
        rating: hotelList[index]['rating'],
        hotelId: hotelList[index]['hotel_id'],
      ),
    );
    return items;
  }

  List<Widget> loadFavHotelWidgets(
      Function setHamburgerStateNull,
      BuildContext context,
      hotelList,
      setClickedHotel,
      changeMainFeedStateState) {
    final items = List<Widget>.generate(
      hotelList.length,
      (index) => HotelWidget2(
        setHamburgerStateNull: setHamburgerStateNull,
        changeMainFeedStateState: changeMainFeedStateState,
        setClickedHotel: setClickedHotel,
        description: hotelList[index]['description'],
        name: hotelList[index]['name'],
        regNumber: hotelList[index]['registration_number'],
        numOfVotes: hotelList[index]['number_of_votes'],
        profilePhoto: hotelList[index]['profile_photo'],
        rating: hotelList[index]['rating'],
        hotelId: hotelList[index]['hotel_id'],
      ),
    );
    return items;
  }
}
