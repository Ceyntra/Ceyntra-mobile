import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class TravellerSignUp extends StatefulWidget {
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
                        border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(10.0))),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 15.0)),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Last Name",
                        filled: true,
                        contentPadding: EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 5.0, bottom: 10.0),
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(10.0))),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 15.0)),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "NIC / Passport",
                        filled: true,
                        contentPadding: EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 5.0, bottom: 10.0),
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(10.0))),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 15.0)),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Email",
                        filled: true,
                        contentPadding: EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 5.0, bottom: 10.0),
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(10.0))),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 15.0)),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Contact Number",
                        filled: true,
                        contentPadding: EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 5.0, bottom: 10.0),
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(10.0))),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 15.0)),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Password",
                        filled: true,
                        contentPadding: EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 5.0, bottom: 10.0),
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(10.0))),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 15.0)),
                  ],
                )),
            Container(
              padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
              height: 60.0,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                style: ButtonStyle(
                    alignment: Alignment.center,
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFF64B5F6)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)))),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Row(
                children: [
                  TextWidget(
                    textstring: "Already have an account?",
                    paddingtext: EdgeInsets.only(top: 30.0, bottom: 25.0),
                    fntcolor: Colors.white,
                    fntweight: FontWeight.w500,
                  ),
                  TextWidget(
                    textstring: "  Log in",
                    paddingtext: EdgeInsets.only(top: 30.0, bottom: 25.0),
                    fntcolor: Colors.blue,
                    fntweight: FontWeight.w500,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton(
      {@required this.title,
      @required this.icon,
      @required this.color,
      @required this.paddingbutton});

  final String title;
  final FaIcon icon;
  final Color color;
  final EdgeInsets paddingbutton;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 180.0,
      height: 40.0,
      padding: paddingbutton,
      //padding: EdgeInsets.only(left: 5.0, right: 5.0),
      child: TextButton(
        onPressed: () {
          print("clicked ${title}");
        },
        child: Row(
          children: [
            icon,
            Padding(padding: EdgeInsets.only(left: 5.0, right: 20.0)),
            Text(
              title,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ],
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(color),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)))),
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({
    @required this.textstring,
    @required this.paddingtext,
    @required this.fntcolor,
    @required this.fntweight,
  });

  final String textstring;
  final EdgeInsets paddingtext;
  final Color fntcolor;
  final FontWeight fntweight;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: paddingtext,
      child: Text(
        textstring,
        style: GoogleFonts.montserrat(
          color: fntcolor,
          fontWeight: fntweight,
          fontSize: 11.0,
        ),
      ),
    );
  }
}
