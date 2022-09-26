import 'package:flutter/material.dart';

double getOffset(GlobalKey key, {required bool yTrue}) {
  RenderBox box = key.currentContext?.findRenderObject() as RenderBox;
  Offset position = box.localToGlobal(Offset.zero);
  double data = 0;
  if (yTrue) {
    data = position.dy;
  } else {
    data = position.dx;
  }
  return data;
}
