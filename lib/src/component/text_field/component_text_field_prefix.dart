import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../palette/palette.dart';
import '../size/i_padding.dart';
import '../size/i_size_box.dart';
import '../text/text_component.dart';

Widget textFieldPrefix(
  BuildContext context, {
  Key? key,
  required String title,
  TextEditingController? controller,
  Color? textColor,
  required Widget widget,
  List<TextInputFormatter>? inputFormatters,
  TextInputType? keyboardType,
  TextInputAction? textInputAction,
}) {
  return Column(
    children: [
      IText.regular(
        title,
        fontSize: 12,
        color: Palette.primary,
      ),
      ISizeBox().height(height: IPadding.p0),
      Container(
        decoration: BoxDecoration(
          color: Palette.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: IPadding.p1),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  textAlign: TextAlign.end,
                  decoration: const InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                  keyboardType: keyboardType,
                  textInputAction: textInputAction,
                  inputFormatters: inputFormatters,
                ),
              ),
              ISizeBox().width(width: IPadding.p0),
              Image.asset(
                "assets/icon/divider-vertical.png",
                fit: BoxFit.cover,
              ),
              ISizeBox().width(width: IPadding.p0),
              Container(
                key: key,
                child: widget,
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
