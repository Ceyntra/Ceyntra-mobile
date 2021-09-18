import 'package:shared_preferences/shared_preferences.dart';

class UserService{

  //Get user ID
  Future<int> getUserID() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    //Get userID of the logged in user
    return preferences.get("userID");
  }


}