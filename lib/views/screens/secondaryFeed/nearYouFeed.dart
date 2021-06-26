import 'package:ceyntra_mobile/views/widgets/feedPlaceWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NearYouFeedScreen extends StatefulWidget {
  final ValueChanged<String> changeMainFeedStateState;
  NearYouFeedScreen({this.changeMainFeedStateState});
  @override
  _NearYouFeedScreenState createState() => _NearYouFeedScreenState();
}

class _NearYouFeedScreenState extends State<NearYouFeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Stack(
            children: [
              Container(
                height: 250,
                child: Image(
                  image: AssetImage("assets/images/sigiriya.jpg"),
                  fit: BoxFit.fitHeight,
                ),
              ),
              Container(
                color: Colors.black.withOpacity(0.3),
                width: double.infinity,
                height: 250,
              ),
              Positioned(
                height: 40,
                width: (MediaQuery.of(context).size.width / 100) * 80,
                top: 10,
                right: 0,
                child: Container(
                  child: TextField(
                    style: GoogleFonts.itim(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.green,
                        ),
                        contentPadding: EdgeInsets.only(
                            left: 2, top: 2, bottom: 2, right: 20),
                        // isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomLeft: Radius.circular(30)),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        hintText: 'Where are you going?',
                        hintStyle: GoogleFonts.montserrat(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
              ),
              Positioned(
                  top: 80,
                  left: 20,
                  height: 180,
                  width: (MediaQuery.of(context).size.width / 100) * 70,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sigiriya",
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "The natural setting is stunning with a rich architectural and historical heritage",
                          style: GoogleFonts.montserrat(
                            color: Colors.white.withOpacity(0.4),
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  )),
              Positioned(
                  bottom: 20,
                  left: 20,
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Text(
                            "4.9",
                            style: GoogleFonts.montserrat(
                                fontSize: 15, color: Colors.white),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          child: Icon(
                            Icons.star,
                            color: Colors.amber[300],
                            size: 16,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          child: Icon(
                            Icons.star,
                            color: Colors.amber[300],
                            size: 16,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          child: Icon(
                            Icons.star,
                            color: Colors.amber[300],
                            size: 16,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          child: Icon(
                            Icons.star,
                            color: Colors.amber[300],
                            size: 16,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          child: Icon(
                            Icons.star,
                            color: Colors.amber[300],
                            size: 16,
                          ),
                        ),
                        Container(
                          // margin: EdgeInsets.only(left: 5),
                          child: Text(
                            "(4782)",
                            style: GoogleFonts.montserrat(
                                fontSize: 10, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Text(
              "Nearest Destinations",
              style: GoogleFonts.montserrat(fontSize: 15, color: Colors.white),
            ),
            decoration: BoxDecoration(
                color: Colors.green[800],
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
          ),
        ),
        FeedPlaceWidget(
          imagePath: "assets/images/polo.jpg",
          placeName: "Polonnaruwa",
          votes: 2429,
          rating: 4.5,
          changeMainFeedStateState: widget.changeMainFeedStateState,
        ),
        FeedPlaceWidget(
          imagePath: "assets/images/dambulla.jpg",
          placeName: "Dambulla cave temple",
          votes: 1356,
          rating: 4.3,
          changeMainFeedStateState: widget.changeMainFeedStateState,
        ),
        SizedBox(
          height: 60,
        ),
      ],
    );
  }
}
