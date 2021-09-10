import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaxiPackageScreen extends StatefulWidget {
  TaxiPackageScreen({Key key}) : super(key: key);

  @override
  _TaxiPackageScreenState createState() => _TaxiPackageScreenState();
}

class _TaxiPackageScreenState extends State<TaxiPackageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color(0xff2F3546),
       body: SingleChildScrollView(
         child: Column(
           children:[
             Container(
                  //back button with name
             ),

            Container(
              margin: EdgeInsets.only(top:25,right: 20,left: 20),
              decoration: BoxDecoration(
                borderRadius:BorderRadius.all(
                  Radius.circular(10)
                  ),
                  color: Colors.black38,
              ),
              height:250,
              width:double.infinity,

              child: Stack(
                children: [
                  Container(
                    height: 150,
                    //margin: EdgeInsets.only(top:25,right: 20,left: 20), 
                    decoration: BoxDecoration(
                        borderRadius:BorderRadius.only(topLeft:
                        Radius.circular(10),topRight: Radius.circular(10)
                    
                    ),
                      //color:Colors.black,
                      image: DecorationImage(
                        image: AssetImage("assets/images/van.jpg"),
                        fit: BoxFit.cover,
                      )
              ),
                  ),
                  Container(
                    //padding: EdgeInsets.only(bottom:20),
                    margin: EdgeInsets.only(top:160,left:15,right:15),
                    child: Row(
                      children: [
                        Text(
                          'With Driver\nWith Diesel\n14 Passengers',
                          style:GoogleFonts.montserrat(
                            fontSize: 16,
                            height: 1.5,
                            color: Colors.white,
                            
                          ),
                        ),
                        Text(
                          '\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tPrice\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t7250 LKR',
                          //textAlign: TextAlign.right,
                          style:GoogleFonts.montserrat(
                            fontSize: 16,
                            height: 1.5,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            
                          ),
                        )
                      ],
                     
                    ),
                  )
                ],
              ),
              
            ), 
            Container(
              margin: EdgeInsets.only(top:25,right: 20,left: 20),
              decoration: BoxDecoration(
                borderRadius:BorderRadius.all(
                  Radius.circular(10)
                  ),
                  color: Colors.black38,
              ),
              height:250,
              width:double.infinity,

              child: Stack(
                children: [
                  Container(
                    height: 150,
                    //margin: EdgeInsets.only(top:25,right: 20,left: 20), 
                    decoration: BoxDecoration(
                        borderRadius:BorderRadius.only(topLeft:
                        Radius.circular(10),topRight: Radius.circular(10)
                    
                    ),
                      //color:Colors.black,
                      image: DecorationImage(
                        image: AssetImage("assets/images/van.jpg"),
                        fit: BoxFit.cover,
                      )
              ),
                  ),
                  Container(
                    //padding: EdgeInsets.only(bottom:20),
                    margin: EdgeInsets.only(top:160,left:15,right:15),
                    child: Row(
                      children: [
                        Text(
                          'With Driver\nWith Diesel\n14 Passengers',
                          style:GoogleFonts.montserrat(
                            fontSize: 16,
                            height: 1.5,
                            color: Colors.white,
                            
                          ),
                        ),
                        Text(
                          '\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tPrice\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t7250 LKR',
                          //textAlign: TextAlign.right,
                          style:GoogleFonts.montserrat(
                            fontSize: 16,
                            height: 1.5,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            
                          ),
                        )
                      ],
                     
                    ),
                  )
                ],
              ),
              
            ), 
            Container(
              margin: EdgeInsets.only(top:25,right: 20,left: 20),
              decoration: BoxDecoration(
                borderRadius:BorderRadius.all(
                  Radius.circular(10)
                  ),
                  color: Colors.black38,
              ),
              height:250,
              width:double.infinity,

              child: Stack(
                children: [
                  Container(
                    height: 150,
                    //margin: EdgeInsets.only(top:25,right: 20,left: 20), 
                    decoration: BoxDecoration(
                        borderRadius:BorderRadius.only(topLeft:
                        Radius.circular(10),topRight: Radius.circular(10)
                    
                    ),
                      //color:Colors.black,
                      image: DecorationImage(
                        image: AssetImage("assets/images/van.jpg"),
                        fit: BoxFit.cover,
                      )
              ),
                  ),
                  Container(
                    //padding: EdgeInsets.only(bottom:20),
                    margin: EdgeInsets.only(top:160,left:15,right:15),
                    child: Row(
                      children: [
                        Text(
                          'With Driver\nWith Diesel\n14 Passengers',
                          style:GoogleFonts.montserrat(
                            fontSize: 16,
                            height: 1.5,
                            color: Colors.white,
                            
                          ),
                        ),
                        Text(
                          '\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tPrice\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t7250 LKR',
                          //textAlign: TextAlign.right,
                          style:GoogleFonts.montserrat(
                            fontSize: 16,
                            height: 1.5,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            
                          ),
                        )
                      ],
                     
                    ),
                  )
                ],
              ),
              
            ), 
           ],
         ),
       ),
    );
  }
}