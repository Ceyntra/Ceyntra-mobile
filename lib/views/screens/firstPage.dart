import 'dart:io';

import 'package:ceyntra_mobile/views/screens/loginScreen.dart';
import 'package:flutter/material.dart';
class FirstPageScreen extends StatelessWidget{
void logIn() {}
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/main.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      child: Column(children: [
        Container(
          width: 130,
          height: 130,
          margin: EdgeInsets.only(top:80,left:190),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:Colors.black.withOpacity(0.5),
            // borderRadius: BorderRadius.all(
            //   Radius.circular(0)
            // ),
            // image: DecorationImage(
            //   image: AssetImage("assets/images/logo.png"),
            //   fit: BoxFit.contain,
            // ),
          ),
          child: Stack(
            children: [
              Container(
                width: 100,
                height: 100,
                margin: EdgeInsets.only(top:17,left:17),
                child: Image.asset("assets/images/logo.png"),
              )
            ],
          ),
        ),
        Container(
            margin: EdgeInsets.only(top: 370.0),
              child:SizedBox(
                width: 300.0,
                height: 40.0,
                child: ElevatedButton(
                  onPressed: logIn,
                  child: Text(
                    'Get Started',
                      style: TextStyle(fontSize: 17),
                  ),
                style: ElevatedButton.styleFrom(
                    primary: Color(0xff2d9cdb),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(15.0),
                    ),
                ),
                ),
                ),
              ),
              TextWidget(
                textstring: "Already have an account?", 
                paddingtext: EdgeInsets.only(top:20)
                ),
      ],),
      ),
    );
  }
}