import 'package:carousel_pro/carousel_pro.dart';
import 'package:ceyntra_mobile/models/placeModel.dart';
import 'package:ceyntra_mobile/service/PlaceService.dart';
import 'package:firebase_storage/firebase_storage.dart';
// import 'package:geolocator/geolocator.dart';

import 'package:ceyntra_mobile/views/widgets/DisplayRatingWidget.dart';
import 'package:ceyntra_mobile/views/widgets/feedPlaceWidget.dart';
import 'package:ceyntra_mobile/views/widgets/greenTagWidget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdownfield/dropdownfield.dart';

class NearYouFeedScreen extends StatefulWidget {
  final ValueChanged<String> changeMainFeedStateState;
  final ValueChanged<PlaceModel> setClickedPlace;
  final Function setNullClickedOnThePlaceState;
  NearYouFeedScreen(
      {this.changeMainFeedStateState,
      this.setClickedPlace,
      this.setNullClickedOnThePlaceState});
  @override
  _NearYouFeedScreenState createState() => _NearYouFeedScreenState();
}

class _NearYouFeedScreenState extends State<NearYouFeedScreen> {
  PlaceService placeService = new PlaceService();
  var placeList;
  var topPlacePhotos = [];
  List<String> cities = [];

  void setPlaceList(res) {
    setState(() {
      placeList = res;
    });
  }

  void setPlacePhotos(res) {
    setState(() {
      topPlacePhotos = res;
    });
  }

  @override
  void initState() {
    super.initState();
    placeService.loadAllPlaces(setPlaceList, setPlacePhotos);
    placeService.loadPlaceListForSearchDropDown().then((value) {
      cities = List<String>.from(value);
    });
    // loadAllPlaces();
  }

  final citiesSelected = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print(cities);
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Stack(
            children: [
              Container(
                height: 250,
                child: topPlacePhotos.length != 0
                    ? Carousel(
                        dotSize: 6.0,
                        boxFit: BoxFit.cover,
                        dotBgColor: Colors.transparent,
                        indicatorBgPadding: 8,
                        dotPosition: DotPosition.bottomRight,
                        images: [
                          NetworkImage(topPlacePhotos[1]),
                          NetworkImage(topPlacePhotos[0]),
                          NetworkImage(topPlacePhotos[2])
                        ],
                      )
                    : Carousel(
                        dotSize: 6.0,
                        boxFit: BoxFit.cover,
                        dotBgColor: Colors.transparent,
                        indicatorBgPadding: 8,
                        dotPosition: DotPosition.bottomRight,
                        images: [
                          AssetImage("assets/images/notFound.jpg"),
                          AssetImage("assets/images/notFound.jpg"),
                          AssetImage("assets/images/notFound.jpg")
                        ],
                      ),
              ),
              Container(
                color: Colors.black.withOpacity(0.3),
                width: double.infinity,
                height: 250,
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
                          placeList != null
                              ? placeList[0]['place_name']
                              : "loading...",
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          placeList != null
                              ? placeList[0]["description"]
                              : "loading...",
                          style: GoogleFonts.montserrat(
                            color: Colors.white.withOpacity(0.4),
                            fontSize: 15,
                          ),
                          maxLines: 3,
                        ),
                      ],
                    ),
                  )),
              Positioned(
                  bottom: 20,
                  left: 20,
                  child: Container(
                    child: DisplayRatingWidget(
                      rating: placeList != null
                          ? double.parse(
                              placeList[0]["rating"].toStringAsFixed(1))
                          : 0,
                      votes: placeList != null
                          ? placeList[0]["number_of_votes"]
                          : 0,
                    ),
                  )),
              Positioned(
                // height: 40,
                width: (MediaQuery.of(context).size.width / 100) * 80,
                top: 10,
                right: 0,
                child: Container(
                  // child: TextField(
                  //   style: GoogleFonts.itim(
                  //       fontSize: 15,
                  //       fontWeight: FontWeight.w700,
                  //       color: Colors.white),
                  //   decoration: InputDecoration(
                  //       filled: true,
                  //       fillColor: Colors.white,
                  //       prefixIcon: Icon(
                  //         Icons.search,
                  //         color: Colors.green,
                  //       ),
                  //       contentPadding: EdgeInsets.only(
                  //           left: 2, top: 2, bottom: 2, right: 20),
                  //       // isDense: true,
                  //       border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.only(
                  //             topLeft: Radius.circular(30),
                  //             bottomLeft: Radius.circular(30)),
                  //         borderSide: BorderSide(
                  //           width: 0,
                  //           style: BorderStyle.none,
                  //         ),
                  //       ),
                  //       hintText: 'Where are you going?',
                  //       hintStyle: GoogleFonts.montserrat(
                  //           color: Colors.grey,
                  //           fontSize: 15,
                  //           fontWeight: FontWeight.w500)),
                  // ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomLeft: Radius.circular(30)),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: DropDownField(
                        controller: citiesSelected,
                        hintText: "Search here",
                        enabled: true,
                        strict: false,
                        items: cities,
                        itemsVisibleInDropdown: 4,
                        onValueChanged: (value) {
                          print(value);
                          placeService
                              .getPlaceByPlaceName(value)
                              .then((value1) {
                            widget.setNullClickedOnThePlaceState();
                            widget.setClickedPlace(PlaceModel(
                                placeId: value1["place_id"],
                                description: value1["description"],
                                latitude: value1["latitude"],
                                longitude: value1["longitude"],
                                numberOfVotes: value1["number_of_votes"],
                                photo: value1["photo"],
                                placeName: value1["place_name"],
                                rating: value1["rating"]));
                            widget.changeMainFeedStateState("clickOnThePlace");
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: GreenTagWidget(
            title: "Nearest Destinations",
          ),
        ),
        Column(
          children: placeList != null
              ? placeService.loadNearMePlaces(
                  context,
                  placeList,
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
        ),
        SizedBox(
          height: 60,
        ),
      ],
    );
  }
}
