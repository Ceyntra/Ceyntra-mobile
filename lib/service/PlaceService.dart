import 'package:ceyntra_mobile/views/widgets/feedPlaceWidget.dart';
import 'package:ceyntra_mobile/views/widgets/reviewWidget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PlaceService {
  // void loadAllPlaces() async {
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
  //   var dio = Dio();
  //   var response = await dio.post("http://10.0.2.2:9092/getAllPlaces",
  //       data: currentLocation);

  //   setState(() {
  //     placeList = response.data;
  //   });
  // }

  var dio = Dio();

  loadAllPlaces(Function setPlaceList) async {
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

    var response = await dio.post("http://10.0.2.2:9092/getAllPlaces",
        data: currentLocation);

    setPlaceList(response.data);
  }

  // List<Widget> loadNearMePlaces(BuildContext context) {
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
  //       changeMainFeedStateState: widget.changeMainFeedStateState,
  //       setClickedPlace: widget.setClickedPlace,
  //       setNullClickedOnThePlaceState: widget.setNullClickedOnThePlaceState,
  //     ),
  //   );
  //   return items;
  // }

  List<Widget> loadNearMePlaces(
      BuildContext context,
      placeList,
      changeMainFeedStateState,
      setClickedPlace,
      setNullClickedOnThePlaceState) {
    final items = List<Widget>.generate(
      placeList.length,
      (index) => FeedPlaceWidget(
        placeId: placeList[index]['place_id'],
        latitude: placeList[index]['latitude'],
        longitude: placeList[index]['longitude'],
        imagePath: placeList[index]['photo'],
        placeName: placeList[index]['place_name'],
        votes: placeList[index]['number_of_votes'],
        rating: placeList[index]['rating'],
        description: placeList[index]['description'],
        changeMainFeedStateState: changeMainFeedStateState,
        setClickedPlace: setClickedPlace,
        setNullClickedOnThePlaceState: setNullClickedOnThePlaceState,
      ),
    );
    return items;
  }

  loadAllReviewsAndScreenData(Function setData, userId, placeId) async {
    Map<String, int> userAndPlaceData = {
      "user_id": userId,
      "place_id": placeId
    };

    var response = await dio.post("http://10.0.2.2:9092/getMetadataInPlace",
        data: userAndPlaceData);

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
        comment: reviewList[index]['placeReviewEntity']['comment'],
        rating: reviewList[index]['rating'],
        date: reviewList[index]['placeReviewEntity']['timestamp'],
        firstName: reviewList[index]['travellerEntity']['firstName'],
        profile_photo: reviewList[index]['travellerEntity']['photo'],
        secondeName: reviewList[index]['travellerEntity']['lastName'],
      ),
    );
    return items;
  }

  void updateFavouritePlace(bool favourite, userId, placeId) async {
    Map<String, dynamic> details = {
      "favouriteStatus": favourite,
      "userId": userId,
      "placeId": placeId
    };
    var response = await dio.post('http://10.0.2.2:9092/updateFavouritePlace',
        data: details);
  }

  Future<int> addReview(comment, rating, placeId, userId) async {
    Map<String, dynamic> reviewData = {
      "comment": comment,
      "rating": rating,
      "placeId": placeId,
      "userId": userId
    };

    var response =
        await dio.post('http://10.0.2.2:9092/addReview', data: reviewData);

    return response.data;
  }
}
