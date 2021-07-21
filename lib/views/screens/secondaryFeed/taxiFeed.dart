import 'package:flutter/material.dart';
import 'package:ceyntra_mobile/views/widgets/DisplayRatingWidget.dart';

class TaxiFeedScreen extends StatelessWidget {

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
                      'assets/images/3wheel1.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Mr.A.N.Perera',
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
                        style: DefaultTextStyle.of(context)
                            .style
                            .apply(color: Colors.white),
                        children: [
                          TextSpan(
                            text: 'per km',
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
                      'assets/images/van.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'R.B.Karunarathne',
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
                        style: DefaultTextStyle.of(context)
                            .style
                            .apply(color: Colors.white),
                        children: [
                          TextSpan(
                            text: 'per km',
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
                      'assets/images/van1.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Mr.L.M.Sumanasiri',
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
                        style: DefaultTextStyle.of(context)
                            .style
                            .apply(color: Colors.white),
                        children: [
                          TextSpan(
                            text: 'per km',
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
                      'assets/images/3wheel.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'J.P.Disanayaka',
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
                        style: DefaultTextStyle.of(context)
                            .style
                            .apply(color: Colors.white),
                        children: [
                          TextSpan(
                            text: 'per km',
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
                      'assets/images/car2.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Mr.M.Mohommad',
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
                        style: DefaultTextStyle.of(context)
                            .style
                            .apply(color: Colors.white),
                        children: [
                          TextSpan(
                            text: 'per km',
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