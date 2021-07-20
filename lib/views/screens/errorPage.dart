import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class ErrorPageScreen extends StatelessWidget {
  void logIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2F3546),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            height: 200,
            width: 200,
            // color:Colors.red,
            margin: EdgeInsets.only(top:180,),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/error.png"),
                fit: BoxFit.contain,
              )
            ),
          ),
          Container(
            alignment: Alignment.center,
            child:Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [Text(
              'Ooops....',
              style: GoogleFonts.montserrat(
                color:Colors.white,
                fontWeight: FontWeight.bold,
                fontSize:30,
              )
            )
              ],
            ) 
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top:10),
            child: Text(
              "Something went wrong. We're doing\neverything to fix it and should be  up\nand running soon.",
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                color:Colors.grey,
                fontSize:16,
                
            )
          ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30.0),
              child:SizedBox(
                width: 300.0,
                height: 40.0,
                child: ElevatedButton(
                  onPressed: logIn,
                  child: Text(
                    'Try again',
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
            Container(
            margin: EdgeInsets.only(top: 15.0),
              child:SizedBox(
                width: 300.0,
                height: 40.0,
                child: ElevatedButton(
                  onPressed: logIn,
                  child: Text(
                    'Back',
                      style: TextStyle(fontSize: 17,color: Colors.black),
                  ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(15.0),
                    ),
                ),
                ),
                ),
              ),  
        ],
      ),
    );
  }
}