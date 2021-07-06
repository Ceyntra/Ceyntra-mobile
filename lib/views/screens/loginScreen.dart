import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  // const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff2F3546),
		 body: SafeArea(
          child: ListView(
            physics: ClampingScrollPhysics(),
            children: [
			//1st Login
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(bottom: 25.0, top: 40.0),
                child: Text(
                  "Login",
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 26.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
			  //btn-bar
              Row(
                children: [
                  //Facebook btn
                  LoginButton(
                    title: "Facebook",
                    icon: FaIcon(
                      FontAwesomeIcons.facebook,
                      color: Colors.white,
					  ),
                    color: Color(0xFF0D47A1),
                    paddingbutton: EdgeInsets.only(left: 15.0, right: 5.0),
                    //color: Colors.blue[900],
                  ),

                  //twitter btn
                  LoginButton(
                    title: "Twitter",
                    icon: FaIcon(
                      FontAwesomeIcons.twitter,
                      color: Colors.white,
                    ),
                    color: Color(0xFF81D4FA),
                    paddingbutton: EdgeInsets.only(left: 5.0, right: 15.0),
                    //color: Colors.lightBlue,
                  ),
                ],
              ),
			  //login with email text
              TextWidget(
                textstring: "or login with email",
                paddingtext: EdgeInsets.only(top: 40.0),
              ),

              Container(
                padding: EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 20.0, bottom: 10.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Your email",
                        filled: true,