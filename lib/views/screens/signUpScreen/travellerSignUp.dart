import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class TravellerSignUp extends StatefulWidget {
  @override
  _TravellerSignUpState createState() => _TravellerSignUpState();
}

class _TravellerSignUpState extends State<TravellerSignUp> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final googleSingIn = GoogleSignIn();
  Future signUp() async {
    await googleSingIn.signIn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff031925),
      appBar: AppBar(
        backgroundColor: Color(0xff031925),
        title: Text(
          "Travaller Sign Up",
          style: GoogleFonts.montserrat(),
        ),
      ),
      body: SafeArea(
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            SizedBox(
              height: 20,
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
                    function: () {
                      signUp();
                    },
                    title: "Google",

                    icon: FaIcon(
                      FontAwesomeIcons.google,
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
                    left: 25.0, right: 25.0, top: 20.0, bottom: 10.0),
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
                                const Radius.circular(5.0))),
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
                                const Radius.circular(5.0))),
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
                                const Radius.circular(5.0))),
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
                                const Radius.circular(5.0))),
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
                                const Radius.circular(5.0))),
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
                                const Radius.circular(5.0))),
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
  const LoginButton({
    @required this.title,
    @required this.icon,
    @required this.color,
    @required this.paddingbutton,
    this.function,
  });

  final String title;
  final FaIcon icon;
  final Color color;
  final EdgeInsets paddingbutton;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 180.0,
      height: 40.0,
      padding: paddingbutton,
      //padding: EdgeInsets.only(left: 5.0, right: 5.0),
      child: TextButton(
        onPressed: () {
          function();
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



// class SignUp extends StatefulWidget {
//   @override
//   _SignUpState createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
//   AuthMethods authMethods = new AuthMethods();
//   DatabaseFunctions dbMethods = new DatabaseFunctions();
//   final formKey = GlobalKey<FormState>();
//   bool isLoading = false;
//   TextEditingController userNameTEC = new TextEditingController();
//   TextEditingController emailTEC = new TextEditingController();
//   TextEditingController passwordTEC = new TextEditingController();

//   signMeUp() {
//     if (formKey.currentState.validate()) {
//       setState(() {
//         isLoading = true;
//       });

//       helperFunctions.saveUserNameSP(userNameTEC.text);
//       helperFunctions.saveUserEmailSP(emailTEC.text);

//       Map<String, String> userMap = {
//         "email": emailTEC.text,
//         "name": userNameTEC.text
//       };

//       // dbMethods.uploadUserInfo(userMap);
//       authMethods
//           .signUpWithEmailAndPassword(emailTEC.text, passwordTEC.text)
//           .then((value) => {
//                 if (value != null)
//                   {
//                     helperFunctions.saveUserLoggedInSP(true),
//                     dbMethods.uploadUserInfo(userMap),
//                     Navigator.pushReplacement(context,
//                         MaterialPageRoute(builder: (context) => ChatRoom()))
//                   }
//               });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.indigo[900],
//         // title: Image.asset('assets/icon.png'),
//         title: Text("Chat Snap"),
//       ),
//       body: isLoading
//           ? Center(
//               child: CircularProgressIndicator(),
//             )
//           : SingleChildScrollView(
//               child: Container(
//                 height: MediaQuery.of(context).size.height - 50,
//                 child: Column(
//                   // crossAxisAlignment: CrossAxisAlignment.center,
//                   // mainAxisSize: MainAxisSize.max,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Form(
//                         key: formKey,
//                         child: Column(
//                           children: [
//                             Container(
//                               padding: EdgeInsets.all(15),
//                               child: TextFormField(
//                                 validator: (val) {
//                                   return val.isEmpty || val.length < 4
//                                       ? "UserName Greater than 4"
//                                       : null;
//                                 },
//                                 controller: userNameTEC,
//                                 decoration: InputDecoration(
//                                     hintText: "User Name",
//                                     hintStyle: TextStyle(
//                                         color: Colors.white, fontSize: 17),
//                                     enabledBorder: UnderlineInputBorder(
//                                         borderSide:
//                                             BorderSide(color: Colors.white))),
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                             ),
//                             Container(
//                               padding: EdgeInsets.all(15),
//                               child: TextFormField(
//                                 validator: (val) {
//                                   return RegExp(
//                                               r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//                                           .hasMatch(val)
//                                       ? null
//                                       : "please enter the valid email";
//                                 },
//                                 controller: emailTEC,
//                                 decoration: InputDecoration(
//                                     hintText: "Email",
//                                     hintStyle: TextStyle(
//                                         color: Colors.white, fontSize: 17),
//                                     enabledBorder: UnderlineInputBorder(
//                                         borderSide:
//                                             BorderSide(color: Colors.white))),
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                             ),
//                             Container(
//                               padding: EdgeInsets.all(15),
//                               child: TextFormField(
//                                 validator: (val) {
//                                   return val.length > 6
//                                       ? null
//                                       : "please provide password greater than 6";
//                                 },
//                                 controller: passwordTEC,
//                                 decoration: InputDecoration(
//                                     hintText: "Password",
//                                     hintStyle: TextStyle(
//                                         color: Colors.white, fontSize: 17),
//                                     enabledBorder: UnderlineInputBorder(
//                                         borderSide:
//                                             BorderSide(color: Colors.white))),
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                             ),
//                           ],
//                         )),

//                     SizedBox(
//                       height: 15,
//                     ),
//                     // Container(
//                     //   width: double.infinity,
//                     //   padding: EdgeInsets.only(right: 15, left: 15),
//                     //   child: Text(
//                     //     "Forgot Password",
//                     //     style: TextStyle(color: Colors.white),
//                     //     textAlign: TextAlign.right,
//                     //   ),
//                     // ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     Container(
//                       width: double.infinity,
//                       margin: EdgeInsets.all(15),
//                       height: 50,
//                       child: InkWell(
//                         onTap: () => {signMeUp()},
//                         child: Container(
//                           width: double.infinity,
//                           alignment: Alignment.center,
//                           child: Text(
//                             "Sign Up",
//                             style: TextStyle(color: Colors.white, fontSize: 18),
//                           ),
//                           decoration: BoxDecoration(
//                               color: Colors.indigo[700],
//                               borderRadius: BorderRadius.circular(25)),
//                         ),
//                       ),
//                     ),
//                     Container(
//                       width: double.infinity,
//                       margin: EdgeInsets.all(15),
//                       height: 50,
//                       child: InkWell(
//                         onTap: () => {print("signUp pressed!")},
//                         child: Container(
//                           width: double.infinity,
//                           alignment: Alignment.center,
//                           child: Text(
//                             "Sign Up with google",
//                             style: TextStyle(color: Colors.black, fontSize: 18),
//                           ),
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(25)),
//                         ),
//                       ),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           "Already have an account? ",
//                           style: TextStyle(color: Colors.white, fontSize: 15),
//                         ),
//                         InkWell(
//                           onTap: () {
//                             Navigator.pushReplacement(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => SignIn()));
//                           },
//                           child: Container(
//                             child: Text(
//                               "Sign In now",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 15,
//                                 decoration: TextDecoration.underline,
//                               ),
//                             ),
//                           ),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//     );
//   }
// }
