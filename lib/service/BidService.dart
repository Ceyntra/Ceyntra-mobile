import 'package:ceyntra_mobile/views/screens/clickOnThePlace/Bid/AvailableBidWidget.dart';
import 'package:ceyntra_mobile/views/screens/clickOnThePlace/Bid/ConfirmedBidWidget.dart';
import 'package:ceyntra_mobile/views/screens/clickOnThePlace/Bid/HistoryBidWidget.dart';
import 'package:ceyntra_mobile/views/widgets/BidResponseWidget.dart';
import 'package:ceyntra_mobile/views/widgets/feedPlaceWidget.dart';
import 'package:ceyntra_mobile/views/widgets/reviewWidget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BidService {
  var dio = Dio();

  Future<int> addBidDetails(pickUpTime, pickUpAddress, dropAddress,
      noOfpassengers, price, travellerNote, travellerId) async {
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
    Map<String, dynamic> bidDetails = {
      "current_latitude": 7.9573,
      "current_longitude": 80.7600,
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

  Future<int> closeBid(bidId) async {
    var response = await dio.get('http://10.0.2.2:9092/closeBid/$bidId');
    return response.data;
  }

  Future<int> finishBid(bidId) async {
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

  Future<dynamic> getAvailableBids() async {
    return getUsertId().then((value) async {
      var response = await dio
          .get('http://10.0.2.2:9092/getAvailableBidsForTaxiDriver/$value');
      return response.data;
    });
  }

  Future<dynamic> getBidResponses(bidId) async {
    var response = await dio.get('http://10.0.2.2:9092/getBidResponses/$bidId');
    return response.data;
  }

  Future<dynamic> findCAcceptedTaxiDriver(bidId) async {
    var response =
        await dio.get('http://10.0.2.2:9092/findCAcceptedTaxiDriver/$bidId');
    return response.data;
  }

  Future<dynamic> taxiDriverRejectBid(int bidId) async {
    return getUsertId().then((value) async {
      Map<String, int> details = {"taxi_driver_id": value, "bid_id": bidId};
      var response = await dio.post('http://10.0.2.2:9092/taxiDriverRejectBid',
          data: details);
      return response.data;
    });
  }

  Future<dynamic> taxiDriverAcceptBid(int bidId, String note) async {
    return getUsertId().then((value) async {
      Map<String, int> details = {"taxi_driver_id": value, "bid_id": bidId};
      var response = await dio.post(
          'http://10.0.2.2:9092/taxiDriverAcceptBid/$note',
          data: details);
      return response.data;
    });
  }

  Future<dynamic> taxiDriverEndTrip(int bidId) async {
    return getUsertId().then((value) async {
      Map<String, int> details = {"taxi_driver_id": value, "bid_id": bidId};
      var response = await dio.post('http://10.0.2.2:9092/taxiDriverEndTrip',
          data: details);
      return response.data;
    });
  }

  Future<dynamic> bidConfirmationNotification() async {
    return getUsertId().then((value) async {
      var response = await dio
          .get('http://10.0.2.2:9092/bidConfirmationNotification/$value');
      return response.data;
    });
  }

  List<Widget> loadAvailableBids(BuildContext context, pageData, refreshPage) {
    final items = List<Widget>.generate(
      pageData.length,
      (index) => AvailableBidWidget(
        refresh: refreshPage,
        bidId: pageData[index]['bid_id'],
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

  List<Widget> loadConfirmedBids(BuildContext context, pageData, refreshPage) {
    final items = List<Widget>.generate(
      pageData.length,
      (index) => ConfirmedBidWidget(
        refresh: refreshPage,
        pickUpTime: pageData[index]['pick_up_time'],
        bidId: pageData[index]['bid_id'],
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

  List<Widget> loadBidResponses(
      BuildContext context, pageData, bidId, refreshActiveBidScreen) {
    final items = List<Widget>.generate(
      pageData.length,
      (index) => BidResponseWidget(
          comment: pageData[index]["taxiDriverNote"],
          firstName: pageData[index]["taxiDriverDetails"]["first_name"],
          profilePhoto: pageData[index]["taxiDriverDetails"]["profile_photo"],
          rating: pageData[index]["taxiDriverDetails"]["rating"],
          secondeName: pageData[index]["taxiDriverDetails"]["last_name"],
          bidId: bidId,
          taxiId: pageData[index]["taxiDriverDetails"]["taxi_driver_id"],
          refresh: refreshActiveBidScreen
          // date: pageData[index]["taxiDriverDetails"],
          ),
    );
    return items;
  }

  Future<dynamic> travellerAcceptBidResponse(
      int bidId, int taxiDriverId) async {
    Map<String, int> details = {
      "taxi_driver_id": taxiDriverId,
      "bid_id": bidId
    };
    var response = await dio
        .post('http://10.0.2.2:9092/travellerAcceptBidResponse', data: details);
    return response.data;
  }

  Future<dynamic> travellerRejectBidResponse(
      int bidId, int taxiDriverId) async {
    Map<String, int> details = {
      "taxi_driver_id": taxiDriverId,
      "bid_id": bidId
    };
    var response = await dio
        .post('http://10.0.2.2:9092/travellerRejectBidResponse', data: details);
    return response.data;
  }
}
