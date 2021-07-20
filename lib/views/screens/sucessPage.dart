import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class SucessPageScreen extends  StatelessWidget{
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
            height: 180,
            width: 180,
            // color:Colors.red,
            margin: EdgeInsets.only(top:120,),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/right.png"),
                fit: BoxFit.contain,
              )
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top:30),
            child:Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [Text(
              'Account Created!',
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
              "Your account has been created successfully.\nPress continue to start using app.",
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                color:Colors.grey,
                fontSize:16,
                
            )
          ),
          ),
          Container(
            margin: EdgeInsets.only(top: 130.0),
              child:SizedBox(
                width: 300.0,
                height: 40.0,
                child: ElevatedButton(
                  onPressed: logIn,
                  child: Text(
                    'Continue',
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
                alignment: Alignment.center,
                margin: EdgeInsets.only(top:20),
                padding: EdgeInsets.only(right:20,left:20),
                child: Text(
                    "By clicking start, you agree to our Privacy Policy\nour terms and coditions.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                    color:Colors.white,
                    fontSize:14,
                  )
                ),
              ), 
        ],
      ),
    );
  }
}