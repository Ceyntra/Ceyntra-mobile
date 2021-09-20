import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ceyntra_mobile/views/screens/offersScreens/widget/InputFormField.dart';
import 'package:ceyntra_mobile/views/screens/offersScreens/widget/ThreeImageUploadField.dart';

class AddNewPlaceScreen extends StatefulWidget {
  // const AddNewPlaceScreen({ Key? key }) : super(key: key);
  final Function pressed;
  final bool isPressed;
  final Function setNull;

  File image;
  AddNewPlaceScreen({this.pressed, this.isPressed, this.setNull});



  @override
  _AddNewPlaceScreenState createState() => _AddNewPlaceScreenState();
}

class _AddNewPlaceScreenState extends State<AddNewPlaceScreen> {
  @override
     Widget Title(String title) {
    return (Opacity(
      opacity: 0.64,
      child: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
    ));
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff192537),
      appBar: AppBar(
        title: Text(
          "Add new place",
          style: GoogleFonts.montserrat(fontSize: 18),
        ),
        leading: widget.isPressed
            ? InkWell(
                onTap: () {
                  widget.setNull();

                  widget.pressed(0.0, 0.0, 1.0, false);
                },
                child: Icon(Icons.arrow_back))
            : InkWell(
                onTap: () {
                  widget.setNull();

                  widget.pressed((MediaQuery.of(context).size.width / 100) * 70,
                      70.0, 0.8, true);
                },
                child: Icon(
                  Icons.menu,
                )),
        backgroundColor: Color(0xff192537),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children :[
                Title('Place Name'),

                SizedBox(
                height: 8,
              ),

              InputFormField(
                  maxline: 1,
                  minline: 1),
              
              Divider(
                color: Colors.white,
              ),

              SizedBox(
                height: 10,
              ),

              Title('Place Description'),

                SizedBox(
                height: 8,
              ),

              InputFormField(
                  maxline: 10,
                  minline: 4),

              Divider(
                color: Colors.white,
              ),

              SizedBox(
                height: 10,
              ),

              Title("Images"),
              SizedBox(
                height: 8,
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  
                  ImageUploadField(setImageState: (img) {

              }),
                  ImageUploadField(setImageState: (img) {

              }),

                  ImageUploadField(setImageState: (img) {

              }),
                ],
              ),
              



              Divider(
                color: Colors.white,
              ),

              SizedBox(
                height: 10,
              ),

              Title('District'),
              
                SizedBox(
                  height: 8,
                ),

              InputFormField(
                  maxline: 1,
                  minline: 1),

              Divider(
                color: Colors.white,
              ),

              SizedBox(
                height: 10,
              ),

              Title('Place Latitude'),

                SizedBox(
                height: 8,
              ),

              InputFormField(
                  maxline: 1,
                  minline: 1),

               Divider(
                color: Colors.white,
              ), 

              SizedBox(
                height: 10,
              ),

              Title('Place Longitude'),

                SizedBox(
                height: 8,
              ),

              InputFormField(
                  maxline: 1,
                  minline: 1),
              Divider(
                color: Colors.white,
              ),

              SizedBox(
                height: 15,
              ),

               Container(
                width: MediaQuery.of(context).size.width * 0.96,
                child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ))),
                  child: Text("Add Place"),
                  onPressed: () {
                    
                    }
                ),
              ),
              
              ]
            )),
        )
        ),
    );
  }
}
