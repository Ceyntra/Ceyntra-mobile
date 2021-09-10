import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaxiPackageService{
  var dio=Dio();

  Future<int> getTaxiUsertId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt("userID");
    return id;
  }

  void getPackageDetails(Function setPackageList, id) async{
    var response= await dio.get('http://10.0.2.2:9092/getPackageDetails/6');
    setPackageList(response.data);
  }
}
