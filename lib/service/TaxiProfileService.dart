import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaxiProfileService{
  var dio=Dio();

  Future<int> getTaxiUsertId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt("userID");
    return id;
  }

  void getTaxiProfileDetails(Function getTaxiProfileData, uID) async{
    var response= await dio.get('http://10.0.2.2:9092/taxiUserProfile/$uID');
    getTaxiProfileData(response);
  }

  Future<int> updateTaxiProfilePhoto(photo, uID) async{
    Map<String, dynamic> photoData = {
      "photo": photo,
      "userID": uID,
    };
    var response = await dio.put('http://10.0.2.2:9092/updateTaxiProfilePhoto', data: photoData);
    return response.data;
  }

  Future<int> updateTaxiProfileDetails(updatedDetails) async{
    var response = await dio.put('http://10.0.2.2:9092/updateTaxiProfileDetails', data: updatedDetails);
    return response.data;
  }

  Future<int> updateDriverPassword(passwordDetails) async{
    var response = await dio.put('http://10.0.2.2:9092/changePassword', data: passwordDetails);
    return response.data;
  }

  Future<int> removeDriverAccount(uID) async{
    var response = await dio.delete('http://10.0.2.2:9092/deleteDriverAccount/$uID');
    return response.data;
  }
}