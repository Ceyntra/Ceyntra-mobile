import 'package:ceyntra_mobile/views/screens/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstSignUpScreen extends StatefulWidget {
  // const FirstSignUpScreen({ Key? key }) : super(key: key);

  @override
  _FirstSignUpScreenState createState() => _FirstSignUpScreenState();
}

class _FirstSignUpScreenState extends State<FirstSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff031925),
      appBar: AppBar(
        backgroundColor: Color(0xff031925),
        title: Text(
          "Ceyntra Sign Up",
          style: GoogleFonts.montserrat(),
        ),
      ),
      body: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 30),
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: Colors.grey.withOpacity(0.6), width: 1)),
            ),
            margin: EdgeInsets.only(top: 10, left: 15, right: 15),
            child: Column(
              children: [
                Container(
                    // color: Colors.amber,
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "Travaller",
                      style: GoogleFonts.montserrat(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    )),
                Container(
                    height: 140,
                    child:
                        Image(image: AssetImage("assets/images/signup1.png"))),
                Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      "If you are a traveller who eger to travel around Sri Lanka. Please sign up to use our amazing support for you.",
                      style: GoogleFonts.montserrat(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    )),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  alignment: Alignment.centerRight,
                  width: MediaQuery.of(context).size.width,
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
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // Container(
          //   padding: EdgeInsets.only(bottom: 30),
          //   decoration: BoxDecoration(
          //     border: Border(
          //         bottom: BorderSide(
          //             color: Colors.grey.withOpacity(0.6), width: 1)),
          //   ),
          //   margin: EdgeInsets.only(top: 10, left: 15, right: 15),
          //   child: Column(
          //     children: [
          //       Container(
          //           // color: Colors.amber,
          //           width: MediaQuery.of(context).size.width,
          //           child: Text(
          //             "Sevice Provider",
          //             style: GoogleFonts.montserrat(
          //                 fontSize: 25,
          //                 fontWeight: FontWeight.w500,
          //                 color: Colors.white),
          //           )),
          //       Container(
          //           height: 140,
          //           child:
          //               Image(image: AssetImage("assets/images/signup3.png"))),
          //       Container(
          //           margin: EdgeInsets.only(top: 10),
          //           child: Text(
          //             "If you wish to join our service provider community to support travellers and earn profits. Join us.",
          //             style: GoogleFonts.montserrat(
          //                 fontSize: 15,
          //                 fontWeight: FontWeight.w400,
          //                 color: Colors.white),
          //           )),
          //       Container(
          //         margin: EdgeInsets.only(top: 10),
          //         alignment: Alignment.centerRight,
          //         width: MediaQuery.of(context).size.width,
          //         child: Container(
          //           decoration: BoxDecoration(
          //               color: Colors.blueAccent,
          //               borderRadius: BorderRadius.circular(5)),
          //           alignment: Alignment.center,
          //           width: 120,
          //           height: 40,
          //           child: Text(
          //             "Continue",
          //             style: GoogleFonts.montserrat(
          //                 fontSize: 15,
          //                 color: Colors.white,
          //                 fontWeight: FontWeight.w400),
          //           ),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          SignUpWidget(
            title: "Service Provider",
            description: "skdjfh",
            image: AssetImage('assets/images/signup3.png'),
            widget: LoginScreen(),
          ),
          Container(
            margin: EdgeInsets.only(top: 30, bottom: 30),
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?',
                      style: GoogleFonts.montserrat(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w400)),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    child: Text('Log in',
                        style: GoogleFonts.montserrat(
                            fontSize: 15,
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.w400)),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

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
