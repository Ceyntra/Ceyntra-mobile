import 'dart:convert';
import 'package:http/http.dart' as http;


class ForgetPasswordService{


  //Check validity of the email
  Future<bool> resetPassword(String email) async {

    print("Entered email :"+email);

    http.Response response = await http.post(
        Uri.parse('http://10.0.2.2:9092/resetpassword'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
      }),
    );

    if(response.statusCode ==200){
      print(json.decode(response.body));
      return true;
    }else{
      print("Error");
      return false;
    }
  }


  Future<bool> verifyPin(String email,String pin) async {

    http.Response response = await http.post(
      Uri.parse('http://10.0.2.2:9092/verifypin'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email':email,
        'pinNumber': pin,
      }),
    );

    if(response.statusCode ==200){
      print(json.decode(response.body));

      int pinNumber=json.decode(response.body)['pinNumber'];

      if(pinNumber == int.parse(pin)){
        return true;
      }else{
        return false;
      }

    }else{
      print("Error");
      return false;
    }
  }

  Future<bool> updatePassword(String password,String email,String pin) async {
    http.Response response = await http.put(
      Uri.parse('http://10.0.2.2:9092/updatepassword'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'pinNumber':pin,
        'email':email,
        'password': password,
      }),
    );

    if(response.statusCode ==200){
      print(json.decode(response.body));
      return true;
    }else{
      print("Error");
      return false;
    }
  }









}

