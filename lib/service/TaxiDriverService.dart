import 'package:ceyntra_mobile/views/widgets/TaxiWidget.dart';
import 'package:ceyntra_mobile/views/widgets/TaxiWidget2.dart';
import 'package:ceyntra_mobile/views/widgets/reviewWidget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class TaxiDriverService {
  var dio = Dio();
  Future<int> getUsertId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int res = prefs.getInt("userID");

    return res;
  }

  loadAllTaxis(Function setTaxis, double latitude, double longitude) async {
    // final geoPosition = await Geolocator.getCurrentPosition(
    //     desiredAccuracy: LocationAccuracy.high);
    // Map<String, double> currentLocation = {
    //   "latitude": geoPosition.latitude,
    //   "longitude": geoPosition.longitude
    // };
    print(latitude);
    print(longitude);

    Map<String, double> currentLocation = {
      "latitude": latitude,
      "longitude": longitude
    };

    var response = await dio.post("http://10.0.2.2:9092/getAllTaxisForLocation",
        data: currentLocation);

    setTaxis(response.data);
  }

  Future<dynamic> loadFavTaxies() async {
    return getUsertId().then((value) async {
      var response = await dio.get('http://10.0.2.2:9092/loadFavTaxies/$value');
      return response.data;
    });
  }

  static Future<double> getTaxiRating(int spID) async {

    http.Response response = await http.get(
        Uri.parse('http://10.0.2.2:9092/getTaxiRating/$spID')  //$userID
    );

    return double.parse(response.body);
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

  List<Widget> loadFavTaxiWidgets(
      Function setHamburgerStateNull,
      BuildContext context,
      taxiList,
      setClickedTaxi,
      changeMainFeedStateState) {
    final items = List<Widget>.generate(
      taxiList.length,
      (index) => TaxiWidget2(
        setHamburgerStateNull: setHamburgerStateNull,
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

  void updateFavouritePlace(bool favourite, userId, spId) async {
    Map<String, dynamic> details = {
      "favouriteStatus": favourite,
      "userId": userId,
      "placeId": spId
    };
    var response =
        await dio.post('http://10.0.2.2:9092/updateFavouriteSp', data: details);
  }

  Future<int> addComplaint(spId, description) {
    // print(spId.toString() + " " + description.toString());
    return getUsertId().then((value) async {
      Map<String, dynamic> details = {
        "description": description,
        "traveller_id": value,
        "sp_id": spId,
      };
      var response =
          await dio.post('http://10.0.2.2:9092/addComplaint', data: details);
      return response.data;
    });
  }

  Future<dynamic> getTravellerData() {
    return getUsertId().then((value) async {
      var response =
          await dio.get('http://10.0.2.2:9092/getTravellerData/$value');
      return response.data;
    });
  }
}
