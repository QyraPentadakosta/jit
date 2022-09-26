import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../size/i_padding.dart';

Future showDialogOnTap(
  BuildContext context, {
  required double offset,
  required Widget widget,
  Color? colorMaterial,
  double? rightOffset,
  double? leftOffset,
  double? paddingHorizontal,
  double? radius,
}) {
  return showCupertinoDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => Stack(
      children: [
        Positioned(
          right: rightOffset,
          left: leftOffset,
          top: offset,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: paddingHorizontal ?? IPadding.p2),
            child: Material(
              color: colorMaterial ?? Colors.transparent,
              borderRadius: BorderRadius.circular(radius ?? 10),
              child: widget,
            ),
          ),
        ),
      ],
    ),
  );
}
