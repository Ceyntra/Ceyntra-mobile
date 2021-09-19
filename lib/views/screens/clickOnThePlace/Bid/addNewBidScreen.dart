import 'package:ceyntra_mobile/models/placeModel.dart';
import 'package:ceyntra_mobile/service/BidService.dart';
import 'package:ceyntra_mobile/views/screens/clickOnThePlace/Bid/activeBid.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddNewBidScree extends StatefulWidget {
  // const AddNewBidScree({ Key? key }) : super(key: key);

  final bool enablePostButtonState;
  final Function changeEnablePostButtonState;
  final PlaceModel place;
  AddNewBidScree(
      {this.enablePostButtonState,
      this.changeEnablePostButtonState,
      this.place});

  @override
  _AddNewBidScreeState createState() => _AddNewBidScreeState();
}

class _AddNewBidScreeState extends State<AddNewBidScree> {
  int userId = 0;
  // @override
  // void initState() {
  //   super.initState();
  //   bidService.getUsertId().then((value) {
  //     setState(() {
  //       userId = value;
  //     });
  //   });

  //   bidService.getActiveBidDetailsForAddNewBid().then((value) {
  //     print("helloo");
  //     if (value == 1) {
  //       print("there is active bid");
  //       widget.changeEnablePostButtonState(false);
  //     } else {
  //       print("there is no active bid");
  //       widget.changeEnablePostButtonState(true);
  //     }
  //   });
  // }

  @override
  void initState() {
    super.initState();
    bidService.getUsertId().then((value) {
      setState(() {
        userId = value;
      });
    });

    bidService.getActiveBidDetailsForAddNewBid().then((value) {
      if (value == 1) {
        print("there is active bid");
        widget.changeEnablePostButtonState(false);
      } else {
        print("there is no active bid");
        widget.changeEnablePostButtonState(true);
      }
    });
  }

  // @override
  // void didUpdateWidget(covariant AddNewBidScree addNewBidScree) {
  //   super.didUpdateWidget(addNewBidScree);
  //   print("didUpdateWidget");
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   print("hellooo fuck");
  // }

//   @override
// void didUpdateWidget(ActiveBid oldWidget) {
//   super.didUpdateWidget();
//   if (widget.value != oldWidget.value) {
//     // TODO: start a transition between the previous and new value
//   }
// }

  TextEditingController pickUpTimeTEC = new TextEditingController();
  TextEditingController pickUpTEC = new TextEditingController();
  TextEditingController dropTEC = new TextEditingController();
  TextEditingController noOfPassengerTEC = new TextEditingController();
  TextEditingController priceTEC = new TextEditingController();
  TextEditingController travellerNoteTEC = new TextEditingController();

  BidService bidService = new BidService();

