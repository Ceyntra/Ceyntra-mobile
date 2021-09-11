import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GuideProfileService{
  var dio=Dio();

  Future<int> getGuideUsertId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt("userID");
    return id;
  }

  void getGuideProfileDetails(Function getGuideProfileData, uID) async{
    var response= await dio.get('http://10.0.2.2:9092/guideUserProfile/$uID');
    getGuideProfileData(response);
  }

  Future<int> updateGuideProfilePhoto(photo, uID) async{
    Map<String, dynamic> photoData = {
      "photo": photo,
      "userID": uID,
    };
    var response = await dio.put('http://10.0.2.2:9092/updateGuideProfilePhoto', data: photoData);
    return response.data;
  }

  Future<int> updateGuideProfileDetails(updatedDetails) async{
    var response = await dio.put('http://10.0.2.2:9092/updateGuideProfileDetails', data: updatedDetails);
    return response.data;
  }

  Future<int> updateGuidePassword(passwordDetails) async{
    var response = await dio.put('http://10.0.2.2:9092/changePassword', data: passwordDetails);
    return response.data;
  }
}