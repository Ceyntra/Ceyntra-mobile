import 'package:ceyntra_mobile/service/GuideProfileService.dart';
import 'package:ceyntra_mobile/views/widgets/dividerWidget.dart';
import 'package:ceyntra_mobile/views/widgets/profileDetailsWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GuideProfileScreen extends StatefulWidget{
  @override
  _GuideProfileScreenState createState() => _GuideProfileScreenState();
}

class _GuideProfileScreenState extends State<GuideProfileScreen> {

  GuideProfileService guideProfileService=new GuideProfileService();
  int gUID=0;
  String gFName="";
  String gLName="";
  String gPhoto="";
  String gEmail="";
  String gTelephone="";
  String gNIC="";
  String description="";
  double gRating=0.0;
  int dayPrice=0;
  String gState="";

  void deleteAccount(){

  }

  void getGuideProfileData(response){
    setState(() {
      gFName=response.data["guide"]["first_name"];
      gLName=response.data["guide"]["last_name"];
      gPhoto=response.data["guide"]["profile_photo"];
      gEmail=response.data["contact"]["email"];
      gTelephone=response.data["contact"]["telephone"];
      gNIC=response.data["guide"]["nic"];
      description=response.data["guide"]["description"];
      gRating=response.data["guide"]["rating"];
      dayPrice=response.data["guide"]["per_day_price"];
      gState=response.data["guide"]["vehicle_state"];
    });
  }

  void initState() {
    super.initState();
    guideProfileService.getGuideUsertId().then((value) {
      setState(() {
        gUID = value;
      });
      guideProfileService.getGuideProfileDetails(getGuideProfileData, gUID);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff031925),
      appBar: AppBar(
        // elevation: 20,
        brightness: Brightness.dark,
        // leading: Icon(Icons.arrow_back),
        leading: InkWell(
          onTap: null,
          child: Icon(Icons.arrow_back),
        ),
        title: Center(
          child: Text(
            'Profile',
            style: GoogleFonts.montserrat(),
          ),
        ),
        actions: [
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.edit,
              color: Colors.white,
            ),
          )
        ],
        backgroundColor: Color(0xff031925),
      ),
      body: SingleChildScrollView(
        child:Column(
          children: [
            Center(
              child: Container(
                alignment: Alignment.bottomRight,
                margin: EdgeInsets.only(top: 20, bottom: 5),
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.brown,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/g5.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: Ink(
                    decoration: ShapeDecoration(
                      color: Colors.white.withOpacity(0.5),
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.camera_alt,
                        color: Colors.black,
                      ),
                      onPressed: null,
                    ),
                  ),
                ),
              ),
            ),
            
            Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Text(
                '$gFName $gLName',
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '$gRating ',
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    WidgetSpan(
                        child: Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 22
                        ),
                    ),
                  ],
                ),
              )
            ),
            ProfileDetailsWidget('NIC', '$gNIC'),
            DividerWidget(),
            ProfileDetailsWidget('Email', '$gEmail'),
            DividerWidget(),
            ProfileDetailsWidget('Phone', '$gTelephone'),
            DividerWidget(),
            ProfileDetailsWidget('Description', '$description'),
            DividerWidget(),
            ProfileDetailsWidget('Price (/day)', '$dayPrice'),
            DividerWidget(),
            ProfileDetailsWidget('Vehicle State', '$gState'),
            DividerWidget(),
            ProfileDetailsWidget('Account Type', 'Guide'),

            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              width: 300.0,
              height: 40.0,
              child: ElevatedButton(
                onPressed: deleteAccount,
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  onPrimary: Colors.white,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(15.0),
                  ),
                ),
                child: Text(
                  'Delete account',
                  style: GoogleFonts.montserrat(fontSize: 17),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
