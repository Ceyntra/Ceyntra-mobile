import 'dart:ui';

import 'package:ceyntra_mobile/service/HotelService.dart';
import 'package:ceyntra_mobile/service/PackageService.dart';
import 'package:ceyntra_mobile/service/RequestService.dart';
import 'package:ceyntra_mobile/views/screens/offersScreens/hotel/HotelOfferScreen.dart';
import 'package:ceyntra_mobile/views/screens/profileScreens/hotelProfile.dart';
import 'package:ceyntra_mobile/views/widgets/greenTagWidget.dart';
import 'package:ceyntra_mobile/views/widgets/homeIndicatorWidget.dart';
import 'package:ceyntra_mobile/views/widgets/homeOptionWidget.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../auth.dart';
import '../chatRoomScreen.dart';

class HotelHomeScreen extends StatefulWidget {
  const HotelHomeScreen({Key key, this.userID}) : super(key: key);

  @override
  _HotelHomeScreenState createState() => _HotelHomeScreenState();
  final int userID;

}

class _HotelHomeScreenState extends State<HotelHomeScreen> {
  Auth auth = new Auth();

  int packageCount=0;
  int newRequestCount=0;
  double rating=0.0;

  Function logIn(){}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadData();

  }

  loadData() async {
    PackageService packageService=new PackageService();
    int c=await packageService.getHotelPackageCount(widget.userID);
    int reqC= await RequestService.getRequestCount(widget.userID);
    double rate=await HotelService.getHotelRating(widget.userID);

    setState(() {
      packageCount=c;
      newRequestCount=reqC;
      rating=rate;
    });

     print("pkg Count: "+ packageCount.toString());
    print("pkg Count: "+ newRequestCount.toString());

  }

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
          ),
          IconButton(
            onPressed: () {
              auth.logout(context);
            },
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
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
                                  text: rating.toString(),
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
                            'RATING',
                            style: TextStyle(
                              color: Colors.white
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
                    child: Image.asset('assets/images/hotel.png'),
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
                  HomeOptionWidget(Colors.purple, '  Offers', Icons.local_offer,(){
                    Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => HotelOfferScreen()),
                    );
                  }),
                  new Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                  ),
                  HomeOptionWidget(Colors.green, '  Chat', Icons.chat, (){
                    Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => ChatRoomScreen(userType: 1,)),
                    );
                  }),
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
                  HomeOptionWidget(
                    Colors.blue,
                    '  Settings',
                    Icons.settings,
                    () {
                      print("object");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HotelProfileScreen()
                        )
                      );
                    },
                  ),
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
                  HomeIIndicatorWidget('$packageCount OFFERS',  packageCount == 0 ? 0.0 : packageCount/100 , 'TOTAL OFFERS',
                      Colors.grey, Colors.white),
                  HomeIIndicatorWidget('$newRequestCount NEW ', newRequestCount == 0 ? 0.0 : newRequestCount/100, 'NEW REQUEST',
                      Colors.grey, Colors.pink[100]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
