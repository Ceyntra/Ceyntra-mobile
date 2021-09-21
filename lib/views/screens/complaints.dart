import 'dart:ui';

import 'package:ceyntra_mobile/service/PlaceService.dart';
import 'package:ceyntra_mobile/views/widgets/ComplainWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ComplaintPage extends StatefulWidget {
  //const ComplaintPage({Key? key}) : super(key: key);

  @override
  _ComplaintPageState createState() => _ComplaintPageState();
}

class _ComplaintPageState extends State<ComplaintPage> {
  PlaceService placeService = new PlaceService();
  var complaintList = [];
  @override
  void initState() {
    super.initState();
    placeService.getComplaint().then((value) {
      setState(() {
        complaintList = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2F3546),
      appBar: AppBar(
        title: Text(
          "Complaints",
          style: GoogleFonts.montserrat(fontSize: 18),
        ),
        backgroundColor: Color(0xff192537),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: complaintList.length != 0
              ? placeService.loadComplaints(complaintList)
              : [],
        ),
      ),
    );
  }
}
