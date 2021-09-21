import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ComplainWidget extends StatelessWidget {
  String complain;
  ComplainWidget({this.complain});
  // const ComplainWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: double.infinity,
      //color: Colors.red,
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.black38,
      ),

      child: Stack(
        children: [
          Container(
            height: 70,
            width: double.infinity,
            //color: Colors.black,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.black38,
            ),
          ),
          Container(
            child: Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      //color: Colors.blue,
                      image: DecorationImage(
                        image: AssetImage("assets/images/aaaa.png"),
                        fit: BoxFit.cover,
                      )),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    'You have a Complaint Warning\n@admin',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 75, left: 10, right: 10),
            child: Text(
              'Complaint we have received',
              style: GoogleFonts.montserrat(
                color: Colors.white,
                height: 1.5,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 105, left: 10, right: 10),
            child: Text(
              complain,
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 14,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
