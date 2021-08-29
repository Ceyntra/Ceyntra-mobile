import 'package:ceyntra_mobile/views/widgets/TaxiWidget.dart';
import 'package:ceyntra_mobile/views/widgets/reviewWidget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class TaxiDriverService {
  var dio = Dio();

  loadAllTaxis(Function setTaxis) async {
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

    var response = await dio.post("http://10.0.2.2:9092/getAllTaxisForLocation",
        data: currentLocation);

    setTaxis(response.data);
  }

  List<Widget> loadTaxiWidgets(BuildContext context, taxiList, setClickedTaxi,
      changeMainFeedStateState) {
    final items = List<Widget>.generate(
      taxiList.length,
      (index) => TaxiWidget(
        changeMainFeedStateState: changeMainFeedStateState,
        setClickedTaxi: setClickedTaxi,
        driverLicense: taxiList[index]['driver_license'],
        firstName: taxiList[index]['first_name'],
        lastName: taxiList[index]['last_name'],
        numOfVotes: taxiList[index]['number_of_votes'],
        perKmPrice: taxiList[index]['per_km_price'],
        profilePhoto: taxiList[index]['profile_photo'],
        rating: taxiList[index]['rating'],
        taxiId: taxiList[index]['taxi_driver_id'],
        taxiPhoto: taxiList[index]['taxi_photo'],
      ),
    );
    return items;
  }

  void loadAllReviewsAndScreenData(Function setData, userId, spId) async {
    Map<String, int> userAndSpData = {"traveller_id": userId, "sp_id": spId};

    var response = await dio.post("http://10.0.2.2:9092/getMetadataInSp",
        data: userAndSpData);

    setData(response.data);
  }

  List<Widget> loadReviews(
    BuildContext context,
    pageData,
  ) {
    var reviewList = pageData['list'];
    final items = List<Widget>.generate(
      reviewList.length,
      (index) => ReviewWidget(
        comment: reviewList[index]['spReviewEntity']['comment'],
        rating: reviewList[index]['rating'],
        date: reviewList[index]['spReviewEntity']['timestamp'],
        firstName: reviewList[index]['travellerEntity']['firstName'],
        profile_photo: reviewList[index]['travellerEntity']['photo'],
        secondeName: reviewList[index]['travellerEntity']['lastName'],
      ),
    );
    return items;
  }

  Future<int> addReview(comment, rating, placeId, userId) async {
    Map<String, dynamic> reviewData = {
      "comment": comment,
      "rating": rating,
      "placeId": placeId,
      "userId": userId
    };

    var response =
        await dio.post('http://10.0.2.2:9092/addReviewToSp', data: reviewData);

    return response.data;
  }
}
