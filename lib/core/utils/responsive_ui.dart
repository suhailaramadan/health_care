import 'package:flutter/material.dart';

class ResponsiveUi {
  static DeviceType getDeviceType(MediaQueryData mediaQueryData) {
    Orientation orientation = mediaQueryData.orientation;
    double width = 0;
    if (orientation == Orientation.landscape) {
      width = mediaQueryData.size.height;
    } else {
      width = mediaQueryData.size.width;
    }
    if (width >= 950) {
      return DeviceType.desktop;
    } else if (width >= 600) {
      return DeviceType.Tablet;
    }
    return DeviceType.Mobile;
  }
}

enum DeviceType {
  Mobile,
  Tablet,
  desktop,
}
