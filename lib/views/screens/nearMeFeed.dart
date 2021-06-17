import 'package:flutter/material.dart';

class NearMeFeedScreen extends StatefulWidget {
  @override
  _NearMeFeedScreenState createState() => _NearMeFeedScreenState();
}

class _NearMeFeedScreenState extends State<NearMeFeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: 100,
      height: 100,
      color: Colors.blueAccent,
    );
  }
}
