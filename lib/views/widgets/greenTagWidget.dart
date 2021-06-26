import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GreenTagWidget extends StatelessWidget {
  // const GreenTagWidget({ Key? key }) : super(key: key);
  final String title;
  GreenTagWidget({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Text(
          title,
          style: GoogleFonts.montserrat(fontSize: 15, color: Colors.white),
        ),
        decoration: BoxDecoration(
            color: Colors.green[800],
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20))),
      ),
    );
  }
}
