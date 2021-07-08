import 'package:ceyntra_mobile/views/screens/hamburgerScreens/favouriteScreens/FavouriteTaxis.dart';
import 'package:ceyntra_mobile/views/screens/hamburgerScreens/favouriteScreens/favouriteGuides.dart';
import 'package:ceyntra_mobile/views/screens/hamburgerScreens/favouriteScreens/favouriteHotels.dart';
import 'package:ceyntra_mobile/views/screens/hamburgerScreens/favouriteScreens/favouritePlaces.dart';
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
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Color(0xff192537),
        appBar: AppBar(
          bottom: TabBar(
            labelColor: Colors.green,
            unselectedLabelColor: Colors.yellow[700],
            tabs: [
              Tab(
                icon: Icon(Icons.location_on),
                child: Text(
                  "Place",
                  style: GoogleFonts.montserrat(color: Colors.white),
                ),
              ),
              Tab(
                icon: Icon(Icons.hotel),
                child: Text(
                  "Hotel",
                  style: GoogleFonts.montserrat(color: Colors.white),
                ),
              ),
              Tab(
                icon: Icon(Icons.local_taxi),
                child: Text(
                  "Taxi",
                  style: GoogleFonts.montserrat(color: Colors.white),
                ),
              ),
              Tab(
                icon: Icon(Icons.tour),
                child: Text(
                  "Guide",
                  style: GoogleFonts.montserrat(color: Colors.white),
                ),
              ),
            ],
          ),
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
                    widget.pressed(
                        (MediaQuery.of(context).size.width / 100) * 70,
                        70.0,
                        0.8,
                        true);
                  },
                  child: Icon(
                    Icons.menu,
                  )),
          backgroundColor: Color(0xff192537),
        ),
        body: TabBarView(
          children: [
            FavouritePlacesScreen(),
            FavouriteHotelsScreen(),
            FavouriteTaxisScreen(),
            FavouriteGuidesScreen()
          ],
        ),
      ),
    );
  }
}
