import 'package:flutter/material.dart';

class Dimensions {
  double? deviceWidth;
  double? deviceHeight;
  Size? deviceSize;

  Size getSize(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;

    return deviceSize!;
  }

  double getHeight(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    // var a = size / 100;
    // var newHeight = deviceHeight! * a;
    return deviceHeight!;
  }

  double getWidth(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    // var a = size / 100;
    // var newWidth = deviceWidth! * a;
    print(deviceWidth);
    return deviceWidth!;
  }
}
