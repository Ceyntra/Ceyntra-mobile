import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class TravellerSignUp extends StatefulWidget {
  final Function signIn;
  TravellerSignUp({this.signIn});
  @override
  _TravellerSignUpState createState() => _TravellerSignUpState();
}

class _TravellerSignUpState extends State<TravellerSignUp> {
  // final FirebaseAuth auth = FirebaseAuth.instance;
  // final googleSingIn = GoogleSignIn();
  // GoogleSignInAccount user;

  // Future signUp() async {
  //   final googleUser = await googleSingIn.signIn();
  //   if (googleUser == null) return;
  //   user = googleUser;
  //   final googleAuth = await googleUser.authentication;

  //   final credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

  //   print(googleUser.displayName);

  //   await auth.signInWithCredential(credential).then((value) => {print(value)});
  // }

  // Future signOut() async {
  //   final signOut = await googleSingIn.signOut();
  //   print("skdjfh");
  //   print(signOut);
  // }
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    bool isError = false;
    TextEditingController firstNameTec = new TextEditingController();
    TextEditingController lastNameTec = new TextEditingController();
    TextEditingController nicTec = new TextEditingController();
    TextEditingController emailTEC = new TextEditingController();
    TextEditingController contactNumberTec = new TextEditingController();
    TextEditingController passwordTec = new TextEditingController();
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
                    onTap: () {
                      widget.signIn();
                    },
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
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 30),
              // color: Colors.amber,
              child: Text(
                "Or Sign up with Email and Password",
                style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ),
            Container(
                padding: EdgeInsets.only(
                    left: 25.0, right: 25.0, top: 10.0, bottom: 10.0),
                child: Column(
                  children: [
                    isError
                        ? Container(
                            alignment: Alignment.center,
                            // color: Colors.amber,
                            child: Text(
                              "Details not added. Please try again!",
                              style: GoogleFonts.montserrat(
                                  fontSize: 16,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w400),
                            ),
                          )
                        : Container(),
                    Container(
                        // color: Colors.amber,

                        padding: EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 20.0, bottom: 10.0),
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                style: GoogleFonts.montserrat(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                                controller: firstNameTec,
                                validator: (val) {
                                  return val.isEmpty || val.length < 4
                                      ? "First name should be greater than 4"
                                      : null;
                                },
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(FontAwesomeIcons.solidUser),
                                  hintText: "First Name",
                                  filled: true,
                                  contentPadding: EdgeInsets.only(
                                      left: 15.0,
                                      right: 15.0,
                                      top: 5.0,
                                      bottom: 10.0),
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                          const Radius.circular(5.0))),
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 15.0)),
                              TextFormField(
                                style: GoogleFonts.montserrat(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                                controller: lastNameTec,
                                validator: (val) {
                                  return val.isEmpty || val.length < 4
                                      ? "Last name should be greater than 4"
                                      : null;
                                },
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(FontAwesomeIcons.solidUser),
                                  hintText: "Last Name",
                                  filled: true,
                                  contentPadding: EdgeInsets.only(
                                      left: 15.0,
                                      right: 15.0,
                                      top: 5.0,
                                      bottom: 10.0),
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                          const Radius.circular(5.0))),
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 15.0)),
                              TextFormField(
                                style: GoogleFonts.montserrat(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                                controller: nicTec,
                                validator: (val) {
                                  return val.isEmpty || val.length < 4
                                      ? "NIC/Passport should be greater than 4"
                                      : null;
                                },
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.perm_identity),
                                  hintText: "NIC / Passport",
                                  filled: true,
                                  contentPadding: EdgeInsets.only(
                                      left: 15.0,
                                      right: 15.0,
                                      top: 5.0,
                                      bottom: 10.0),
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                          const Radius.circular(5.0))),
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 15.0)),
                              TextFormField(
                                style: GoogleFonts.montserrat(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                                controller: emailTEC,
                                validator: (val) {
                                  return RegExp(
                                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                          .hasMatch(val)
                                      ? null
                                      : "please enter the valid email";
                                },
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.email),
                                  hintText: "Email",
                                  filled: true,
                                  contentPadding: EdgeInsets.only(
                                      left: 15.0,
                                      right: 15.0,
                                      top: 5.0,
                                      bottom: 10.0),
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                          const Radius.circular(5.0))),
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 15.0)),
                              TextFormField(
                                style: GoogleFonts.montserrat(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                                controller: contactNumberTec,
                                validator: (val) {
                                  return val.isEmpty || val.length < 9
                                      ? "Contact num should be greater than 9"
                                      : null;
                                },
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.phone_android),
                                  hintText: "Contact Number",
                                  filled: true,
                                  contentPadding: EdgeInsets.only(
                                      left: 15.0,
                                      right: 15.0,
                                      top: 5.0,
                                      bottom: 10.0),
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                          const Radius.circular(5.0))),
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 15.0)),
                              TextFormField(
                                style: GoogleFonts.montserrat(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                                obscureText: true,
                                validator: (val) {
                                  return val.length > 6
                                      ? null
                                      : "Please provide passowrd greater than 6";
                                },
                                controller: passwordTec,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.lock),
                                  hintText: "Password",
                                  filled: true,
                                  contentPadding: EdgeInsets.only(
                                      left: 15.0,
                                      right: 15.0,
                                      top: 5.0,
                                      bottom: 10.0),
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                          const Radius.circular(5.0))),
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 15.0)),
                            ],
                          ),
                        )),
                  ],
                )),
            // Container(
            //   padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
            //   height: 60.0,
            //   child: TextButton(
            //     onPressed: () {},
            //     child: Text(
            //       "Sign Up",
            //       style: TextStyle(
            //         color: Colors.white,
            //         fontWeight: FontWeight.w400,
            //       ),
            //     ),
            //     style: ButtonStyle(
            //         alignment: Alignment.center,
            //         backgroundColor:
            //             MaterialStateProperty.all(Color(0xFF64B5F6)),
            //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            //             RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(10.0)))),
            //   ),
            // ),
            Container(
              // color: Colors.amber,
              padding: EdgeInsets.only(
                left: 35.0,
                right: 35.0,
              ),
              height: 40.0,
              child: TextButton(
                onPressed: () {
                  if (formKey.currentState.validate()) {
                    // updateDetails();
                  }
                },
                child: Text(
                  "Update details",
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
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
