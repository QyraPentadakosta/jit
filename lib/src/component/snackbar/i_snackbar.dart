import 'package:flutter/material.dart';

import '../palette/palette.dart';
import '../size/i_padding.dart';
import '../text/text_component.dart';

void iShowSnackBar(
  BuildContext context, {
  required String title,
  String subTitle = "",
  Widget? action,
  bool success = false,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      padding: const EdgeInsets.all(0),
      backgroundColor: success ? Palette.success : Palette.error,
      content: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(IPadding.p2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  IText.bold(
                    title,
                    color: Palette.primary,
                    fontSize: 18,
                  ),
                  subTitle.isEmpty
                      ? const SizedBox()
                      : IText.medium(
                          subTitle,
                          color: Palette.primary,
                          fontSize: 16,
                        ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
            child: const Padding(
              padding: EdgeInsets.all(IPadding.p2),
              child: Icon(
                Icons.close,
                color: Palette.primary,
              ),
            ),
          )
        ],
      ),
    ),
  );
}
