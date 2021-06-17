import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NearMeFeedScreen extends StatefulWidget {
  @override
  _NearMeFeedScreenState createState() => _NearMeFeedScreenState();
}

class _NearMeFeedScreenState extends State<NearMeFeedScreen> {
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
                        )
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

        // Image(image: AssetImage('assets/images/polo.jpg'))
        Container(
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
                          image: AssetImage('assets/images/polo.jpg'),
                          fit: BoxFit.fitWidth)),
                ),
                Positioned(
                    height: 40,
                    bottom: 10,
                    left: 20,
                    right: 20,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(10)),
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 20,
                      child: Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              child: Text(
                            "Polonnaruwa",
                            style: GoogleFonts.montserrat(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          )),
                          Container(
                            child: Row(
                              children: [
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
                                )
                              ],
                            ),
                          )
                        ],
                      )),
                    ))
              ],
            ),
          ),
        ),
        // ksdhfkj
        Container(
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
                          image: AssetImage('assets/images/dambulla.jpg'),
                          fit: BoxFit.fitWidth)),
                ),
                Positioned(
                    height: 40,
                    bottom: 10,
                    left: 20,
                    right: 20,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(10)),
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 20,
                      child: Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              child: Text(
                            "Dambulla cave Temple",
                            style: GoogleFonts.montserrat(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          )),
                          Container(
                            child: Row(
                              children: [
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
                                )
                              ],
                            ),
                          )
                        ],
                      )),
                    ))
              ],
            ),
          ),
        ),
        SizedBox(
          height: 600,
        ),
        Text("blaaaaaa")
      ],
    );
  }
}
