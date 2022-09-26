import 'package:flutter/material.dart';

import '../../../component/divider/i_divider_horizotal.dart';
import '../../../component/palette/palette.dart';
import '../../../component/size/i_padding.dart';
import '../../../component/size/i_size_box.dart';
import '../../../component/text/text_component.dart';

Widget styleCardScroll({
  required String title,
  required String image,
}) {
  return Padding(
    padding: const EdgeInsets.only(right: IPadding.p2),
    child: Column(
      children: [
        Image.asset(image),
        IText.medium(title),
      ],
    ),
  );
}

Widget styleKeyValueScroll({
  required String key,
  required String value,
  bool? medium,
  Color? color,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: IPadding.p0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        medium ?? false
            ? IText.medium(key, color: color)
            : IText.regular(key, color: color),
        ISizeBox().width(width: IPadding.p1),
        const Expanded(
          child: IDividerHorizontal(
            color: Palette.secondary,
            height: 0.5,
          ),
        ),
        ISizeBox().width(width: IPadding.p1),
        medium ?? false
            ? IText.medium(value, color: color)
            : IText.regular(value, color: color),
      ],
    ),
  );
}
