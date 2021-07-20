import 'dart:convert';


import 'package:ceyntra_mobile/views/screens/mainScreen.dart';
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


  Future signInWithGoogle() async {
      final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return null;
      final GoogleSignInAuthentication googleAuth = await googleUser
          .authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(credential);
    }
  }

  Future login(String email, String password, BuildContext context) async{

    var url = Uri.parse("http://10.0.2.2:9092/userlogin");
    var response = await http.post(url,headers: {"Content-Type": "application/json"}, body: json.encode({'email': email, 'password': password}));
    var userData= jsonDecode(response.body);

    if(response.statusCode == 200){
      //User type
      var userType= userData["userType"];

      //Login success add shared preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("email", userData["email"]);
      await prefs.setString("password", userData["hashedPassword"]); //Hashed

      //Redirect Users to relevant pages
      switch(userType) {
        case 1: {print("Redirect to hotel page");}
        break;

        case 2: {  print("Redirect to Taxi page"); }
        break;

        case 3: {  print("Redirect to Guide page"); }
        break;

        case 4: {
          print("Redirect to Traveller page");
          Navigator.push(context,MaterialPageRoute(builder: (context) => MainScreen()));
        }
        break;

        default: { print("Stay here"); }
        break;
      }

    }
  }



  // Future<UserCredential> signInWithFacebook() async {
  //
  //   final AccessToken result = (await FacebookAuth.instance.login()) as AccessToken;
  //   final facebookAuthCredential = FacebookAuthProvider.credential(result.token);
  //
  //   return await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  // }
  //
  //
  //
  // Future<UserCredential> signInWithTwitter() async {
  //   final TwitterLogin twitterLogin = new TwitterLogin(
  //     consumerKey: '<your consumer key>',
  //     consumerSecret:' <your consumer secret>',
  //   );
  //
  //
  //   final TwitterLoginResult loginResult = await twitterLogin.authorize();
  //
  //   final TwitterSession twitterSession = loginResult.session;
  //
  //   final twitterAuthCredential = TwitterAuthProvider.credential(
  //     accessToken: twitterSession.token,
  //     secret: twitterSession.secret,
  //   );
  //
  //   // Once signed in, return the UserCredential
  //   return await FirebaseAuth.instance.signInWithCredential(twitterAuthCredential);
  // }



