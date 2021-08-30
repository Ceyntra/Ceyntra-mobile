import 'package:ceyntra_mobile/views/widgets/GuideWidget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GuideService {
  var dio = Dio();
  loadAllGuides(Function setGuides) async {
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
        "http://10.0.2.2:9092/getAllGuidesForLocation",
        data: currentLocation);

    setGuides(response.data);
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
}
