import 'package:flutter/material.dart';

import '../../../component/divider/i_divider_horizotal.dart';
import '../../../component/palette/palette.dart';
import '../../../component/size/i_padding.dart';
import '../../../component/size/i_size_box.dart';
import '../../../component/text/text_component.dart';

Widget styleCardNameOutlet({required String currency, required String money}) {
  return Row(
    children: [
      Row(
        children: [
          Image.asset("assets/icon/idr.png"),
          ISizeBox().width(width: IPadding.p0),
          IText.bold(
            currency,
            color: Palette.black.withOpacity(0.7),
          ),
        ],
      ),
      ISizeBox().width(width: IPadding.p0),
      const Expanded(
        child: IDividerHorizontal(
          height: 0.5,
        ),
      ),
      ISizeBox().width(width: IPadding.p0),
      IText.medium(
        money,
      ),
    ],
  );
}
