import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class LineBarIndicatorWidget extends  StatelessWidget {
  final double percentage;

  LineBarIndicatorWidget(this.percentage);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: LinearPercentIndicator(
                width: MediaQuery.of(context).size.width - 150,
                animation: true,
                lineHeight: 10.0,
                animationDuration: 2500,
                percent: percentage,
                //center: Text("80.0%"),
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.blue,
              ),
      );
      
  }
}