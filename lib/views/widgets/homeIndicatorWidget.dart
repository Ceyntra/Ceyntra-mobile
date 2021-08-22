import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomeIIndicatorWidget extends StatelessWidget {
  final String offerCount;
  final double percentage;
  final String footerName;
  final Color bgColor;
  final Color progressColor;

  HomeIIndicatorWidget(this.offerCount, this.percentage, this.footerName,
      this.bgColor, this.progressColor);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CircularPercentIndicator(
        radius: 120.0,
        lineWidth: 5.0,
        animation: true,
        percent: percentage,
        center: Text(
          offerCount,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        footer: Container(
          margin: EdgeInsets.only(top: 20),
          child: Text(
            footerName,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        circularStrokeCap: CircularStrokeCap.round,
        backgroundColor: bgColor,
        progressColor: progressColor,
      ),
      flex: 1,
    );
  }
}