  void popUpDialog(BuildContext context, String title, String content) {
    var alert = AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Ok")),
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff031925),
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 20, bottom: 10),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    margin: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Pick Up Date and time",
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width / 100) * 90,
                    child: TextField(
                      controller: pickUpTimeTEC,
                      maxLines: 1,
                      style: GoogleFonts.montserrat(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          // prefixIcon: Icon(
                          //   Icons.comment,
                          //   color: Colors.green,
                          // ),
                          contentPadding: EdgeInsets.all(10),
                          // isDense: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          hintText: 'Pick up date and time',
                          hintStyle: GoogleFonts.montserrat(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    margin: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Pick Up Address",
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width / 100) * 90,
                    child: TextField(
                      controller: pickUpTEC,
                      maxLines: 1,
                      style: GoogleFonts.montserrat(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          // prefixIcon: Icon(
                          //   Icons.comment,
                          //   color: Colors.green,
                          // ),
                          contentPadding: EdgeInsets.all(10),
                          // isDense: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          hintText: 'Pick up address',
                          hintStyle: GoogleFonts.montserrat(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    margin: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Drop Address",
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width / 100) * 90,
                    child: TextField(
                      controller: dropTEC,
                      maxLines: 1,
                      style: GoogleFonts.montserrat(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          // prefixIcon: Icon(
                          //   Icons.comment,
                          //   color: Colors.green,
                          // ),
                          contentPadding: EdgeInsets.all(10),
                          // isDense: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          hintText: 'Drop Address',
                          hintStyle: GoogleFonts.montserrat(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    margin: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "No. of passengers",
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width / 100) * 90,
                    child: TextField(
                      controller: noOfPassengerTEC,
                      maxLines: 1,
                      style: GoogleFonts.montserrat(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          // prefixIcon: Icon(
                          //   Icons.comment,
                          //   color: Colors.green,
                          // ),
                          contentPadding: EdgeInsets.all(10),
                          // isDense: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          hintText: 'No. of passengers',
                          hintStyle: GoogleFonts.montserrat(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    margin: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Your price",
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width / 100) * 90,
                    child: TextField(
                      controller: priceTEC,
                      maxLines: 1,
                      style: GoogleFonts.montserrat(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          // prefixIcon: Icon(
                          //   Icons.comment,
                          //   color: Colors.green,
                          // ),
                          contentPadding: EdgeInsets.all(10),
                          // isDense: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          hintText: 'Your price',
                          hintStyle: GoogleFonts.montserrat(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    margin: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Traveller note",
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width / 100) * 90,
                    child: TextField(
                      controller: travellerNoteTEC,
                      maxLines: 5,
                      style: GoogleFonts.montserrat(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          // prefixIcon: Icon(
                          //   Icons.comment,
                          //   color: Colors.green,
                          // ),
                          contentPadding: EdgeInsets.all(10),
                          // isDense: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          hintText: 'Pick up address',
                          hintStyle: GoogleFonts.montserrat(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 50,
              margin: EdgeInsets.only(top: 10, bottom: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary:
                      widget.enablePostButtonState ? Colors.green : Colors.grey,
                ),
                onPressed: widget.enablePostButtonState
                    ? () {
                        if (pickUpTimeTEC.text.isNotEmpty &&
                            pickUpTEC.text.isNotEmpty &&
                            dropTEC.text.isNotEmpty &&
                            noOfPassengerTEC.text.isNotEmpty &&
                            priceTEC.text.isNotEmpty &&
                            travellerNoteTEC.text.isNotEmpty) {
                          bidService
                              .addBidDetails(
                                  widget.place.latitude,
                                  widget.place.longitude,
                                  pickUpTimeTEC.text,
                                  pickUpTEC.text,
                                  dropTEC.text,
                                  noOfPassengerTEC.text,
                                  priceTEC.text,
                                  travellerNoteTEC.text,
                                  userId)
                              .then((value) {
                            if (value == 1) {
                              popUpDialog(context, "Bid is active now",
                                  "Your bid is send to the all dirvers in the area");
                              pickUpTimeTEC.text = "";
                              pickUpTEC.text = "";
                              dropTEC.text = "";
                              noOfPassengerTEC.text = "";
                              priceTEC.text = "";
                              travellerNoteTEC.text = "";
                              widget.changeEnablePostButtonState(false);
                            }
                          });
                          // var isDone = taxiDriverService.addReview(comment.text,
                          //     myRating, widget.clickedTaxiInfo["taxiId"], userId);
                          // isDone.then((value) => {
                          //       if (value == 1)
                          //         {
                          //           comment.clear(),
                          //           taxiDriverService.loadAllReviewsAndScreenData(
                          //               setPageData,
                          //               userId,
                          //               widget.clickedTaxiInfo["taxiId"])
                          //         }
                          //     });

                        } else {
                          // pickUpTEC.text = "";
                          popUpDialog(context, "All fields should filled",
                              "there is some fields, not filled");
                        }
                      }
                    : () {
                        print("button is disabled");
                        popUpDialog(context, "Button is disabled",
                            "You have an active Bid");
                      },
                child: Text(
                  "Post",
                  style: GoogleFonts.montserrat(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
