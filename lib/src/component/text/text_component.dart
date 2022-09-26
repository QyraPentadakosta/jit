import 'package:flutter/material.dart';

import '../palette/palette.dart';

class IText extends Text {
  const IText({
    Key? key,
    required String text,
    TextStyle? textStyle,
    bool? softWrap,
    TextAlign? textAlign,
    TextOverflow? overflow,
  }) : super(
          text,
          key: key,
          style: textStyle,
          softWrap: softWrap,
          textAlign: textAlign,
          overflow: overflow,
        );

  factory IText.regular(
    String text, {
    TextStyle? textStyle,
    bool? softWrap,
    TextAlign? textAlign,
    TextOverflow? overflow,
    Color? color,
    double? fontSize,
  }) {
    return IText(
      text: text,
      textAlign: textAlign,
      textStyle: TextStyle(
        color: color ?? Palette.secondary,
        fontFamily: "Roboto",
        fontWeight: FontWeight.w400,
        fontSize: fontSize,
      ),
      overflow: overflow,
      softWrap: softWrap,
    );
  }

  factory IText.medium(
    String text, {
    TextStyle? textStyle,
    bool? softWrap,
    TextAlign? textAlign,
    TextOverflow? overflow,
    Color? color,
    double? fontSize,
  }) {
    return IText(
      text: text,
      textAlign: textAlign,
      textStyle: TextStyle(
        color: color ?? Palette.secondary,
        fontFamily: "Roboto",
        fontWeight: FontWeight.w500,
        fontSize: fontSize,
      ),
      overflow: overflow,
      softWrap: softWrap,
    );
  }

  factory IText.bold(
    String text, {
    TextStyle? textStyle,
    bool? softWrap,
    TextAlign? textAlign,
    TextOverflow? overflow,
    Color? color,
    double? fontSize,
  }) {
    return IText(
      text: text,
      textAlign: textAlign,
      textStyle: TextStyle(
        color: color ?? Palette.secondary,
        fontFamily: "Roboto",
        fontWeight: FontWeight.w700,
        fontSize: fontSize,
      ),
      overflow: overflow,
      softWrap: softWrap,
    );
  }
}
