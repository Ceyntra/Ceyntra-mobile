import 'package:ceyntra_mobile/service/ForgetPasswordService.dart';
import 'package:ceyntra_mobile/views/screens/forgetPassword/newPassword.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';


class InsertPinScreen extends StatefulWidget {
  const InsertPinScreen({Key key,@required this.email, }) : super(key: key);

  final String email;

  @override
  _InsertPinScreenState createState() => _InsertPinScreenState();
}

class _InsertPinScreenState extends State<InsertPinScreen> {


  TextEditingController newTextEditingController = TextEditingController();
  ForgetPasswordService forgetPasswordService=new ForgetPasswordService();
  FocusNode focusNode = FocusNode();
  String pin;
  bool pinNotMatch=false;
  bool inValidPin=false;


  @override
  void dispose() {
    newTextEditingController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  validatePinCode(BuildContext context) async {

    bool valid= await forgetPasswordService.verifyPin(widget.email, pin);

    print("Valid pincode :"+ valid.toString());

    if(valid){
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => NewPassword(pin: pin,email: widget.email,)));
    }else{
      setState(() {
        inValidPin=false;
        pinNotMatch=true;
      });

    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset:false,
        backgroundColor: Color(0xff031925),
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

      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 20.0,
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Text("Verify Account!", style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w400,
              ),
              ),

              SizedBox(height: 35,),
              Text("Enter 4-digit code We have sent to your email", style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              ),
              SizedBox(height: 5,),
              Text(widget.email, style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              ),
              SizedBox(height: 40,),

              PinCodeFields(
                length: 4,
                controller: newTextEditingController,
                focusNode: focusNode,
                onComplete: (result) {
                    pin=result;
                },
                textStyle:GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.w600,
              ),
                keyboardType: TextInputType.number,
              ),

              SizedBox(height: 40,),
              Text("Didn't received the pin ?", style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              ),
              SizedBox(height: 10,),
              InkWell(
                child: Text("Resend Pin", style: GoogleFonts.montserrat(
                  color: Colors.green,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                ),
                onTap: (){
                  print("Resend the pin");
                  forgetPasswordService.resetPassword(widget.email);
                },
              ),

              SizedBox(height: 10,),

              //You have not entered 4 digits
              if(inValidPin) ...[
                Text("Pin must be 4 number!",
                  style: GoogleFonts.montserrat(
                    color: Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),

              ],

              if(pinNotMatch) ...[
                Text("Invalid Pin code !",
                  style: GoogleFonts.montserrat(
                    color: Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),

              ],



              Expanded(
                child: Container(),
              ),

              ElevatedButton(
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(double.maxFinite,42.0)),
                    backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        )
                    )
                ),
                onPressed: () {

                  //Check Pin null
                  if(pin == null){
                    print("Digit 4 failed or null");
                    setState(() {
                      inValidPin=true;
                    });
                    return;
                  }
                  var number=num.tryParse(pin);

                  if(pin.length ==4 && number!= null && number is int){
                    print("No digit syntax error");
                    validatePinCode(context);

                  }else{
                    print("Digit 4 failed");
                    //Not inserted 4 digit integers
                    setState(() {
                      pinNotMatch=false;
                      inValidPin=true;
                    });
                  }
                },
                child: Text('Proceed',
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
              SizedBox(height: 30,),
            ],

          ),
        ),

      ),
    );
  }
}
