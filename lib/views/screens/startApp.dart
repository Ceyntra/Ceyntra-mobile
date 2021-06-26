import 'package:flutter/material.dart';

class StartAppScreen extends StatelessWidget {
  void logIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 400,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/sa.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              new Positioned(
                top: -120,
                child: new Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    CustomPaint(
                      size: Size(360, (360 * 0.5555555555555556).toDouble()),
                      painter: TopDesign(),
                    ),
                    Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 60.0),
                          child: Text(
                            'Travel on your own',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              new Positioned(
                bottom: -120,
                child: new Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    CustomPaint(
                      size: Size(360, (360 * 0.5555555555555556).toDouble()),
                      painter: BottomDesign(),
                    ),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 30.0),
                        child:SizedBox(
                          width: 300.0,
                          height: 40.0,
                          child: ElevatedButton(
                            onPressed: logIn,
                            child: Text(
                              'Log In',
                              style: TextStyle(fontSize: 17),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xff2d9cdb),
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(15.0),
                              ),
                            ),
                          ),
                        ),
                        ),
                        new Positioned(
                          top: 90,
                          child: SizedBox(
                            width: 300.0,
                            height: 40.0,
                            child: ElevatedButton(
                              onPressed: logIn,
                              child: Text(
                                'Create account',
                                style: TextStyle(fontSize: 17),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                onPrimary: Colors.black,
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(15.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TopDesign extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Color(0xff031925)
      ..style = PaintingStyle.fill;

    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.7000000);
    path_0.quadraticBezierTo(size.width * 0.7944444, size.height * 0.6800000,
        size.width, size.height);
    path_0.quadraticBezierTo(
        size.width, size.height * 0.7500000, size.width, 0);
    path_0.lineTo(0, 0);
    path_0.lineTo(0, size.height * 0.7000000);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class BottomDesign extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Color(0xff031925)
      ..style = PaintingStyle.fill;

    Path path_0 = Path();
    path_0.moveTo(0, size.height);
    path_0.lineTo(size.width, size.height);
    path_0.quadraticBezierTo(
        size.width, size.height * 0.2500000, size.width, 0);
    path_0.cubicTo(
        size.width * 0.8166667,
        size.height * 0.3362500,
        size.width * 0.2305556,
        size.height * 0.4287500,
        0,
        size.height * 0.2450000);
    path_0.quadraticBezierTo(0, size.height * 0.4337500, 0, size.height);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
