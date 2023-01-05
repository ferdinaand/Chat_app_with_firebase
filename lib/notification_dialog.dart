// ignore_for_file: non_constant_identifier_names, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:BUswift/Assistant/AssistantMethods.dart';
import 'package:BUswift/Models/rideDetails.dart';
import 'package:BUswift/constants.dart';
import 'package:BUswift/main.dart';
import 'package:BUswift/screens/client_screens/LoginScreen.dart';
import 'package:BUswift/screens/client_screens/map_screen.dart';
import 'package:BUswift/screens/driver_screens/LoginScreen.dart';
import 'package:BUswift/screens/driver_screens/NewRideScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class NotificationDialog extends StatelessWidget {
  final rideDetails RideDetails;

  NotificationDialog({required this.RideDetails});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      backgroundColor: Colors.transparent,
      elevation: 1.0,
      child: Container(
        margin: EdgeInsets.all(5.0),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(25.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade900,
                  offset: Offset(4, 4),
                  blurRadius: 15,
                  spreadRadius: 1.5),
              BoxShadow(
                  color: Colors.grey.shade900,
                  offset: Offset(-5, -5),
                  blurRadius: 15,
                  spreadRadius: 1)
            ]),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 20,
            ),
            Lottie.asset(
              'assets/Icon/alarm-line2.json',
              width: 120,
              height: 120,
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              'New Ride Request',
              style: GoogleFonts.breeSerif(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                  color: Colors.white),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.only(top: 12.0, left: 18, right: 18),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/Icon/user_location_.png',
                        width: 20.0,
                        height: 20.0,
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Expanded(
                        child: Container(
                          child: Text(
                            RideDetails.pickup_address.toString(),
                            style: GoogleFonts.dosis(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/Icon/map_pin_.png',
                        width: 20.0,
                        height: 20.0,
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Expanded(
                        child: Container(
                          child: Text(
                            RideDetails.dropoff_address.toString(),
                            style: GoogleFonts.dosis(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
            divider(),
            SizedBox(height: 8),
            Padding(
              padding:
                  EdgeInsets.only(left: 20.0, bottom: 20, right: 20, top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(18))),
                      onPressed: () {
                        assetAudioPlayer.stop();
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cancel',
                        style: GoogleFonts.breeSerif(
                            fontSize: 14, color: Colors.white),
                      )),
                  SizedBox(
                    width: 10.0,
                  ),
                  TextButton(
                      style: OutlinedButton.styleFrom(
                          elevation: 3.0,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.green),
                              borderRadius: BorderRadius.circular(18))),
                      onPressed: () {
                        assetAudioPlayer.stop();
                        checkAvailabilityOfRide(context);
                      },
                      child: Text(
                        'Accept',
                        style: GoogleFonts.breeSerif(
                            fontSize: 14, color: Colors.white),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void checkAvailabilityOfRide(context) {
    rideRequestRef.once().then((event) {
      Navigator.pop(context);
      final snap = event.snapshot;

      String rideId = '';
      // Map<dynamic, dynamic> map = snap.value! as Map<dynamic, dynamic>;

      if (snap.value != null) {
        rideId = snap.value.toString();
      } else {
        ToastMessage(
            'ride no longer exists', context, Colors.red, Colors.black);
      }

      if (rideId == RideDetails.ride_request_id) {
        rideRequestRef.set('Accepted');
        assistandMethods.disableDriverMapLiveLocationUpdates();
        Navigator.push(context, CupertinoPageRoute(builder: (context) {
          return NewRideScreen(
            RideDetails: RideDetails,
          );
        }));
      } else if (rideId == "cancelled") {
        ToastMessage(
            'ride has been cancelled', context, Colors.red, Colors.black);
      } else if (rideId == " timeout") {
        ToastMessage(
            'ride request has timed out', context, Colors.red, Colors.black);
      } else {
        ToastMessage("ride does not exists", context, Colors.red, Colors.black);
      }
    });
  }
}

class divider extends StatefulWidget {
  const divider({
    Key? key,
  }) : super(key: key);

  @override
  State<divider> createState() => _dividerState();
}

class _dividerState extends State<divider> {
  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 2.0,
      color: Colors.white30,
    );
  }
}
