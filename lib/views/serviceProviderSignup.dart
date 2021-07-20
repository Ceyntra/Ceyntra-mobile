import 'package:ceyntra_mobile/views/screens/loginScreen.dart';
import 'package:ceyntra_mobile/views/widgets/signUpwidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceProviderSignUp extends StatelessWidget {
  // const ServiceProviderSignUp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff031925),
      appBar: AppBar(
        backgroundColor: Color(0xff031925),
        title: Text(
          "Service Provider Sign Up",
          style: GoogleFonts.montserrat(),
        ),
      ),
      body: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          SignUpWidget(
            title: "Hotel",
            description:
                "If you are a traveller who eger to travel around Sri Lanka. Please sign up to use our amazing support for you.",
            image: AssetImage('assets/images/signup1.png'),
            widget: LoginScreen(),
          ),
          SizedBox(
            height: 20,
          ),
          SignUpWidget(
            title: "Taxi",
            description:
                "If you wish to join our service provider community to support travellers and earn profits. Join us.",
            image: AssetImage('assets/images/signup3.png'),
            widget: LoginScreen(),
          ),
          SizedBox(
            height: 20,
          ),
          SignUpWidget(
            title: "Guide",
            description:
                "If you are a traveller who eger to travel around Sri Lanka. Please sign up to use our amazing support for you.",
            image: AssetImage('assets/images/signup1.png'),
            widget: LoginScreen(),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
