import 'package:flutter/material.dart';
import 'package:ceyntra_mobile/views/widgets/greenTagWidget.dart';
import 'package:ceyntra_mobile/views/widgets/feedPlaceWidget.dart';
import 'package:google_fonts/google_fonts.dart';

class FavouritePlacesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        GreenTagWidget(title: 'Places    ',),
        FavouritePlace(imagePath: "assets/images/polo.jpg",placeName: 'Polonnaruwa',rating: 4.3,),
        FavouritePlace(imagePath: "assets/images/s7.jpg",placeName: 'Hambanthota',rating: 3.6,),
        FavouritePlace(imagePath: "assets/images/s4.jpeg",placeName: 'Galle',rating: 2.3,),
      ],
    );
  }
}


class FavouritePlace extends StatelessWidget {

  final String imagePath;
  final String placeName;
  final double rating;

  const FavouritePlace({Key key, this.imagePath, this.placeName, this.rating}) : super(key: key);

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
                    image: AssetImage(imagePath),
                    fit: BoxFit.fitWidth)),
          ),

          RatingWidget(rating:rating,placeName: placeName),
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
