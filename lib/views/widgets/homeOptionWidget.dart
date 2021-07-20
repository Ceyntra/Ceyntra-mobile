import 'package:flutter/material.dart';

class HomeOptionWidget extends StatelessWidget {

  final Color optionColor;
  final String option;
  final IconData iconOption;
  final Function functionName;

  HomeOptionWidget(this.optionColor, this.option, this.iconOption, this.functionName);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 80,
        child: ElevatedButton(
          onPressed: functionName,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Ink(
                    padding: EdgeInsets.all(5),
                    decoration: ShapeDecoration(
                      color: optionColor.withOpacity(0.3),
                      shape: CircleBorder(),
                    ),
                    child: Icon(
                      iconOption,
                      color: optionColor,
                      size: 20,
                    ),
                  ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                    option,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  )
              )
            ],
          ),

          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }
}