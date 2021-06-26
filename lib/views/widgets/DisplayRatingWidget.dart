import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class DisplayRatingWidget extends StatelessWidget {
  // const DisplayRatingWidget({ Key? key }) : super(key: key);
  final double rating;
  final int votes;

  DisplayRatingWidget({this.rating, this.votes});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Text(
              rating.toString(),
              style: GoogleFonts.montserrat(fontSize: 15, color: Colors.white),
            ),
          ),
          Container(
            child: RatingBar.builder(
              itemSize: 20,
              ignoreGestures: true,
              initialRating: rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 5),
            child: Text(
              "(" + votes.toString() + ")",
              style: GoogleFonts.montserrat(fontSize: 10, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
