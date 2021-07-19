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
      backgroundColor: Color(0xff031925),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //get help quote
            Container(
              margin: EdgeInsets.only(top: 50, right: 60, left: 60, bottom: 0),
              child: Text(
                "Get help for your next trip around Sri Lanka",
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 30.0),
                textAlign: TextAlign.center,
              ),
            ),
            // Container(
            //   alignment: Alignment.center,
            //   child: Text(
            //     "next trip around",
            //     style: GoogleFonts.montserrat(
            //         color: Colors.white,
            //         fontWeight: FontWeight.w700,
            //         fontSize: 24.0),
            //   ),
            // ),
            // Container(
            //   padding: EdgeInsets.only(bottom: 30.0),
            //   alignment: Alignment.center,
            //   child: Text(
            //     "Sri Lanka",
            //     style: GoogleFonts.montserrat(
            //         color: Colors.white,
            //         fontWeight: FontWeight.w700,
            //         fontSize: 24.0),
            //   ),
            // ),
            Container(
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image(
                          image: AssetImage('assets/images/image1.jpeg'),
                          height: 260.0,
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image(
                          image: AssetImage('assets/images/image6.jpeg'),
                          height: 260.0,
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image(
                          image: AssetImage('assets/images/image3.jpeg'),
                          height: 260.0,
                        ),
                      )),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
              child: Text(
                "We're happy to share our registered partners (Guides, Hotels, Taxis) near destinations where you can relax",
                style:
                    GoogleFonts.montserrat(color: Colors.white, fontSize: 15),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              // color: Colors.amber,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Back",
                              style: GoogleFonts.montserrat(
                                  fontSize: 16, color: Colors.white))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text("Next",
                            style: GoogleFonts.montserrat(
                                fontSize: 16, color: Colors.white)),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
