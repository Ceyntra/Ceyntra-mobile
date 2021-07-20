import 'package:ceyntra_mobile/views/screens/loginScreen.dart';
import 'package:ceyntra_mobile/views/serviceProviderSignup.dart';
import 'package:ceyntra_mobile/views/widgets/signUpwidget.dart';
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
          SignUpWidget(
            title: "Travaller",
            description:
                "If you are a traveller who eger to travel around Sri Lanka. Please sign up to use our amazing support for you.",
            image: AssetImage('assets/images/signup1.png'),
            widget: LoginScreen(),
          ),
          SizedBox(
            height: 20,
          ),
          SignUpWidget(
            title: "Service Provider",
            description:
                "If you wish to join our service provider community to support travellers and earn profits. Join us.",
            image: AssetImage('assets/images/signup3.png'),
            widget: ServiceProviderSignUp(),
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
