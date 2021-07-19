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
