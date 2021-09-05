import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileService{
  var dio=Dio();

  Future<int> getUsertId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt("userID");
    return id;
  }

  void getProfileDetails(Function getProfileData, uID) async{
    var response= await dio.get('http://10.0.2.2:9092/userProfile/$uID');
    getProfileData(response);
  }

  Future<int> updateProfilePhoto(photo, uID) async{
    Map<String, dynamic> photoData = {
      "photo": photo,
      "userID": uID,
    };
    var response = await dio.put('http://10.0.2.2:9092/updateProfilePhoto', data: photoData);
    return response.data;
  }

  Future<int> updateProfileDetails(updatedDetails) async{
    var response = await dio.put('http://10.0.2.2:9092/updateProfileDetails', data: updatedDetails);
    return response.data;
  }
}