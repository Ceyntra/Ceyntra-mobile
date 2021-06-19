import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedPlaceWidget extends StatefulWidget {
  final String imagePath;
  final String placeName;
  final double rating;
  final int votes;

  FeedPlaceWidget({this.imagePath, this.placeName, this.rating, this.votes});

  @override
  _FeedPlaceWidgetState createState() => _FeedPlaceWidgetState();
}

class _FeedPlaceWidgetState extends State<FeedPlaceWidget> {
  @override
  Widget build(BuildContext context) {
    final items = List<Widget>.generate(
      widget.rating.round(),
      (i) => Container(
        margin: EdgeInsets.only(right: 5),
        child: Icon(
          Icons.star_rate,
          color: Colors.amber[300],
          size: 16,
        ),
      ),
    );

    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Container(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 180,
              // width: (MediaQuery.of(context).size.width / 100) * 92,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                      image: AssetImage(widget.imagePath),
                      fit: BoxFit.fitWidth)),
            ),
            Positioned(
                height: 50,
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
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          child: Text(
                        widget.placeName,
                        style: GoogleFonts.montserrat(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      )),
                      Container(
                        child: Container(
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Text(
                                  widget.rating.toString(),
                                  style: GoogleFonts.montserrat(
                                      fontSize: 15, color: Colors.white),
                                ),
                              ),
                              Row(children: items),
                              Container(
                                // margin: EdgeInsets.only(left: 5),
                                child: Text(
                                  "(" + widget.votes.toString() + ")",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 10, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
                ))
          ],
        ),
      ),
    );
  }
}
