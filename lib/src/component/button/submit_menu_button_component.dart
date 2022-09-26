import 'package:flutter/material.dart';

import '../palette/palette.dart';
import '../size/i_padding.dart';
import '../text/text_component.dart';

Widget buttonSubmitMenu(
  BuildContext context, {
  Function()? onTap,
  String? title,
}) {
  return Container(
    color: Palette.secondary,
    height: IPadding().paddingBottom(context) + IPadding.p10,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              color: Palette.secondary2,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: IPadding.p4,
              vertical: IPadding.p1,
            ),
            child: IText.bold(
              title ?? "Submit",
            ),
          ),
        ),
      ],
    ),
  );
}
