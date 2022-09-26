import 'package:flutter/material.dart';

import '../../core/domain/models/model_category_currency.dart';
import '../palette/palette.dart';
import '../size/i_padding.dart';
import '../size/i_size_box.dart';
import '../text/text_component.dart';

class StyleCategoryCurrency {
  Widget style({required String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: IPadding.p0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/icon/idr.png"),
          ISizeBox().width(width: IPadding.p1),
          IText.bold(
            title,
            color: Palette.black.withOpacity(0.5),
          ),
        ],
      ),
    );
  }
}
