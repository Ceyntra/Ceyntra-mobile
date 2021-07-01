import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavouritesScreen extends StatefulWidget {
  // const FavouritesScreen({ Key? key }) : super(key: key);
  final Function pressed;
  final bool isPressed;
  final Function setNull;
  FavouritesScreen({this.pressed, this.isPressed, this.setNull});

  @override
  _FavouritesScreenState createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff192537),
      appBar: AppBar(
        title: Text(
          "My favourites",
          style: GoogleFonts.montserrat(fontSize: 18),
        ),
        leading: widget.isPressed
            ? InkWell(
                onTap: () {
                  widget.setNull();
                  print("me inne false eke");
                  widget.pressed(0.0, 0.0, 1.0, false);
                },
                child: Icon(Icons.arrow_back))
            : InkWell(
                onTap: () {
                  widget.setNull();
                  print("me inne true eke");
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
