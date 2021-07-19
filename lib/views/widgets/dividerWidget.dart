import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Divider(
        color: Colors.white.withOpacity(0.5),
        thickness: 1,
      ),
    );
  }
}