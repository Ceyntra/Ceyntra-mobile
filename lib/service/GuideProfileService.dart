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
}