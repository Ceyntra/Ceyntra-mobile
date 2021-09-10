
import 'dart:convert';

import 'package:ceyntra_mobile/models/PackageModel.dart';
import 'package:ceyntra_mobile/service/UserService.dart';
import 'package:http/http.dart' as http;


class PackageService{

//  Taxis
  Future<List<PackageModel>> loadTaxiPackages() async {

    UserService userService=new UserService();

    int userID= await userService.getUserID();

      http.Response response = await http.get(
          Uri.parse('http://10.0.2.2:9092/taxiPackages/$userID')  //$userID
      );

      final packageJson = json.decode(response.body);

      var listJson=packageJson as List;

      List<PackageModel> packages= [];

      packages = listJson
          .map((package) => PackageModel.fromJson(package))
          .toList();

      return packages;
  }






}