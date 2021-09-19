import 'package:ceyntra_mobile/models/placeModel.dart';
import 'package:ceyntra_mobile/service/PlaceService.dart';
import 'package:flutter/material.dart';
import 'package:ceyntra_mobile/views/widgets/greenTagWidget.dart';
import 'package:ceyntra_mobile/views/widgets/feedPlaceWidget.dart';
import 'package:google_fonts/google_fonts.dart';

class FavouritePlacesScreen extends StatefulWidget {
  final ValueChanged<PlaceModel> setClickedPlace;
  final ValueChanged<String> changeMainFeedStateState;
  final Function setNullClickedOnThePlaceState;
  final Function setHamburgerStateNull;
  FavouritePlacesScreen(
      {this.setHamburgerStateNull,
      this.changeMainFeedStateState,
      this.setClickedPlace,
      this.setNullClickedOnThePlaceState});
  @override
  _FavouritePlacesScreenState createState() => _FavouritePlacesScreenState();
}

class _FavouritePlacesScreenState extends State<FavouritePlacesScreen> {
  PlaceService placeService = new PlaceService();

  var favPlaceList = [];
  @override
  void initState() {
    super.initState();
    placeService.loadFavPlaces().then((value) {
      setState(() {
        favPlaceList = value;
      });
    });
    // loadAllPlaces();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: favPlaceList.length != 0
              ? placeService.loadFavPlaceList(
                  widget.setHamburgerStateNull,
                  context,
                  favPlaceList,
                  widget.changeMainFeedStateState,
                  widget.setClickedPlace,
                  widget.setNullClickedOnThePlaceState)
              : [
                  Container(
                    // color: Colors.green,
                    width: 100,
                    height: 250,
                    child: Container(
                        alignment: Alignment.center,
                        width: 60,
                        height: 60,
                        // color: Colors.red,
                        child: CircularProgressIndicator()),
                  )
                ],
        )
      ],
    );
  }
}

class FavouritePlace extends StatelessWidget {
  final String imagePath;
  final String placeName;
  final double rating;

  const FavouritePlace({Key key, this.imagePath, this.placeName, this.rating})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 180,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                image: DecorationImage(
                    image: AssetImage(imagePath), fit: BoxFit.fitWidth)),
          ),
          RatingWidget(rating: rating, placeName: placeName),
        ],
      ),
    );
  }
}

class RatingWidget extends StatelessWidget {
  final double rating;
  final String placeName;
  const RatingWidget({Key key, this.rating, this.placeName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = List<Widget>.generate(
      rating.round(),
      (i) => Container(
        margin: EdgeInsets.only(right: 5),
        child: Icon(
          Icons.star_rate,
          color: Colors.amber[300],
          size: 20,
        ),
      ),
    );

    return Positioned(
        height: 35,
        bottom: 10,
        left: 20,
        right: 20,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
              borderRadius: BorderRadius.circular(10)),
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          height: 20,
          child: Container(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  child: Text(
                placeName,
                style: GoogleFonts.montserrat(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              )),
              Container(
                child: Container(
                  child: Row(
                    children: [
                      Row(children: items),
                    ],
                  ),
                ),
              )
            ],
          )),
        ));
  }
}
