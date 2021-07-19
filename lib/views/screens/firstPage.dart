import 'package:ceyntra_mobile/views/screens/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstPageScreen extends StatelessWidget {
  void logIn() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/start3.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.1)
                  ])),
            ),
            // Positioned(
            //   top: 30,
            //   child: Container(
            //     width: MediaQuery.of(context).size.width,
            //     // color: Colors.amber,
            //     child: Container(
            //       width: 160,
            //       height: 160,
            //       alignment: Alignment.center,
            //       // margin: EdgeInsets.only(top: 80, left: 190),
            //       decoration: BoxDecoration(
            //         shape: BoxShape.circle,
            //         color: Colors.black.withOpacity(0.4),
            //       ),
            //       child: Stack(
            //         children: [
            //           Container(
            //             width: 100,
            //             height: 100,
            //             child: Image.asset("assets/images/logo.png"),
            //           )
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            Positioned(
                top: 60,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  // color: Colors.amber,
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        child: Text(
                          "Welcome to",
                          style: GoogleFonts.montserrat(
                              fontSize: 50,
                              color: Colors.white.withOpacity(0.6),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 0),
                        child: Text(
                          "Ceyntra",
                          style: GoogleFonts.montserrat(
                              fontSize: 50,
                              color: Colors.white.withOpacity(0.6),
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                )),
            Positioned(
              bottom: 110,
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: SizedBox(
                  width: 300.0,
                  height: 40.0,
                  child: ElevatedButton(
                    onPressed: logIn,
                    child: Text('Get Started',
                        style: GoogleFonts.montserrat(fontSize: 17)),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff2d9cdb),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 70,
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                child: Text('Already have an account?',
                    style: GoogleFonts.montserrat(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w400)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
