import 'package:flutter/material.dart';

import '../palette/palette.dart';
import '../size/i_padding.dart';
import '../size/i_screen.dart';
import '../text/text_component.dart';

Widget buttonDropdown(
  BuildContext context, {
  required String title,
  String? label,
  required Function() onTap,
  GlobalKey? key,
  required bool statusArrow,
}) {
  return Container(
    key: key,
    color: Palette.primary,
    width: IScreen().width(context, width: 1.0),
    padding: const EdgeInsets.symmetric(
      vertical: IPadding.p2,
      horizontal: IPadding.p2,
    ),
    child: Column(
      children: [
        label == null
            ? Container()
            : IText.medium(
                label,
                fontSize: 12,
              ),
        InkWell(
          onTap: onTap,
          child: Container(
            width: IScreen().width(context, width: 0.4),
            decoration: BoxDecoration(
              color: Palette.secondary2,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(
                horizontal: IPadding.p0, vertical: IPadding.p0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IText.bold(title),
                Icon(
                  statusArrow
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: Palette.secondary,
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
