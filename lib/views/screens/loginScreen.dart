import 'package:ceyntra_mobile/auth.dart';
import 'package:ceyntra_mobile/views/screens/mainScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';


class LoginScreen extends StatefulWidget {
  // const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  var email='';
  var password='';

  @override
  Widget build(BuildContext context) {
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
                          width: 115,
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
                            width: 115,
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
                          onTap: (){
                              Auth().signInWithGoogle(context).catchError((onError)=>{
                                print(onError.toString())
                              });
                          },
                        ),

                        // Container(
                        //   width: 150,
                        //   child: LoginButton(
                        //     title: "Facebook",
                        //     icon: FaIcon(
                        //       FontAwesomeIcons.facebook,
                        //       color: Colors.white,
                        //     ),
                        //     color: Color(0xFF0D47A1),
                        //     paddingbutton: EdgeInsets.only(left: 15.0, right: 5.0),
                        //     //color: Colors.blue[900],
                        //   ),
                        // ),

                        // //twitter btn
                        // Container(
                        //   width: 150,
                        //   child: LoginButton(
                        //     title: "Twitter",
                        //     icon: FaIcon(
                        //       FontAwesomeIcons.twitter,
                        //       color: Colors.white,
                        //     ),
                        //     color: Color(0xFF81D4FA),
                        //     paddingbutton: EdgeInsets.only(left: 5.0, right: 15.0),
                        //     //color: Colors.lightBlue,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  //login with email text
                  Container(
                    alignment: Alignment.center,
                    // color: Colors.amber,
                    margin: EdgeInsets.only(
                      top: 50,
                      bottom: 20,
                    ),
                    child: Text(
                      "or login with email",
                      style: GoogleFonts.montserrat(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
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
                            contentPadding: EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 5.0, bottom: 10.0),
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(10.0))),
                          ),
                          onChanged: (e)=>{
                            setState(() {
                               email=e;
                            })
                          },
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 15.0)),
                        TextFormField(
                          obscureText:true,
                          decoration: const InputDecoration(
                            filled: true,
                            hintText: "password",
                            contentPadding: EdgeInsets.all(15.0),
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(10.0))),
                          ),
                          onChanged: (e)=>{
                            setState(() {
                              password=e;
                            })


                          },
                        )
                      ],
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
                    padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
                    height: 60.0,
                    child: TextButton(
                      onPressed: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => MainScreen()));
                        print(email+'-'+password);
                        login(email,password,context);

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
                    padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
                    height: 60.0,
                    child: TextButton(
                      onPressed: () {},
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
              )


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
