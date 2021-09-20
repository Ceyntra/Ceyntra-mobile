import 'package:ceyntra_mobile/views/widgets/feedPlaceWidget.dart';
import 'package:ceyntra_mobile/views/widgets/feedPlaceWidget2.dart';
import 'package:ceyntra_mobile/views/widgets/reviewWidget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  loadAllPlaces(Function setPlaceList, Function setPlacePhotos) async {
    // final geoPosition = await Geolocator.getCurrentPosition(
    //     desiredAccuracy: LocationAccuracy.high);
    // Map<String, double> currentLocation = {
    //   "latitude": geoPosition.latitude,
    //   "longitude": geoPosition.longitude
    // };

    // Dambulla coordinates
    Map<String, double> currentLocation = {
      "latitude": 7.8742,
      "longitude": 80.6511
    };

    // Mathara coordinates
    // Map<String, double> currentLocation = {
    //   "latitude": 5.9549,
    //   "longitude": 80.5550
    // };

    var response = await dio.post("http://10.0.2.2:9092/getAllPlaces",
        data: currentLocation);

    if (response != null) {
      var id = response.data[0]['place_id'];
      var response2 =
          await dio.get("http://10.0.2.2:9092/getTopPlacePhotos/$id");

      // print(response2.data[0]);
      setPlacePhotos(response2.data);
    }

    setPlaceList(response.data);
  }

  loadAllPlacesForPopulerFeed(
      Function setPlaceList, Function setPlacePhotos) async {
    var response =
        await dio.post("http://10.0.2.2:9092/getAllPlacesForPopularFeed");

    if (response != null) {
      print("inner");
      var id = response.data[0]['place_id'];
      var response2 =
          await dio.get("http://10.0.2.2:9092/getTopPlacePhotos/$id");

      // print(response2.data[0]);
      setPlacePhotos(response2.data);
    }

    setPlaceList(response.data);
  }

  Future<dynamic> loadPlaceListForSearchDropDown() async {
    var list = [];
    Map<String, double> currentLocation = {
      "latitude": 7.8742,
      "longitude": 80.6511
    };

    var response = await dio.post("http://10.0.2.2:9092/getAllPlaces",
        data: currentLocation);

    for (int i = 0; i < response.data.length; i++) {
      list.add(response.data[i]["place_name"].toString());
    }

    return list;
  }

  Future<dynamic> loadPlaceListForSearchDropDownPopulerFeed() async {
    var list = [];

    var response =
        await dio.post("http://10.0.2.2:9092/getAllPlacesForPopularFeed");

    for (int i = 0; i < response.data.length; i++) {
      list.add(response.data[i]["place_name"].toString());
    }

    return list;
  }

  Future<dynamic> getPlaceByPlaceName(placeName) async {
    var response =
        await dio.get("http://10.0.2.2:9092/getPlaceByPlaceName/$placeName");

    return response.data;
  }

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
    print(response.data['placeRating']);
    setData(response.data);
  }

  Future<dynamic> loadAllReviewsAndScreenData2(userId, placeId) async {
    Map<String, int> userAndPlaceData = {
      "user_id": userId,
      "place_id": placeId
    };

    var response = await dio.post("http://10.0.2.2:9092/getMetadataInPlace",
        data: userAndPlaceData);

    // setData(response.data);

    return response.data;
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

  Future<int> getUsertId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int res = prefs.getInt("userID");

    return res;
  }

  Future<dynamic> loadFavPlaces() async {
    return getUsertId().then((value) async {
      var response = await dio.get('http://10.0.2.2:9092/loadFavPlaces/$value');
      return response.data;
    });
  }

  List<Widget> loadFavPlaceList(
      Function setHamburgerStateNull,
      BuildContext context,
      placeList,
      changeMainFeedStateState,
      setClickedPlace,
      setNullClickedOnThePlaceState) {
    final items = List<Widget>.generate(
      placeList.length,
      (index) => FeedPlaceWidget2(
        setHamburgerStateNull: setHamburgerStateNull,
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
}
