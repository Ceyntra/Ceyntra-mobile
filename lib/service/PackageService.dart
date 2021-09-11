import 'dart:convert';
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








}