import 'package:ceyntra_mobile/service/ForgetPasswordService.dart';
import 'package:ceyntra_mobile/views/screens/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class NewPassword extends StatefulWidget {

  NewPassword({Key key,@required this.pin,@required this.email}) : super(key: key);
  final String pin;
  final String email;

  @override
  _NewPasswordState createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {

  bool _isObscure1=true;
  bool _isObscure2=true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String password;
  String confPassword;
  ForgetPasswordService forgetPasswordService=new ForgetPasswordService();
  bool notMatched=false;
  bool updateFailed=false;

  updatePassword(BuildContext context) async {

    bool updated= await forgetPasswordService.updatePassword(password, widget.email, widget.pin);

    print("Updated : "+ updated.toString());

    if(! updated){
      setState(() {
        updateFailed=true;
      });
    }else{
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => LoginScreen(passwordReset: "Success",)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
        backgroundColor: Color(0xff031925),
      ),

        backgroundColor: Color(0xff031925),
        body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 20.0,
          ),
          child: SafeArea(

            child: ListView(
              physics: ClampingScrollPhysics(),
              children: [

                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "New Password",
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),

                SizedBox(height: 40,),

                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      //New Password
                      TextFormField(
                        validator: (val) {
                          return val.length >6 ? null : "Password must be > 6 digits";
                        },

                        onSaved: (val){
                          password=val;
                        },

                        decoration: InputDecoration(
                          hintText: "New Password",
                          filled: true,
                          contentPadding: EdgeInsets.only(
                              left: 15.0, right: 15.0, top: 5.0, bottom: 10.0),
                          fillColor: Colors.white,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isObscure1 ? Icons.visibility : Icons.visibility_off,
                            ),
                            onPressed: (){
                              setState(() {
                                _isObscure1=!_isObscure1;
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                  const Radius.circular(10.0))),
                        ),
                        obscureText: _isObscure1,
                      ),

                      SizedBox(height: 25,),

                      //Confirm Password
                      TextFormField(

                        onSaved: (val){
                          confPassword=val;
                        },

                        decoration: InputDecoration(
                          filled: true,
                          hintText: "Confirm Password",
                          contentPadding: EdgeInsets.all(15.0),
                          fillColor: Colors.white,

                          suffixIcon: IconButton(
                              icon: Icon(
                                _isObscure2 ? Icons.visibility : Icons.visibility_off,
                              ),
                            onPressed: (){
                                setState(() {
                                  _isObscure2=!_isObscure2;
                                });
                            },
                          ),

                          border: OutlineInputBorder(
                              borderRadius:  BorderRadius.all(
                                   Radius.circular(10.0))),
                        ),
                        obscureText: _isObscure2,
                      ),


                    ],
                  ),
                ),

                if(updateFailed) ...[
                  Text("Sorry. Password reset failed!", style: GoogleFonts.montserrat(
                    color: Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  )
                ],
                if(notMatched) ...[
                  Text("Password Not matched!", style: GoogleFonts.montserrat(
                    color: Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  )
                ],



                SizedBox(height: 35,),

                TextButton(
                  onPressed: () {
                    print("Conf:"+ confPassword.toString());
                    print("password:"+ password.toString());

                    if(_formKey.currentState.validate()){

                      _formKey.currentState.save();

                      //Validate Password Not matched
                      if(password != confPassword){
                        setState(() {
                          notMatched=true;
                        });
                      }else{
                        //Password matched
                        updatePassword(context);
                      }
                    }

                  },
                  child: Text(
                    "Reset Password",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: ButtonStyle(
                      alignment: Alignment.center,
                      backgroundColor:
                          MaterialStateProperty.all(Colors.lightBlue),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)))),
                ),

              ],
            ),
          ),
        )
    );
  }
}
