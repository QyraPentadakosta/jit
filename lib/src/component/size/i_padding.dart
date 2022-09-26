import 'package:flutter/cupertino.dart';

class IPadding {
  static const double base = 10;
  static const double p0 = base / 2;
  static const double p1 = base;
  static const double p2 = base * 2;
  static const double p3 = base * 3;
  static const double p4 = base * 4;
  static const double p5 = base * 5;
  static const double p6 = base * 6;
  static const double p7 = base * 7;
  static const double p8 = base * 8;
  static const double p9 = base * 9;
  static const double p10 = base * 10;

  double paddingBottom(BuildContext context) {
    return MediaQuery.of(context).padding.bottom;
  }

  double paddingTop(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }
}
