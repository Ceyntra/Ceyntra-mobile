import 'package:ceyntra_mobile/service/ForgetPasswordService.dart';
import 'package:ceyntra_mobile/views/screens/forgetPassword/InsertPinScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPassword extends StatefulWidget {
  ForgetPassword({Key key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  String email;
  bool validEmail = true;
  bool invalidUser = false;
  bool sendingMail = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  ForgetPasswordService forgetPasswordService = new ForgetPasswordService();

  validateEmail(BuildContext context) async {
    bool valid = await forgetPasswordService.resetPassword(email);

    if (valid) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => InsertPinScreen(
                    email: email,
                  )));
    } else {
      setState(() {
        invalidUser = true;
        sendingMail = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 3, 25, 37),
        body: SafeArea(
          child: Stack(
            children: [
              //Forgot Password

              ListView(
                children: [
                  Center(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 70.0, bottom: 40.0),
                        child: Text(
                          'Forgot password',
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),

                  //Image
                  MediaQuery.of(context).viewInsets.bottom == 0
                      ? Stack(
                          alignment: Alignment.center,
                          children: [
                            //back oval shape
                            Image.asset(
                              'assets/images/backoval.png',
                            ),
                            //middle oval shape
                            Image.asset(
                              'assets/images/frontoval.png',
                            ),
                            //front circle
                            CircleAvatar(
                              backgroundColor: Colors.lightBlue,
                              radius: 70.0,
                            ),

                            // icon
                            Icon(
                              Icons.lock_open,
                              color: Colors.white,
                              size: 50.0,
                            ),
                          ],
                        )
                      : Icon(
                          Icons.lock_open,
                          color: Colors.white,
                          size: 50.0,
                        ),

                  //Description
                  Container(
                      //flex: 1,
                      child: Container(
                    padding: const EdgeInsets.all(20.0),
                    alignment: Alignment.center,
                    child: Text(
                      'Enter your email below to receive your\n \t\t\t\t\t password reset instructions',
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  )),

                  invalidUser
                      ? Center(
                          child: Text(
                            "Not a registered email !",
                            style: GoogleFonts.montserrat(
                                color: Colors.red,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                        )
                      : Text(''),

                  Container(
                      // flex: 4,
                      margin: EdgeInsets.only(bottom: 20.0),
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                validator: (val) {
                                  return RegExp(
                                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                          .hasMatch(val)
                                      ? null
                                      : "please enter the valid email";
                                },
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                ),
                                onSaved: (val) {
                                  setState(() {
                                    email = val;
                                  });
                                },
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)),
                                    ),
                                    // labelText: 'Password',
                                    hintText: 'Your Email'),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              TextButton(
                                style: ButtonStyle(
                                    minimumSize: MaterialStateProperty.all(
                                        Size(double.maxFinite, 50.0)),
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.lightBlue),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ))),
                                onPressed: () {
                                  setState(() {
                                    sendingMail = true;
                                  });

                                  if (_formKey.currentState.validate()) {
                                    _formKey.currentState.save();
                                    // _formKey.currentState.reset();
                                    validateEmail(context);
                                  } else {
                                    setState(() {
                                      invalidUser = false;
                                      sendingMail = false;
                                    });
                                  }
                                },
                                child: Text(
                                  'Reset password',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                  Center(
                    child: InkWell(
                      child: Text(
                        'I remember the password',
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          textStyle: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),

              if (sendingMail) ...[
                LoadingSpinner(),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class LoadingSpinner extends StatelessWidget {
  const LoadingSpinner({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200.0,
        height: 200.0,
        child: CircularProgressIndicator(
          backgroundColor: Colors.blueAccent,
          strokeWidth: 10.0,
        ),
      ),
    );
  }
}
