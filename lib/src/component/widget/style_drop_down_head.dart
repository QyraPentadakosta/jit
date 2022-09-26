import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../size/i_padding.dart';
import '../text/text_component.dart';
import '../../core/domain/models/model_outlet.dart';

class StyleDropDownHead {
  Widget style(
    BuildContext context, {
    required String nameOutlet,
  }) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: IPadding.p0),
        child: IText.bold(nameOutlet),
      ),
    );
  }
}
