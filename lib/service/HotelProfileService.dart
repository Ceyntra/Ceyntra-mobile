import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HotelProfileService{
  var dio=Dio();

  Future<int> getHotelUsertId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt("userID");
    return id;
  }

  void getHotelProfileDetails(Function getHotelProfileData, uID) async{
    var response= await dio.get('http://10.0.2.2:9092/hotelUserProfile/$uID');
    getHotelProfileData(response);
  }

  Future<int> updateHotelProfilePhoto(photo, uID) async{
    Map<String, dynamic> photoData = {
      "photo": photo,
      "userID": uID,
    };
    var response = await dio.put('http://10.0.2.2:9092/updateHotelProfilePhoto', data: photoData);
    return response.data;
  }

  Future<int> updateHotelProfileDetails(updatedDetails) async{
    var response = await dio.put('http://10.0.2.2:9092/updateHotelProfileDetails', data: updatedDetails);
    return response.data;
  }

  Future<int> updateHotelPassword(passwordDetails) async{
    var response = await dio.put('http://10.0.2.2:9092/changePassword', data: passwordDetails);
    return response.data;
  }

  Future<int> removeHotelAccount(uID) async{
    var response = await dio.delete('http://10.0.2.2:9092/deleteHotelAccount/$uID');
    return response.data;
  }
}