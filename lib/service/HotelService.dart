import 'package:ceyntra_mobile/views/widgets/HotelWidget.dart';
import 'package:ceyntra_mobile/views/widgets/HotelWidget2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class HotelService {
  var dio = Dio();
  Future<int> getUsertId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int res = prefs.getInt("userID");

    return res;
  }

  loadAllHotels(double latitude, double longitude, Function setHotels) async {
    Map<String, double> currentLocation = {
      "latitude": latitude,
      "longitude": longitude
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

  static Future<double> getHotelRating(int spID) async {

    http.Response response = await http.get(
        Uri.parse('http://10.0.2.2:9092/getHotelRating/$spID')  //$userID
    );

    return double.parse(response.body);
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
