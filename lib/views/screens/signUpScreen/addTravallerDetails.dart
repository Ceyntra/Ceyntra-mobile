import 'package:ceyntra_mobile/views/screens/loginScreen.dart';
import 'package:ceyntra_mobile/views/screens/signUpScreen/travellerSignUp.dart';
import 'package:dio/dio.dart';
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
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    String userName = user.displayName;
    String firstName = userName.split(" ")[0];
    String lastName = userName.split(" ")[1];
    String email = user.email;

    bool isError = false;
    TextEditingController firstNameTec =
        new TextEditingController(text: firstName);
    TextEditingController lastNameTec =
        new TextEditingController(text: lastName);
    TextEditingController nicTec = new TextEditingController();
    TextEditingController emailTEC = new TextEditingController(text: email);
    TextEditingController contactNumberTec = new TextEditingController();
    TextEditingController passwordTec = new TextEditingController();
    bool isProgress = false;
    var dio = Dio();
    void updateDetails() async {
      Map<String, String> userDetails = {
        "firstName": firstNameTec.text,
        "lastName": lastNameTec.text,
        "nic": nicTec.text,
        "email": emailTEC.text,
        "contactNumber": contactNumberTec.text,
        "password": passwordTec.text
      };

      setState(() {
        isProgress = true;
      });

      var response = await dio.post("http://10.0.2.2:9092/getUserDetails",
          data: userDetails);
      setState(() {
        isProgress = false;
      });

      if (response.toString() == "done") {
        widget.signOut();
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => LoginScreen(
                      isCreated: "created",
                    )));
      } else {
        setState(() {
          isError = true;
        });
      }
      print(response.toString());
    }

    return Scaffold(
      backgroundColor: Color(0xff031925),
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              // user.delete();
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
              margin: EdgeInsets.only(bottom: 20),
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(user.photoURL), fit: BoxFit.contain)),
            ),
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
                    left: 30.0, right: 30.0, top: 20.0, bottom: 10.0),
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
                              left: 15.0, right: 15.0, top: 5.0, bottom: 10.0),
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
                              left: 15.0, right: 15.0, top: 5.0, bottom: 10.0),
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
                              left: 15.0, right: 15.0, top: 5.0, bottom: 10.0),
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
                              left: 15.0, right: 15.0, top: 5.0, bottom: 10.0),
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
                              left: 15.0, right: 15.0, top: 5.0, bottom: 10.0),
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
                              left: 15.0, right: 15.0, top: 5.0, bottom: 10.0),
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
            Container(
              // color: Colors.amber,
              padding: EdgeInsets.only(
                left: 30.0,
                right: 30.0,
              ),
              height: 40.0,
              child: TextButton(
                onPressed: () {
                  if (formKey.currentState.validate()) {
                    updateDetails();
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Update details",
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    isProgress
                        ? Container(
                            margin: EdgeInsets.only(left: 15),
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(),
                          )
                        : Container(),
                  ],
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
      ),
    );
  }
}
