import 'dart:io';
import 'package:ceyntra_mobile/service/UserService.dart';
import 'package:ceyntra_mobile/views/screens/offersScreens/guide/AddGuidePackageScreen.dart';
import 'package:ceyntra_mobile/views/screens/offersScreens/guide/GuidePackageScreen.dart';
import 'package:ceyntra_mobile/views/screens/offersScreens/taxi/AddTaxiOfferScreen.dart';
import 'package:ceyntra_mobile/views/screens/spHomeScreens/guideHome.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class GuideOfferScreen extends StatefulWidget {

  GuideOfferScreen();

  @override
  _TaxiOfferScreenState createState() => _TaxiOfferScreenState();
}

class _TaxiOfferScreenState extends State<GuideOfferScreen> {

  int userID;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadUserID();
  }

  loadUserID() async{
    UserService userService=new UserService();
    int id= await userService.getUserID();
    setState(() {
      userID=id;
    });
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0xff192537),
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                child: Container(
                  child: Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text("Current Offers")),
                      SizedBox(width: 10,),
                      Icon(Icons.local_atm_outlined),
                    ],
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text("Add New Offers")),
                      SizedBox(width: 10,),
                      Icon(Icons.library_add_outlined),
                    ],
                  ),
                ),
              ),
            ],
          ),
          title: Text(
            "Offers",
            style: GoogleFonts.montserrat(fontSize: 18),
          ),
          backgroundColor: Color(0xff192537),
          leading: InkWell(
            onTap: (){
              Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GuideHomeScreen(userID: userID,)
              ));
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: TabBarView(
          children: [
            GuidePackageScreen(),

            AddGuideScreen(userId: userID,),
          ],
        ),
      ),
    );
  }
}
