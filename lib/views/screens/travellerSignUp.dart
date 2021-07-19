import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class TravellerSignUp extends StatefulWidget {
  const TravellerSignUp({Key? key}) : super(key: key);

  @override
  _TravellerSignUpState createState() => _TravellerSignUpState();
}

class _TravellerSignUpState extends State<TravellerSignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2F3546),
      body: SafeArea(
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            Row(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 15.0, bottom: 30.0, top: 15.0),
                  child: Text(
                    "< Traveller Sign up",
                    style: GoogleFonts.montserrat(
                        color: Colors.white, fontSize: 20.0),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                //Facebook btn
                Expanded(
                  flex: 1,
                  child: LoginButton(
                    title: "Facebook",
                    icon: FaIcon(
                      FontAwesomeIcons.facebook,
                      color: Colors.white,
                    ),
                    color: Color(0xFF0D47A1),
                    paddingbutton: EdgeInsets.only(left: 15.0, right: 5.0),
                    //color: Colors.blue[900],
                  ),
                ),

                //twitter btn
                Expanded(
                  flex: 1,
                  child: LoginButton(
                    title: "Twitter",
                    icon: FaIcon(
                      FontAwesomeIcons.twitter,
                      color: Colors.white,
                    ),
                    color: Color(0xFF81D4FA),
                    paddingbutton: EdgeInsets.only(left: 5.0, right: 15.0),
                    //color: Colors.lightBlue,
                  ),
                ),
              ],
            ),
            TextWidget(
              textstring: "or sign up with email",
              paddingtext: EdgeInsets.only(top: 40.0),
              fntcolor: Colors.white,
              fntweight: FontWeight.w300,
            ),
            Container(
                padding: EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 20.0, bottom: 10.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "First Name",
                        filled: true,
                        contentPadding: EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 5.0, bottom: 10.0),
                        fillColor: Colors.white,