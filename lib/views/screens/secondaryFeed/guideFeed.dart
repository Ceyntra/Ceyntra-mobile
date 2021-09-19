import 'package:ceyntra_mobile/models/placeModel.dart';
import 'package:ceyntra_mobile/service/GuideService.dart';
import 'package:flutter/material.dart';
import 'package:ceyntra_mobile/views/widgets/DisplayRatingWidget.dart';

class GuideFeedScreen extends StatefulWidget {
  final ValueChanged<String> changeMainFeedStateState;
  final Function setClickedGuide;
  final PlaceModel place;
  GuideFeedScreen(
      {this.place, this.changeMainFeedStateState, this.setClickedGuide});

  @override
  _GuideFeedScreenState createState() => _GuideFeedScreenState();
}

class _GuideFeedScreenState extends State<GuideFeedScreen> {
  GuideService guideService = GuideService();
  var guideList;
  void setGuideList(res) {
    print(res);
    setState(() {
      guideList = res;
    });
  }

  @override
  void initState() {
    super.initState();
    guideService.loadAllGuides(
        widget.place.latitude, widget.place.longitude, setGuideList);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: guideList != null
          ? guideService.loadGuideWidgets(context, guideList,
              widget.setClickedGuide, widget.changeMainFeedStateState)
          : [
              Container(
                // color: Colors.green,
                width: 100,
                height: 250,
                child: Container(
                    alignment: Alignment.center,
                    width: 60,
                    height: 60,
                    // color: Colors.red,
                    child: CircularProgressIndicator()),
              )
            ],
    );
  }
}
