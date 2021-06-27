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
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 3, 25, 37),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 70.0),
                  child: Text(
                    'Forgot password',
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w300
                    ),
                  ),
                ),
              ),

              //Image
              Expanded(
                flex: 4,
                  child: Stack(
                    children: [
                        Container(
                          alignment: Alignment.topCenter,
                          child: CircleAvatar(
                            backgroundColor: Colors.lightBlue,
                            radius: 80.0,
                            child: Icon(
                              Icons.lock_open,
                              color: Colors.white,
                              size: 60.0,
                            )
                          ),
                        ),

                        Text(
                        '..',
                        style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        ),),

                    ],
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
