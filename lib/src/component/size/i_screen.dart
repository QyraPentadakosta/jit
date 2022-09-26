import 'package:flutter/material.dart';

class IScreen {
  double width(BuildContext context, {required double width}) {
    return MediaQuery.of(context).size.width * width;
  }

  double height(BuildContext context, {required double height}) {
    return MediaQuery.of(context).size.height * height;
  }
}
