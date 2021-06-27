import 'package:flutter/material.dart';
import 'package:shape_of_view/shape_of_view.dart';

class IntroSlideScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff031925),
      body: new Column(
        // margin: EdgeInsets.all(50),
        children: [
          new Container(
            margin: EdgeInsets.all(50),
            child: Text(
              'Find best places to visit in Sri Lanka',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          new Container(
            child:new Stack(
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
            margin: EdgeInsets.only(top: 120.0, left: 40.0, right: 40.0),
            child: Text(
              'We\'re happy to share our best tips for destinations where you can relax. But you find the nicest city tips as well!',
              style: TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

