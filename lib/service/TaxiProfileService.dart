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
}