import 'dart:io';

import 'package:flutter/material.dart';

import '../../core/domain/models/model_card_add_photo.dart';
import '../palette/palette.dart';
import '../size/i_padding.dart';
import '../size/i_screen.dart';
import '../size/i_size_box.dart';
import '../text/text_component.dart';

class AddPhotoStyle {
  Widget styleFieldAddPhoto(
    BuildContext context, {
    required List<Widget> listWidget,
  }) {
    return Column(
      children: [
        IText.regular(
          "Photo",
          color: Palette.primary,
          fontSize: 12,
        ),
        ISizeBox().height(height: IPadding.p0),
        Container(
          decoration: BoxDecoration(
            color: Palette.primary,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: IPadding.p2,
            vertical: IPadding.p1,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: listWidget,
          ),
        ),
      ],
    );
  }

  Widget styleCard(
    BuildContext context, {
    required String title,
    required EnumStatusAddPhoto status,
    File? fileImage,
  }) {
    return Container(
      width: IScreen().width(context, width: 1.0) / 4 - 30,
      height: 60,
      decoration: BoxDecoration(
        color: Palette.secondary2
            .withOpacity(status == EnumStatusAddPhoto.empty ? 0.2 : 1),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(vertical: IPadding.p0),
      child: status == EnumStatusAddPhoto.empty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.camera_alt,
                  color: Colors.transparent,
                ),
                IText.regular(
                  title,
                  fontSize: 9,
                  color: Colors.transparent,
                  textAlign: TextAlign.center,
                ),
              ],
            )
          : status == EnumStatusAddPhoto.filled
              ? fileImage == null
                  ? Container()
                  : Image.file(
                      fileImage,
                      fit: BoxFit.cover,
                    )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.camera_alt,
                      color: Palette.secondary,
                    ),
                    IText.regular(
                      title,
                      fontSize: 9,
                      color: Palette.secondary,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
    );
  }
}
