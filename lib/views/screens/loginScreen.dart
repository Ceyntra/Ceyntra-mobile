import 'package:ceyntra_mobile/views/screens/firstSignUpScreen.dart';
import 'package:ceyntra_mobile/views/screens/mainScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../auth.dart';

class LoginScreen extends StatefulWidget {
  // const LoginScreen({Key? key}) : super(key: key);
  final String isCreated;
  LoginScreen({this.isCreated});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Auth auth = new Auth();
  final formKey = GlobalKey<FormState>();

  bool userNotRegistered = false;
  bool wrongCredential = false;

  VoidCallback isUserNotRegistered() {
    setState(() {
      userNotRegistered = true;
    });
  }

  VoidCallback isCredentialWrong() {
    setState(() {
      userNotRegistered = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController emailTec = new TextEditingController();
    TextEditingController passwordTec = new TextEditingController();
    return Scaffold(
        backgroundColor: Color(0xff031925),
        body: SafeArea(
          child: ListView(
            physics: ClampingScrollPhysics(),
            children: [
              //1st Login
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(bottom: 40.0, top: 40.0),
                child: Text(
                  "Ceyntra Login",
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 26.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              widget.isCreated != null
                  ? Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(
                        bottom: 20.0,
                      ),
                      child: Text(
                        "Account created! please log in.",
                        style: GoogleFonts.montserrat(
                          color: Colors.green,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )
                  : Container(),
              //btn-bar
              Container(
                // color: Colors.amber,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //Facebook btn
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xFF0D47A1),
                          borderRadius: BorderRadius.circular(5)),
                      padding: EdgeInsets.all(8),
                      width: 115,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.facebook,
                            color: Colors.white,
                          ),
                          Text(
                            "Facebook",
                            style: GoogleFonts.montserrat(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xFF00acee),
                          borderRadius: BorderRadius.circular(5)),
                      padding: EdgeInsets.all(8),
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.twitter,
                            color: Colors.white,
                          ),
                          Text(
                            "Twitter",
                            style: GoogleFonts.montserrat(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color(0xFF4285F4),
                                  Color(0xFFDB4437),
                                  Color(0xFFF4B400),
                                  Color(0xFF0F9D58),
                                ]),
                            borderRadius: BorderRadius.circular(5)),
                        padding: EdgeInsets.all(8),
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.google,
                              color: Colors.white,
                            ),
                            Text(
                              "Google",
                              style: GoogleFonts.montserrat(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        auth
                            .signInWithGoogle(context, isUserNotRegistered)
                            .catchError(
                                (onError) => {print(onError.toString())});
                      },
                    ),
                  ],
                ),
              ),
              //login with email text
              Container(
                  alignment: Alignment.center,
                  // color: Colors.amber,
                  margin: EdgeInsets.only(
                    top: 30,
                    bottom: 10,
                  ),
                  child: Column(
                    children: [
                      userNotRegistered
                          ? Text(
                              "User has not registered",
                              style: GoogleFonts.montserrat(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.red),
                            )
                          : Text(""),
                      Text(
                        "or login with email",
                        style: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ],
                  )),

              Container(
                padding: EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 20.0, bottom: 10.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailTec,
                        validator: (val) {
                          return RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(val)
                              ? null
                              : "please enter the valid email";
                        },
                        decoration: const InputDecoration(
                          hintText: "Your email",
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
                        controller: passwordTec,
                        validator: (val) {
                          return val.length > 6
                              ? null
                              : "Please provide passowrd greater than 6";
                        },
                        decoration: const InputDecoration(
                          filled: true,
                          hintText: "password",
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
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 20.0, top: 5.0),
                child: Text(
                  "Forgot password?",
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 12.0),
                ),
              ),

              Container(
                margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
                height: 40.0,
                child: TextButton(
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => MainScreen()));
                      auth.login(emailTec.text, passwordTec.text, context,
                          isUserNotRegistered, isCredentialWrong);
                    }
                  },
                  child: Text(
                    "Login",
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                  style: ButtonStyle(
                      alignment: Alignment.center,
                      backgroundColor: MaterialStateProperty.all(
                        Color(0xFF0D47A1),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)))),
                ),
              ),

              // TextWidget(
              //     textstring: "Don't have an account?",
              //     paddingtext: EdgeInsets.only(top: 80.0)),

              Container(
                alignment: Alignment.center,
                // color: Colors.amber,
                margin: EdgeInsets.only(
                  top: 50,
                  bottom: 0,
                ),
                child: Text(
                  "Don't have an account?",
                  style: GoogleFonts.montserrat(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),

              Container(
                margin: EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15.0, bottom: 60),
                height: 40.0,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FirstSignUpScreen()));
                  },
                  child: Text(
                    "Sign up",
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                  style: ButtonStyle(
                      alignment: Alignment.center,
                      backgroundColor: MaterialStateProperty.all(
                        Color(0xFF0D47A1),
                      ),
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
    @required this.textstring,
    @required this.paddingtext,
  });

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
