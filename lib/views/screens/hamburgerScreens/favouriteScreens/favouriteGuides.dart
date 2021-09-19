import 'package:ceyntra_mobile/service/GuideService.dart';
import 'package:flutter/material.dart';
import 'package:ceyntra_mobile/views/widgets/DisplayRatingWidget.dart';

class FavouriteGuidesScreen extends StatefulWidget {
  final ValueChanged<String> changeMainFeedStateState;
  final Function setClickedGuide;
  final Function setHamburgerStateNull;
  FavouriteGuidesScreen(
      {this.setHamburgerStateNull,
      this.changeMainFeedStateState,
      this.setClickedGuide});

  @override
  _FavouriteGuidesScreenState createState() => _FavouriteGuidesScreenState();
}

class _FavouriteGuidesScreenState extends State<FavouriteGuidesScreen> {
  GuideService guideService = GuideService();
  var guideList = [];

  @override
  void initState() {
    super.initState();
    guideService.loadFavGuides().then((value) {
      setState(() {
        guideList = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: guideList.length != 0
          ? guideService.loadFavGuideWidgets(
              widget.setHamburgerStateNull,
              context,
              guideList,
              widget.setClickedGuide,
              widget.changeMainFeedStateState)
          : [],
    );
  }
}
