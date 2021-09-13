import 'package:ceyntra_mobile/views/widgets/BidResponseWidget.dart';
import 'package:ceyntra_mobile/views/widgets/greenTagWidget.dart';
import 'package:ceyntra_mobile/views/widgets/reviewWidget.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActiveBid extends StatefulWidget {
  // const ActiveBid({ Key? key }) : super(key: key);

  @override
  _ActiveBidState createState() => _ActiveBidState();
}

class _ActiveBidState extends State<ActiveBid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff031925),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // margin: EdgeInsets.only(top: 20),
                alignment: Alignment.center,
                // color: Colors.redAccent,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    GreenTagWidget(
                      title: "Active Bid Details",
                    ),
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.blueAccent, width: 1),
                              color: Colors.black.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(15)),
                          width: MediaQuery.of(context).size.width * 0.9,
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              BidDetailsItem(
                                title: "* Date",
                                details: "2013-06-24",
                              ),
                              BidDetailsItem(
                                title: "* Pick Up address",
                                details: "Kurunegala, Maraluwawa",
                              ),
                              BidDetailsItem(
                                title: "* Drop address",
                                details: "Kurunegala, Wellawa",
                              ),
                              BidDetailsItem(
                                title: "* No. of passengers",
                                details: "10",
                              ),
                              BidDetailsItem(
                                title: "* Your price",
                                details: "Rs. 1876",
                              ),
                              BidDetailsItem(
                                lastElement: true,
                                title: "* Traveller note",
                                details:
                                    "I want to go here and there and it was beatiful and like that. blaa when i see you , in my heart fallen for you",
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                            top: 20,
                            right: 20,
                            child: Container(
                              width: 80,
                              height: 40,
                              // margin: EdgeInsets.only(top: 20),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.redAccent,
                                ),
                                onPressed: () {},
                                child: Text(
                                  "Close",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ))
                      ],
                    ),
                    GreenTagWidget(
                      title: "Response for Bid",
                    ),
                    BidResponseWidget(
                      comment:
                          "helloo i like your offer, you can contact me here if you can , that is the best service so far, when i addict to to it it would be marvolus",
                      date: "2013-04-05",
                      firstName: "Shehan",
                      rating: 4.6,
                      secondeName: "Sandeepa",
                    ),
                    BidResponseWidget(
                      comment:
                          "helloo i like your offer, you can contact me here if you can , that is the best service so far, when i addict to to it it would be marvolus",
                      date: "2013-04-05",
                      firstName: "Shehan",
                      rating: 4.6,
                      secondeName: "Sandeepa",
                    ),
                    BidResponseWidget(
                      comment:
                          "helloo i like your offer, you can contact me here if you can , that is the best service so far, when i addict to to it it would be marvolus",
                      date: "2013-04-05",
                      firstName: "Shehan",
                      rating: 4.6,
                      secondeName: "Sandeepa",
                    ),
                    SizedBox(
                      height: 200,
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class BidDetailsItem extends StatelessWidget {
  // const BidDetailsItem({ Key? key }) : super(key: key);
  final String title;
  final String details;
  final bool lastElement;

  BidDetailsItem({this.details, this.title, this.lastElement = false});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: lastElement
            ? EdgeInsets.only(bottom: 0)
            : EdgeInsets.only(bottom: 20),
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 2),
              child: Text(title,
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white.withOpacity(0.9),
                  )),
            ),
            Container(
                child: ExpandableText(
              details,
              expandText: 'Read more',
              collapseText: 'show less',
              maxLines: 3,
              linkColor: Colors.blue[900],
              style: GoogleFonts.montserrat(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ))
          ],
        ));
  }
}
