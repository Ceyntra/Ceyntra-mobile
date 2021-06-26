// import 'package:ceyntra_mobile/views/screens/clickOnPlace/placeFeed.dart';
// import 'package:flutter/material.dart';

// import '../secondaryFeed/secondaryFeed.dart';

// class PlaceMainFeedScreen extends StatefulWidget {
//   // const PlaceMainFeedScreen({ Key? key }) : super(key: key);

//   @override
//   _PlaceMainFeedScreenState createState() => _PlaceMainFeedScreenState();
// }

// class _PlaceMainFeedScreenState extends State<PlaceMainFeedScreen> {
//   String mainFeedState = 'place';

//   Widget mainFeed(BuildContext context) {
//     if (mainFeedState == "explore")
//       return SecondaryFeedScreen();
//     else if (mainFeedState == "place") return PlaceFeedScreen();
//     // else if (mainFeedState == "global")
//     //   return PopularFeedScreen();
//     // else if (mainFeedState == "profile") return SuggestionsFeedScreen();
//     return null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: mainFeed(context),
//       backgroundColor: Color(0xff192537),
//       bottomNavigationBar: Container(
//         color: Color(0xff192537),
//         padding: EdgeInsets.all(10),
//         height: 60,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     mainFeedState = "explore";
//                   });
//                 },
//                 child: Container(
//                     padding: EdgeInsets.symmetric(horizontal: 10),

//                     // color: Colors.amberAccent,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.explore,
//                           color: mainFeedState == "explore"
//                               ? Colors.green[400]
//                               : Colors.white,
//                         ),
//                         SizedBox(
//                           height: 2,
//                         ),
//                         Text(
//                           "Explore",
//                           style: TextStyle(fontSize: 12, color: Colors.white),
//                         ),
//                       ],
//                     ))),
//             GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     mainFeedState = "global";
//                   });
//                 },
//                 child: Container(
//                     padding: EdgeInsets.symmetric(horizontal: 10),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.chat,
//                           color: mainFeedState == "global"
//                               ? Colors.green[400]
//                               : Colors.white,
//                         ),
//                         SizedBox(
//                           height: 2,
//                         ),
//                         Text(
//                           "Ceyntra Chat",
//                           style: TextStyle(fontSize: 12, color: Colors.white),
//                         ),
//                       ],
//                     ))),
//             GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     mainFeedState = "profile";
//                   });
//                 },
//                 child: Container(
//                     padding: EdgeInsets.symmetric(horizontal: 10),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.person,
//                           color: mainFeedState == "profile"
//                               ? Colors.green[400]
//                               : Colors.white,
//                         ),
//                         SizedBox(
//                           height: 2,
//                         ),
//                         Text(
//                           "Profile",
//                           style: TextStyle(fontSize: 12, color: Colors.white),
//                         ),
//                       ],
//                     ))),
//           ],
//         ),
//       ),
//     );
//   }
// }
