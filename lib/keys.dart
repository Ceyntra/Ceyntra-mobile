import 'dart:async' show Future;
import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;



class Secret {

  static Future<String> getPlaceAPIKey() async {

    final String response = await rootBundle.loadString('assets/secrets.json');
    final data = await json.decode(response);

    return data['place_api_key'];
  }

}


