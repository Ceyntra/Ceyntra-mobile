import 'package:ceyntra_mobile/views/widgets/GuideWidget.dart';
import 'package:ceyntra_mobile/views/widgets/GuideWidget2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GuideService {
  var dio = Dio();
  Future<int> getUsertId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int res = prefs.getInt("userID");

    return res;
  }

  loadAllGuides(double latitude, double longitude, Function setGuides) async {
    // final geoPosition = await Geolocator.getCurrentPosition(
    //     desiredAccuracy: LocationAccuracy.high);
    // Map<String, double> currentLocation = {
    //   "latitude": geoPosition.latitude,
    //   "longitude": geoPosition.longitude
    // };

    Map<String, double> currentLocation = {
      "latitude": latitude,
      "longitude": longitude
    };

    var response = await dio.post(
        "http://10.0.2.2:9092/getAllGuidesForLocation",
        data: currentLocation);

    setGuides(response.data);
  }

  Future<dynamic> loadFavGuides() async {
    return getUsertId().then((value) async {
      var response = await dio.get('http://10.0.2.2:9092/loadFavGuides/$value');
      return response.data;
    });
  }

  List<Widget> loadGuideWidgets(BuildContext context, guideList,
      setClickedGuide, changeMainFeedStateState) {
    final items = List<Widget>.generate(
      guideList.length,
      (index) => GuideWidget(
        changeMainFeedStateState: changeMainFeedStateState,
        setClickedGuide: setClickedGuide,
        perDayPrice: guideList[index]['per_day_price'],
        vehicleState: guideList[index]['vehicle_state'],
        description: guideList[index]['description'],
        firstName: guideList[index]['first_name'],
        lastName: guideList[index]['last_name'],
        nic: guideList[index]['nic'],
        numOfVotes: guideList[index]['number_of_votes'],
        profilePhoto: guideList[index]['profile_photo'],
        photo: guideList[index]['photo'],
        rating: guideList[index]['rating'],
        guideId: guideList[index]['guide_id'],
      ),
    );
    return items;
  }

  List<Widget> loadFavGuideWidgets(
      Function setHamburgerStateNull,
      BuildContext context,
      guideList,
      setClickedGuide,
      changeMainFeedStateState) {
    final items = List<Widget>.generate(
      guideList.length,
      (index) => GuideWidget2(
        setHamburgerStateNull: setHamburgerStateNull,
        changeMainFeedStateState: changeMainFeedStateState,
        setClickedGuide: setClickedGuide,
        perDayPrice: guideList[index]['per_day_price'],
        vehicleState: guideList[index]['vehicle_state'],
        description: guideList[index]['description'],
        firstName: guideList[index]['first_name'],
        lastName: guideList[index]['last_name'],
        nic: guideList[index]['nic'],
        numOfVotes: guideList[index]['number_of_votes'],
        profilePhoto: guideList[index]['profile_photo'],
        photo: guideList[index]['photo'],
        rating: guideList[index]['rating'],
        guideId: guideList[index]['guide_id'],
      ),
    );
    return items;
  }
}
