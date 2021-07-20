import 'dart:ui';

import 'package:ceyntra_mobile/views/widgets/greenTagWidget.dart';
import 'package:ceyntra_mobile/views/widgets/homeIndicatorWidget.dart';
import 'package:ceyntra_mobile/views/widgets/homeOptionWidget.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class TaxiHomeScreen extends StatelessWidget {
  Function logIn(){}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff031925),
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Color(0xff031925),
        leading: InkWell(
          onTap: null,
          child: Icon(Icons.home),
        ),
        title: Text('Home'),
        actions: [
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child:Row(
                children: [
                  Expanded(
                    child: CircularPercentIndicator(
                      radius: 120.0,
                      lineWidth: 5.0,
                      animation: true,
                      percent: 0.7,
                      center: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '648',
                                  style: TextStyle(
                                    color: Colors.amber,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                WidgetSpan(
                                  child: Icon(
                                    Icons.star,
                                    size: 20,
                                    color: Colors.amber,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            'REACH',
                            style: TextStyle(
                              color: Colors.white
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Icon(
                                    Icons.arrow_upward,
                                    size: 17,
                                    color: Colors.green,
                                  ),
                                ),
                                TextSpan(
                                  text: '8.1%',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: Colors.green,
                    ),
                    flex: 1,
                  ),

                  Expanded(
                    child: Image.asset('assets/images/taxi.png'),
                    flex: 1,
                  ),
                ],
              ),
            ),

            Divider(
              color: Colors.white.withOpacity(0.5),
              thickness: 1,
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: [
                  HomeOptionWidget(Colors.purple, '  Offers', Icons.local_offer, logIn),
                  new Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                  ),
                  HomeOptionWidget(Colors.green, '  Chat', Icons.chat, logIn),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: [
                  HomeOptionWidget(Colors.red, '  Complaints', Icons.warning, logIn),
                  new Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                  ),
                  HomeOptionWidget(Colors.blue, '  Settings', Icons.settings, logIn),
                ],
              ),
            ),

            GreenTagWidget(
              title: 'Successed Offers',
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child:Row(
                children: [
                  HomeIIndicatorWidget('54 OFFERS', 0.54, 'LAST MONTH', Colors.grey, Colors.white),
                  HomeIIndicatorWidget('67 OFFERS', 0.67, 'THIS MONTH', Colors.grey, Colors.pink[100]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
