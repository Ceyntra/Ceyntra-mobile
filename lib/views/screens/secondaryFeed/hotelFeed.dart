import 'package:flutter/material.dart';
import 'package:ceyntra_mobile/views/widgets/DisplayRatingWidget.dart';

class HotelFeedScreen extends StatefulWidget {
  @override
  _HotelFeedScreenState createState() => _HotelFeedScreenState();
}

class _HotelFeedScreenState extends State<HotelFeedScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20, left: 20),
          height: 100,
          decoration: BoxDecoration(
            color: Color(0xff2F3546),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/h1.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
          
              Container(
                padding: EdgeInsets.only(left: 10,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Marino Beach Hotel',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),

                    DisplayRatingWidget(
                      rating: 4.8,
                      votes: 4539,
                    ),
                    SizedBox(height: 10),

                    RichText(
                      text: TextSpan(
                        text: '\$13.48\ / ',
                        style: DefaultTextStyle.of(context).style.apply(color: Colors.white),
                        children: [
                          TextSpan(
                            text: 'per night',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        Container(
          margin: EdgeInsets.only(top: 20, left: 20),
          height: 100,
          decoration: BoxDecoration(
            color: Color(0xff2F3546),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/h2.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
          
              Container(
                padding: EdgeInsets.only(left: 10,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Heritance Kandalama',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),

                    DisplayRatingWidget(
                      rating: 4.9,
                      votes: 5539,
                    ),
                    SizedBox(height: 10),

                    RichText(
                      text: TextSpan(
                        text: '\$16.40\ / ',
                        style: DefaultTextStyle.of(context).style.apply(color: Colors.white),
                        children: [
                          TextSpan(
                            text: 'per night',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        Container(
          margin: EdgeInsets.only(top: 20, left: 20),
          height: 100,
          decoration: BoxDecoration(
            color: Color(0xff2F3546),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/h3.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
          
              Container(
                padding: EdgeInsets.only(left: 10,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Clove Villa',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),

                    DisplayRatingWidget(
                      rating: 4.0,
                      votes: 3629,
                    ),
                    SizedBox(height: 10),

                    RichText(
                      text: TextSpan(
                        text: '\$12.48\ / ',
                        style: DefaultTextStyle.of(context).style.apply(color: Colors.white),
                        children: [
                          TextSpan(
                            text: 'per night',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        Container(
          margin: EdgeInsets.only(top: 20, left: 20),
          height: 100,
          decoration: BoxDecoration(
            color: Color(0xff2F3546),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/h4.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
          
              Container(
                padding: EdgeInsets.only(left: 10,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Aryana Hotel',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),

                    DisplayRatingWidget(
                      rating: 4.2,
                      votes: 4125,
                    ),
                    SizedBox(height: 10),

                    RichText(
                      text: TextSpan(
                        text: '\$11.45\ / ',
                        style: DefaultTextStyle.of(context).style.apply(color: Colors.white),
                        children: [
                          TextSpan(
                            text: 'per night',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        Container(
          margin: EdgeInsets.only(top: 20, left: 20),
          height: 100,
          decoration: BoxDecoration(
            color: Color(0xff2F3546),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/h5.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
          
              Container(
                padding: EdgeInsets.only(left: 10,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Villa Nilaveli',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),

                    DisplayRatingWidget(
                      rating: 4.8,
                      votes: 4539,
                    ),
                    SizedBox(height: 10),

                    RichText(
                      text: TextSpan(
                        text: '\$13.48\ / ',
                        style: DefaultTextStyle.of(context).style.apply(color: Colors.white),
                        children: [
                          TextSpan(
                            text: 'per night',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
