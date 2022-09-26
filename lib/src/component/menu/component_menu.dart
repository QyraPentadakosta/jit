import 'package:flutter/material.dart';

import '../palette/palette.dart';
import '../text/text_component.dart';

Widget menuComponent({
  required String image,
  required String title,
  required bool status,
  Function()? onTap,
}) {
  return InkWell(
    onTap: onTap,
    splashColor: Colors.transparent,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          width: 40,
          color: Palette.secondary.withOpacity(status ? 1.0 : 0.3),
        ),
        IText.regular(
          title,
          color: Palette.secondary.withOpacity(status ? 1.0 : 0.3),
        ),
      ],
    ),
  );
}
