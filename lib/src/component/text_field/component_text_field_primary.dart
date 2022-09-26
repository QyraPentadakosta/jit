import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../palette/palette.dart';
import '../size/i_padding.dart';
import '../size/i_size_box.dart';
import '../text/text_component.dart';

Widget textFieldPrimary(
  TextEditingController? controller, {
  required String title,
  Color? textColor,
  List<TextInputFormatter>? inputFormatters,
  TextInputType? keyboardType,
  TextInputAction? textInputAction,
}) {
  return Column(
    children: [
      IText.regular(
        title,
        color: Palette.primary,
        fontSize: 12,
      ),
      ISizeBox().height(height: IPadding.p0),
      Container(
        decoration: BoxDecoration(
          color: Palette.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: IPadding.p1),
        child: TextField(
          controller: controller,
          textAlign: TextAlign.center,
          decoration: const InputDecoration(
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
          ),
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          textInputAction: textInputAction,
        ),
      ),
    ],
  );
}
