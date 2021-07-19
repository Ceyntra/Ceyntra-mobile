import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GetHelpScreen extends StatefulWidget {
  //const GetHelpScreen({ Key? key }) : super(key: key);

  @override
  _GetHelpScreenState createState() => _GetHelpScreenState();
}

class _GetHelpScreenState extends State<GetHelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2F3546),
      body: SafeArea(
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            //get help quote
            Container(
              padding: EdgeInsets.only(top: 40.0),
              alignment: Alignment.center,
              child: Text(
                "Get help for your",
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 24.0),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "next trip around",
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 24.0),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 30.0),
              alignment: Alignment.center,
              child: Text(
                "Sri Lanka",
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 24.0),
              ),
            ),
            Container(
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image(
                          image: AssetImage('assets/images/image1.jpg'),
                          height: 260.0,
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image(
                          image: AssetImage('assets/images/image6.jpg'),
                          height: 260.0,
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image(
                          image: AssetImage('assets/images/image3.jpg'),
                          height: 260.0,
                        ),
                      )),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.only(top: 30.0),
              alignment: Alignment.center,
              child: Text(
                "We're happy to share our registered",
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontWeight: FontWeight.w200,
                    fontSize: 12),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 2.0, bottom: 2.0),
              alignment: Alignment.center,
              child: Text(
                "partners (Guides, Hotels, Taxis) near",
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontWeight: FontWeight.w200,
                    fontSize: 12),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "destinations where you can relax",
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontWeight: FontWeight.w200,
                    fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

