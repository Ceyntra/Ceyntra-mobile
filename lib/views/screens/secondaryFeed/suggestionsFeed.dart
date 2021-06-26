import 'package:flutter/material.dart';

class SuggestionsFeedScreen extends StatefulWidget {
  @override
  _SuggestionsFeedScreenState createState() => _SuggestionsFeedScreenState();
}

class _SuggestionsFeedScreenState extends State<SuggestionsFeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: 100,
      height: 100,
      color: Colors.greenAccent,
    );
  }
}
