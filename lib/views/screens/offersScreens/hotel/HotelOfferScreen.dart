import 'package:ceyntra_mobile/service/PackageService.dart';
import 'package:ceyntra_mobile/service/UserService.dart';
import 'package:ceyntra_mobile/views/screens/offersScreens/hotel/AddHotelOffers.dart';
import 'package:ceyntra_mobile/views/screens/offersScreens/hotel/HotelPackages.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class HotelOfferScreen extends StatefulWidget {

  HotelOfferScreen();

  @override
  _HotelOfferScreenState createState() => _HotelOfferScreenState();
}

class _HotelOfferScreenState extends State<HotelOfferScreen> {

  int userID;

  Future<void> loaduserID() async {

    UserService userService=new UserService();
    int id= await userService.getUserID();
    setState(() {
      userID=id;
    });

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loaduserID();
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
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: TabBarView(
          children: [
            HotelPackageScreen(),

            AddHotelOfferScreen(userId: userID),

          ],
        ),
      ),
    );
  }
}
