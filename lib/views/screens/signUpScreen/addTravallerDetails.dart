import 'package:ceyntra_mobile/views/screens/signUpScreen/travellerSignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shape_of_view/shape_of_view.dart';

class AddTravallerDetailsScreen extends StatefulWidget {
  // const AddTravallerDetailsScreen({ Key? key }) : super(key: key);
  final Function signOut;

  AddTravallerDetailsScreen({this.signOut});

  @override
  _AddTravallerDetailsScreenState createState() =>
      _AddTravallerDetailsScreenState();
}

class _AddTravallerDetailsScreenState extends State<AddTravallerDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    String userName = user.displayName;
    String firstName = userName.split(" ")[0];
    String lastName = userName.split(" ")[1];
    String email = user.email;

    return Scaffold(
      backgroundColor: Color(0xff031925),
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              widget.signOut();
            },
            child: Icon(Icons.arrow_back)),
        backgroundColor: Color(0xff031925),
        title: Text(
          "Add Travaller Details",
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
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(user.photoURL), fit: BoxFit.contain)),
            ),
            Container(
                padding: EdgeInsets.only(
                    left: 25.0, right: 25.0, top: 20.0, bottom: 10.0),
                child: Column(
                  children: [
                    TextFormField(
                      initialValue: firstName,
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
                      initialValue: lastName,
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
                      initialValue: email,
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
