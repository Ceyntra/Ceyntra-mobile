import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {

    Size size= MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 3, 25, 37),
        body: SafeArea(
          child: Column(
            children: [
              //Forgot Password
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 70.0,bottom: 40.0),
                  child: Text(
                    'Forgot password',
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                ),
              ),

              //Image
              MediaQuery.of(context).viewInsets.bottom == 0 ?
              Expanded(
                flex: 2,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      //back oval shape
                      Image.asset('assets/images/backoval.png',),
                      //middle oval shape
                      Image.asset('assets/images/frontoval.png',),
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
                  ),
              ) : Icon(
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
                      'Enter your email below to recive your\n \t\t\t\t\t password reset instructions',
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  )
              ),

              Container(
                  // flex: 4,
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        TextField(
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                          ),

                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            ),
                            // labelText: 'Password',
                            hintText: 'Your Email'
                          ),
                        ),

                        SizedBox(
                          height: 20.0,
                        ),
                        TextButton(
                            style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all(Size(double.maxFinite,50.0)),
                              backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                  )
                              )
                            ),
                          onPressed: () { },
                          child: Text('Send password',
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
              ),
              Expanded(
                flex: 1,
                child: RichText(
                  text: TextSpan(
                      text: 'I remember the password',
                      style:GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          textStyle: TextStyle(
                              decoration: TextDecoration.underline,
                          ),
                      ),
                )
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
