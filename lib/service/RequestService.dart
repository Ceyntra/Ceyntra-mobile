import 'package:http/http.dart' as http;

class RequestService{

  static Future<int> getRequestCount(int spID) async {

    http.Response response = await http.get(
        Uri.parse('http://10.0.2.2:9092/getNewRquestsCount/$spID')  //$userID
    );

    return int.parse(response.body);
  }
}