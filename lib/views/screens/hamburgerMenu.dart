import 'package:flutter/material.dart';

class HamburgerMenu extends StatefulWidget {
  // const HamburgerMenu({ Key? key }) : super(key: key);

  @override
  _HamburgerMenuState createState() => _HamburgerMenuState();
}

class _HamburgerMenuState extends State<HamburgerMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      color: Colors.amberAccent,
    );
  }
}
