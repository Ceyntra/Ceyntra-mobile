import 'package:flutter/material.dart';

class PopularFeedScreen extends StatefulWidget {
  @override
  _PopularFeedScreenState createState() => _PopularFeedScreenState();
}

class _PopularFeedScreenState extends State<PopularFeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: 100,
      height: 100,
      color: Colors.redAccent,
    );
  }
}
