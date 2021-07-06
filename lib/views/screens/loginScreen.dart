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