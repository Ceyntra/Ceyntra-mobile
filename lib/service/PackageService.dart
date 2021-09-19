import 'dart:convert';
import 'package:ceyntra_mobile/models/GuidePackageModel.dart';
import 'package:ceyntra_mobile/models/HotelPackageModel.dart';
import 'package:ceyntra_mobile/models/TaxiPackageModel.dart';
import 'package:ceyntra_mobile/service/UserService.dart';
import 'package:http/http.dart' as http;


class PackageService{

//  Taxis
  Future<List<TaxiPackageModel>> loadTaxiPackages(int userID) async {


      http.Response response = await http.get(
          Uri.parse('http://10.0.2.2:9092/taxiPackages/$userID')  //$userID
      );

      final packageJson = json.decode(response.body);
      print(packageJson);

      var listJson=packageJson as List;

      List<TaxiPackageModel> packages= [];

      packages = listJson
          .map((package) => TaxiPackageModel.fromJson(package))
          .toList();

      return packages;
  }

  //Hotel

  Future<List<HotelPackageModel>> loadHotelPackages(int userID) async {


    http.Response response = await http.get(
        Uri.parse('http://10.0.2.2:9092/hotelPackages/$userID')  //$userID
    );

    final packageJson = json.decode(response.body);

    var listJson=packageJson as List;

    List<HotelPackageModel> packages= [];

    packages = listJson
        .map((package) => HotelPackageModel.fromJson(package))
        .toList();

    print("Hotels");
    print(packages);

    return packages;
  }


  //Guide
  Future<List<GuidePackageModel>> loadGuidePackages(int userID) async {

    http.Response response = await http.get(
        Uri.parse('http://10.0.2.2:9092/guidePackages/$userID')  //$userID
    );

    final packageJson = json.decode(response.body);

    var listJson=packageJson as List;

    List<GuidePackageModel> packages= [];

    packages = listJson
        .map((package) => GuidePackageModel.fromJson(package))
        .toList();

    print("Guide");
    print(packages);

    return packages;
  }


  Future<bool> requestPackages(int packageId,int spId,String packageName,String packageType) async {

    UserService userService=new UserService();
    int id= await userService.getUserID();

    http.Response response = await http.post(
      Uri.parse('http://10.0.2.2:9092/requestPackage'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "packageId": packageId,
        "spId":spId,
        "travellerId":id,
        "packageName":packageName,
        "timestamp": "null",
        "packageType": packageType
      }),
    );
    final packageJson = json.decode(response.body);

    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }

  }











}