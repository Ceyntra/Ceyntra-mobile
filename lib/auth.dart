import 'dart:convert';
import 'package:ceyntra_mobile/views/screens/firstPage.dart';
import 'package:ceyntra_mobile/views/screens/loginScreen.dart';
import 'package:ceyntra_mobile/views/screens/mainScreen.dart';
import 'package:ceyntra_mobile/views/screens/spHomeScreens/guideHome.dart';
import 'package:ceyntra_mobile/views/screens/spHomeScreens/hotelHome.dart';
import 'package:ceyntra_mobile/views/screens/spHomeScreens/taxiHome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:flutter_twitter_login/flutter_twitter_login.dart';

class Auth {


  GoogleSignIn googleSignIn= GoogleSignIn();

  Future signInWithGoogle(BuildContext context,Function isUserNotRegistered) async {

    try {
      final GoogleSignInAccount googleUser = await googleSignIn.signIn();
      if (googleUser == null) return null;
      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);

      //Check user type & redirect to the relevant page
      User user = FirebaseAuth.instance.currentUser;

      var url = Uri.parse("http://10.0.2.2:9092/usertype");
      var response = await http.post(url, body: user.email);

      // print(jsonDecode(response.body));

      if (jsonDecode(response.body) != 404) {
        var userType = response.body;
        print(userType);
        setPreferences(context, int.parse(userType), user.email);
      } else {
        //User does not exists in system
        user.delete();

        await FirebaseAuth.instance.signOut();
        googleSignIn.disconnect();
        isUserNotRegistered();
        print("User 404");
      }
    }on FirebaseAuthException catch  (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
    }
  }


  Future setPreferences(BuildContext context, int userType,
      String email) async {
    //Login success add shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("email", email);
    await prefs.setInt("userType", userType); //User Type

    await prefs.setInt("isLoggedIn", 1);

// =======
//   final googleSignIn = GoogleSignIn();
//   Future signInWithGoogle(BuildContext context) async {
//     final GoogleSignInAccount googleUser = await googleSignIn.signIn();
//     if (googleUser == null) return null;
//     final GoogleSignInAuthentication googleAuth =
//         await googleUser.authentication;
//
//     final credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );
//
//     UserCredential userCredential =
//         await FirebaseAuth.instance.signInWithCredential(credential);
//
//     //Check user type & redirect to the relevant page
//     User user = FirebaseAuth.instance.currentUser;
//     print("ksjdf");
//     print(user.email);
//     var url = Uri.parse("http://10.0.2.2:9092/usertype");
//     var response = await http.post(url, body: user.email);
//     print(response.body);
//
//     // print(jsonDecode(response.body));
//
//     if (jsonDecode(response.body) != 404) {
//       var userType = response.body;
//       print(userType);
//       setPreferences(context, int.parse(userType), user.email);
//     } else {
//       //User does not exists in system
//       await FirebaseAuth.instance.signOut();
//       user.delete();
//       print("User 404");
//     }
//   }
//
//   Future setPreferences(
//       BuildContext context, int userType, String email) async {
//     //Login success add shared preferences
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString("email", email);
//     await prefs.setInt("userType", userType); //User Type
//
//     await prefs.setInt("isLoggedIn", 1);
//
// >>>>>>> 36a182fd0e8a830b8b4909f3b2648732a53a71ab
    if (prefs.getInt("isFirstTime") == null) {
      await prefs.setInt("isFirstTime", 1);
    }

    //Redirect Users to relevant pages
    switch (userType) {
      case 1:
        {
          print("Redirect to hotel page");
        }
        break;

      case 2:
        {
          print("Redirect to Taxi page");
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => TaxiHomeScreen()));
        }
        break;

      case 3:
        {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => GuideHomeScreen()));
        }
        break;

      case 4:
        {
          print("Redirect to Traveller page");
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MainScreen()));
        }
        break;

      default:
        {
          print("Stay here");
        }
        break;
    }
  }


  Future login(String email, String password, BuildContext context,
      Function isUserNotRegistered, Function isCredentialWrong) async {

    var url = Uri.parse("http://10.0.2.2:9092/userlogin");
    var response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: json.encode({'email': email, 'password': password}));
    var userData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      //User type
      var userType = userData["userType"];

      setPreferences(context, userType, userData["email"]);

    } else if (response.statusCode == 401) {
      //Credential not matching
      isCredentialWrong();
    } else {
      isUserNotRegistered();


      // //Login success add shared preferences
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // await prefs.setString("email", userData["email"]);
      // await prefs.setString("userType",userType); //User Type
      //
      // await prefs.setInt("isLoggedIn", 1);
      //
      // if(prefs.getInt("isFirstTime") ==null){
      //   await prefs.setInt("isFirstTime", 1);
      // }
      //
      //
      // //Redirect Users to relevant pages
      // switch(userType) {
      //   case 1: {print("Redirect to hotel page");}
      //   break;
      //
      //   case 2: {  print("Redirect to Taxi page"); }
      //   break;
      //
      //   case 3: {  print("Redirect to Guide page"); }
      //   break;
      //
      //   case 4: {
      //     print("Redirect to Traveller page");
      //     Navigator.push(context,MaterialPageRoute(builder: (context) => MainScreen()));
      //   }
      //   break;
      //
      //   default: { print("Stay here"); }
      //   break;
      // }

    }
  }

  Future logout(BuildContext context) async {
    if (FirebaseAuth.instance.currentUser != null) {
      print("Google logout!");
      await FirebaseAuth.instance.signOut();
      googleSignIn.disconnect();
    }

    SharedPreferences preferences = await SharedPreferences.getInstance();
    var url = Uri.parse("http://10.0.2.2:9092/userlogout");
    var response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: json
            .encode({'email': preferences.getString("email"), 'password': ""}));

    await preferences.remove('email');
    await preferences.remove('userType');
    await preferences.setInt("isLoggedIn", 0);

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  Future<Widget> userRedirect() async {
    //Check user isloggedIn or isFirstTime user login
    SharedPreferences preferences = await SharedPreferences.getInstance();

    // preferences.clear();

    var isFirstTime = await preferences.getInt("isFirstTime") == null
        ? 0
        : preferences.getInt("isFirstTime");
    var isLoggedIn = await preferences.getInt("isLoggedIn") == null
        ? 0
        : preferences.getInt("isLoggedIn");

    print('isFirst-' + isFirstTime.toString());
    print('isLogged-' + isLoggedIn.toString());

    if (isFirstTime == 0) {
      return FirstPageScreen();
    } else if (isLoggedIn == 0) {
      return LoginScreen();
    } else {
      //Check userType & redirect to relevant page
      var userType = preferences.getInt("userType");

      switch (userType) {
        case 1:
          {
            print("Redirect to hotel page");
          }
          break;

        case 2:
          {
            print("Redirect to Taxi page");
          }
          break;

        case 3:
          {
            print("Redirect to Guide page");
            return GuideHomeScreen();
          }
          break;

        case 4:
          {
            print("Redirect to Traveller page");
            return MainScreen();
          }
          break;

        default:
          {
            print("Stay here");
          }
          break;
      }
    }
  }
}
