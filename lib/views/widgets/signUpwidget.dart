import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpWidget extends StatelessWidget {
  final String title;
  final AssetImage image;
  final String description;
  final Widget widget;
  const SignUpWidget({this.title, this.image, this.description, this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(color: Colors.grey.withOpacity(0.6), width: 1)),
      ),
      margin: EdgeInsets.only(top: 10, left: 15, right: 15),
      child: Column(
        children: [
          Container(
              // color: Colors.amber,
              width: MediaQuery.of(context).size.width,
              child: Text(
                title,
                style: GoogleFonts.montserrat(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              )),
          Container(height: 140, child: Image(image: image)),
          Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                description,
                style: GoogleFonts.montserrat(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              )),
          Container(
            margin: EdgeInsets.only(top: 10),
            alignment: Alignment.centerRight,
            width: MediaQuery.of(context).size.width,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => widget));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(5)),
                alignment: Alignment.center,
                width: 120,
                height: 40,
                child: Text(
                  "Continue",
                  style: GoogleFonts.montserrat(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
