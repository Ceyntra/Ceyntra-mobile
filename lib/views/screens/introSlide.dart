import 'package:ceyntra_mobile/views/screens/getHelpScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shape_of_view/shape_of_view.dart';

class IntroSlideScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff031925),
      body: new Column(
        // margin: EdgeInsets.all(50),
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          new Container(
            margin: EdgeInsets.only(top: 50, right: 50, left: 50, bottom: 30),
            child: Text(
              'Find best places to visit in Sri Lanka',
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          new Container(
            child: new Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ShapeOfView(
                      height: 100.0,
                      width: 100.0,
                      shape: PolygonShape(numberOfSides: 4),
                      child: Image(
                        image: AssetImage('assets/images/s1.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    ShapeOfView(
                      height: 100.0,
                      width: 100.0,
                      shape: PolygonShape(numberOfSides: 4),
                      child: Image(
                        image: AssetImage('assets/images/s2.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    ShapeOfView(
                      height: 100.0,
                      width: 100.0,
                      shape: PolygonShape(numberOfSides: 4),
                      child: Image(
                        image: AssetImage('assets/images/s3.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                new Positioned(
                  top: 60.0,
                  child: new Row(
                    children: [
                      ShapeOfView(
                        height: 100.0,
                        width: 100.0,
                        shape: PolygonShape(numberOfSides: 4),
                        child: Image(
                          image: AssetImage('assets/images/s4.jpeg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      ShapeOfView(
                        height: 100.0,
                        width: 100.0,
                        shape: PolygonShape(numberOfSides: 4),
                        child: Image(
                          image: AssetImage('assets/images/s5.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      ShapeOfView(
                        height: 100.0,
                        width: 100.0,
                        shape: PolygonShape(numberOfSides: 4),
                        child: Image(
                          image: AssetImage('assets/images/s6.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      ShapeOfView(
                        height: 100.0,
                        width: 100.0,
                        shape: PolygonShape(numberOfSides: 4),
                        child: Image(
                          image: AssetImage('assets/images/s7.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          new Container(
            margin: EdgeInsets.only(top: 100.0, left: 20.0, right: 20.0),
            child: Text(
              'We\'re happy to share our best tips for destinations where you can relax. But you find the nicest city tips as well!',
              style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            // color: Colors.amber,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Back",
                            style: GoogleFonts.montserrat(
                                fontSize: 16, color: Colors.white))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GetHelpScreen()));
                  },
                  child: Container(
                    child: Row(
                      children: [
                        Text("Next",
                            style: GoogleFonts.montserrat(
                                fontSize: 16, color: Colors.white)),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
