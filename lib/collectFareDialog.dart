// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:BUswift/Assistant/AssistantMethods.dart';
import 'package:BUswift/screens/client_screens/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CollectRideCharge extends StatelessWidget {
  final String? paymentMethod;
  final int? fareAmount;

  const CollectRideCharge({super.key, this.paymentMethod, this.fareAmount});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      backgroundColor: Colors.transparent,
      child: Container(
        margin: EdgeInsets.all(5.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 16,
            ),
            Text('Trip fare',
                style: GoogleFonts.josefinSans(fontWeight: FontWeight.w700)),
            SizedBox(
              height: 15,
            ),
            Divider(
              thickness: 5.0,
              color: Colors.black,
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              '₦ $fareAmount',
              style: GoogleFonts.josefinSans(
                  fontSize: 55, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'this is your total ride charge to collect ',
                style: GoogleFonts.josefinSans(fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
                onPressed: () async {
                  Navigator.pop(context);
                  Navigator.pop(context);

                  assistandMethods.enaableDriverMapLiveLocationUpdates();
                },
                icon: Icon(
                  FontAwesomeIcons.car,
                  color: Colors.black,
                ),
                label: Text(
                  "recieive payment",
                  style: TextStyle(color: Colors.black),
                )),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
