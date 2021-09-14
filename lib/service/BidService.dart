import 'package:ceyntra_mobile/views/screens/clickOnThePlace/Bid/HistoryBidWidget.dart';
import 'package:ceyntra_mobile/views/widgets/feedPlaceWidget.dart';
import 'package:ceyntra_mobile/views/widgets/reviewWidget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BidService {
  var dio = Dio();

  Future<int> addBidDetails(pickUpTime, pickUpAddress, dropAddress,
      noOfpassengers, price, travellerNote, travellerId) async {
    Map<String, dynamic> bidDetails = {
      "traveller_id": travellerId,
      "pick_up_time": pickUpTime,
      "pick_up_location": pickUpAddress,
      "drop_location": dropAddress,
      "number_of_passengers": int.parse(noOfpassengers),
      "traveller_price": int.parse(price),
      "traveller_note": travellerNote
    };

    var response =
        await dio.post('http://10.0.2.2:9092/addBidDetails', data: bidDetails);

    return response.data;
  }

  Future<int> getUsertId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int res = prefs.getInt("userID");

    return res;
  }

  Future<dynamic> getActiveBidDetails() async {
    return getUsertId().then((value) async {
      var response =
          await dio.get('http://10.0.2.2:9092/getActiveBidDetails/$value');
      return response.data;
    });
  }

  Future<dynamic> getActiveBidDetailsForAddNewBid() async {
    return getUsertId().then((value) async {
      var response = await dio
          .get('http://10.0.2.2:9092/getActiveBidDetailsForAddNewBid/$value');
      return response.data;
    });
  }

  void closeBid(bidId) async {
    var response = await dio.get('http://10.0.2.2:9092/closeBid/$bidId');
    return response.data;
  }

  void finishBid(bidId) async {
    var response = await dio.get('http://10.0.2.2:9092/finishBid/$bidId');
    return response.data;
  }

  Future<dynamic> getBidHistory() async {
    return getUsertId().then((value) async {
      var response = await dio.get('http://10.0.2.2:9092/getBidHistory/$value');
      return response.data;
    });
  }

  List<Widget> loadHistory(
    BuildContext context,
    pageData,
  ) {
    final items = List<Widget>.generate(
      pageData.length,
      (index) => HistoryBidWidget(
        date: pageData[index]['timestamp'],
        dropAddress: pageData[index]['drop_location'],
        noOfPassengers: pageData[index]['number_of_passengers'],
        pickUpAddress: pageData[index]['pick_up_location'],
        travellerNote: pageData[index]['traveller_note'],
        yourPrice: pageData[index]['traveller_price'],
      ),
    );
    return items;
  }

  // // void loadAllPlaces() async {
  // //   // final geoPosition = await Geolocator.getCurrentPosition(
  // //   //     desiredAccuracy: LocationAccuracy.high);
  // //   // Map<String, double> currentLocation = {
  // //   //   "latitude": geoPosition.latitude,
  // //   //   "longitude": geoPosition.longitude
  // //   // };

  // //   Map<String, double> currentLocation = {
  // //     "latitude": 7.9573,
  // //     "longitude": 80.7600
  // //   };
  // //   var dio = Dio();
  // //   var response = await dio.post("http://10.0.2.2:9092/getAllPlaces",
  // //       data: currentLocation);

  // //   setState(() {
  // //     placeList = response.data;
  // //   });
  // // }

  // loadAllPlaces(Function setPlaceList, Function setPlacePhotos) async {
  //   // final geoPosition = await Geolocator.getCurrentPosition(
  //   //     desiredAccuracy: LocationAccuracy.high);
  //   // Map<String, double> currentLocation = {
  //   //   "latitude": geoPosition.latitude,
  //   //   "longitude": geoPosition.longitude
  //   // };

  //   Map<String, double> currentLocation = {
  //     "latitude": 7.9573,
  //     "longitude": 80.7600
  //   };

  //   var response = await dio.post("http://10.0.2.2:9092/getAllPlaces",
  //       data: currentLocation);

  //   if (response != null) {
  //     print("inner");
  //     var id = response.data[0]['place_id'];
  //     var response2 =
  //         await dio.get("http://10.0.2.2:9092/getTopPlacePhotos/$id");

  //     // print(response2.data[0]);
  //     setPlacePhotos(response2.data);
  //   }

  //   setPlaceList(response.data);
  // }

  // loadAllPlacesForPopulerFeed(
  //     Function setPlaceList, Function setPlacePhotos) async {
  //   // final geoPosition = await Geolocator.getCurrentPosition(
  //   //     desiredAccuracy: LocationAccuracy.high);
  //   // Map<String, double> currentLocation = {
  //   //   "latitude": geoPosition.latitude,
  //   //   "longitude": geoPosition.longitude
  //   // };

  //   Map<String, double> currentLocation = {
  //     "latitude": 7.9573,
  //     "longitude": 80.7600
  //   };

  //   var response = await dio.post("http://10.0.2.2:9092/getAllPlaces",
  //       data: currentLocation);

  //   if (response != null) {
  //     print("inner");
  //     var id = response.data[0]['place_id'];
  //     var response2 =
  //         await dio.get("http://10.0.2.2:9092/getTopPlacePhotos/$id");

  //     // print(response2.data[0]);
  //     setPlacePhotos(response2.data);
  //   }

  //   setPlaceList(response.data);
  // }

  // // List<Widget> loadNearMePlaces(BuildContext context) {
  // //   final items = List<Widget>.generate(
  // //     placeList.length,
  // //     (index) => FeedPlaceWidget(
  // //       placeId: placeList[index]['place_id'],
  // //       latitude: placeList[index]['latitude'],
  // //       longitude: placeList[index]['longitude'],
  // //       imagePath: placeList[index]['photo'],
  // //       placeName: placeList[index]['place_name'],
  // //       votes: placeList[index]['number_of_votes'],
  // //       rating: placeList[index]['rating'],
  // //       description: placeList[index]['description'],
  // //       changeMainFeedStateState: widget.changeMainFeedStateState,
  // //       setClickedPlace: widget.setClickedPlace,
  // //       setNullClickedOnThePlaceState: widget.setNullClickedOnThePlaceState,
  // //     ),
  // //   );
  // //   return items;
  // // }

  // List<Widget> loadNearMePlaces(
  //     BuildContext context,
  //     placeList,
  //     changeMainFeedStateState,
  //     setClickedPlace,
  //     setNullClickedOnThePlaceState) {
  //   final items = List<Widget>.generate(
  //     placeList.length,
  //     (index) => FeedPlaceWidget(
  //       placeId: placeList[index]['place_id'],
  //       latitude: placeList[index]['latitude'],
  //       longitude: placeList[index]['longitude'],
  //       imagePath: placeList[index]['photo'],
  //       placeName: placeList[index]['place_name'],
  //       votes: placeList[index]['number_of_votes'],
  //       rating: placeList[index]['rating'],
  //       description: placeList[index]['description'],
  //       changeMainFeedStateState: changeMainFeedStateState,
  //       setClickedPlace: setClickedPlace,
  //       setNullClickedOnThePlaceState: setNullClickedOnThePlaceState,
  //     ),
  //   );
  //   return items;
  // }

  // loadAllReviewsAndScreenData(Function setData, userId, placeId) async {
  //   Map<String, int> userAndPlaceData = {
  //     "user_id": userId,
  //     "place_id": placeId
  //   };

  //   var response = await dio.post("http://10.0.2.2:9092/getMetadataInPlace",
  //       data: userAndPlaceData);
  //   print(response.data['placeRating']);
  //   setData(response.data);
  // }

  // List<Widget> loadReviews(
  //   BuildContext context,
  //   pageData,
  // ) {
  //   var reviewList = pageData['list'];
  //   final items = List<Widget>.generate(
  //     reviewList.length,
  //     (index) => ReviewWidget(
  //       comment: reviewList[index]['placeReviewEntity']['comment'],
  //       rating: reviewList[index]['rating'],
  //       date: reviewList[index]['placeReviewEntity']['timestamp'],
  //       firstName: reviewList[index]['travellerEntity']['firstName'],
  //       profile_photo: reviewList[index]['travellerEntity']['photo'],
  //       secondeName: reviewList[index]['travellerEntity']['lastName'],
  //     ),
  //   );
  //   return items;
  // }

  // void updateFavouritePlace(bool favourite, userId, placeId) async {
  //   Map<String, dynamic> details = {
  //     "favouriteStatus": favourite,
  //     "userId": userId,
  //     "placeId": placeId
  //   };
  //   var response = await dio.post('http://10.0.2.2:9092/updateFavouritePlace',
  //       data: details);
  // }

}
