import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPassword extends StatefulWidget {
  //ForgetPassword({Key? key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
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
                  "Change Password",
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 26.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              //btn-bar

              //login with email text

              Container(
                padding: EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 40.0, bottom: 50.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "New Password",
                        filled: true,
                        contentPadding: EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 5.0, bottom: 10.0),
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(10.0))),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 25.0)),
                    TextFormField(
                      decoration: const InputDecoration(
                        filled: true,
                        hintText: "Cnnfirm Password",
                        contentPadding: EdgeInsets.all(15.0),
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(10.0))),
                      ),
                    )
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
                height: 60.0,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Change Passwords",
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
            ],
          ),
        ));
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({
    Key key,
    @required this.textstring,
    @required this.paddingtext,
  }) : super(key: key);

  final String textstring;
  final EdgeInsets paddingtext;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: paddingtext,
      child: Text(
        textstring,
        style: GoogleFonts.montserrat(
          color: Colors.white,
          fontWeight: FontWeight.w200,
          fontSize: 11.0,
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({Key key,
      @required this.title,
      @required this.icon,
      @required this.color,
      @required this.paddingbutton})
      : super(key: key);

  final String title;
  final FaIcon icon;
  final Color color;
  final EdgeInsets paddingbutton;

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 180.0,
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

