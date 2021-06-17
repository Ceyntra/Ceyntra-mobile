import 'package:ceyntra_mobile/views/screens/feed.dart';
import 'package:ceyntra_mobile/views/screens/mainFeed.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MainFeedScreen(),
    );
  }
}
