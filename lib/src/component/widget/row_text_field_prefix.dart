import 'package:flutter/material.dart';

import '../palette/palette.dart';
import '../size/i_padding.dart';
import '../size/i_size_box.dart';
import '../text/text_component.dart';

Widget rowTextFieldPrefix({
  Function()? onTap,
  Key? key,
  required String title,
  required bool arrowStatus,
}) {
  return InkWell(
    onTap: onTap,
    child: Row(
      key: key,
      children: [
        Image.asset("assets/icon/idr.png"),
        ISizeBox().width(width: IPadding.p0),
        IText.regular(
          title,
          color: Palette.secondary,
        ),
        Icon(
          arrowStatus
              ? Icons.keyboard_arrow_up_outlined
              : Icons.keyboard_arrow_down,
          color: Palette.secondary,
        ),
      ],
    ),
  );
}
