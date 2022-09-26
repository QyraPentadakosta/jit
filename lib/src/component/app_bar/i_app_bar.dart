import 'package:flutter/material.dart';

import '../palette/palette.dart';
import '../text/text_component.dart';

class IAppbar extends AppBar {
  IAppbar({
    Key? key,
    Widget? title,
    bool? centerTitle,
    double? elevation,
    List<Widget>? action,
    Color? backgroundColor,
    required bool automaticallyImplyLeading,
    IconThemeData? iconTheme,
  }) : super(
          key: key,
          elevation: elevation,
          backgroundColor: backgroundColor,
          title: title,
          centerTitle: centerTitle,
          actions: action,
          automaticallyImplyLeading: automaticallyImplyLeading,
          iconTheme: iconTheme,
        );

  factory IAppbar.primary({
    required String title,
    List<Widget>? action,
    Color? backgroundColor,
    Color? textColor,
    double? elevation,
  }) {
    return IAppbar(
      title: IText.bold(
        title,
      ),
      elevation: elevation ?? 0,
      centerTitle: true,
      backgroundColor: backgroundColor ?? Palette.primary,
      action: action ?? [],
      automaticallyImplyLeading: false,
    );
  }

  factory IAppbar.menu({
    required String title,
    bool? centerTitle,
    double? elevation,
    Color? backgroundColor,
    List<Widget>? action,
    Color? leadingColor,
  }) {
    return IAppbar(
      title: IText.bold(title),
      centerTitle: centerTitle ?? true,
      elevation: elevation ?? 0,
      backgroundColor: backgroundColor ?? Palette.secondary,
      action: action ?? [],
      automaticallyImplyLeading: true,
      iconTheme: IconThemeData(
        color: leadingColor ?? Palette.secondary,
      ),
    );
  }
}
