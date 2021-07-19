import 'package:flutter/material.dart';

class ProfileDetailsWidget extends StatelessWidget {

  final String label;
  final String labelValue;

  ProfileDetailsWidget(this.label, this.labelValue);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
              ),
            ),
            flex: 2,
          ),
          Expanded(
            child: Text(
              labelValue,
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            flex: 4,
          ),
        ],
      ),
    );
  }
}