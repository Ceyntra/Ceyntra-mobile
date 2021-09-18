import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

class ProfileDetailsWidget extends StatelessWidget {

  final String label;
  final String labelValue;

  ProfileDetailsWidget(this.label, this.labelValue);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.montserrat(
                color: Colors.white.withOpacity(0.6),
              ),
            ),
            flex: 2,
          ),
          Expanded(
            // child: Text(
            //   labelValue,
            //   textAlign: TextAlign.right,
            //   style: GoogleFonts.montserrat(
            //     color: Colors.white,
            //   ),
            // ),
            child: ReadMoreText(
              labelValue,
              trimLines: 1,
              colorClickableText: Colors.pink[100],
              trimMode: TrimMode.Line,
              trimCollapsedText: 'Show more',
              trimExpandedText: 'Show less',
              textAlign: TextAlign.right,
              style: GoogleFonts.montserrat(
                color: Colors.white,
              ),
            ),
            flex: 4,
          ),
        ],
      ),
    );
  }
}