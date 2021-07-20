import 'package:ceyntra_mobile/views/screens/signUpScreen/addTravallerDetails.dart';
import 'package:ceyntra_mobile/views/screens/signUpScreen/travellerSignUp.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class TravellerSignUpTwo extends StatefulWidget {
  @override
  _TravellerSignUpTwoState createState() => _TravellerSignUpTwoState();
}

class _TravellerSignUpTwoState extends State<TravellerSignUpTwo> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final googleSingIn = GoogleSignIn();
  GoogleSignInAccount user;

  Future signUp() async {
    final googleUser = await googleSingIn.signIn();
    if (googleUser == null) return;
    user = googleUser;
    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    print(googleUser.displayName);

    await auth.signInWithCredential(credential).then((value) => {print(value)});
  }

  Future signOut() async {
    final signOut = await googleSingIn.disconnect();
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return AddTravallerDetailsScreen(
              signOut: signOut,
            );
          } else {
            return TravellerSignUp(
              signIn: signUp,
            );
          }
        },
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
