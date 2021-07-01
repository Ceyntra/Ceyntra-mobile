import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddNewPlaceScreen extends StatefulWidget {
  // const AddNewPlaceScreen({ Key? key }) : super(key: key);
  final Function pressed;
  final bool isPressed;
  final Function setNull;
  AddNewPlaceScreen({this.pressed, this.isPressed, this.setNull});

  @override
  _AddNewPlaceScreenState createState() => _AddNewPlaceScreenState();
}

class _AddNewPlaceScreenState extends State<AddNewPlaceScreen> {
  @override
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
    );
  }
}
