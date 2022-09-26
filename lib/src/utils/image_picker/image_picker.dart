import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../component/snackbar/i_snackbar.dart';

class IImagePicker {
  final ImagePicker _picker = ImagePicker();

  Future<XFile?> getImageFromGallery(BuildContext context) async {
    try {
      final XFile? imageFile = await _picker.pickImage(
        source: ImageSource.gallery,
        maxHeight: 150.0,
        maxWidth: 150.0,
      );

      return imageFile;
    } catch (e) {
      iShowSnackBar(
        context,
        title: "Error Take Photo",
      );
    }
    return null;
  }

  Future<XFile?> getImageFromCamera(BuildContext context) async {
    try {
      final XFile? imageFile = await _picker.pickImage(
        source: ImageSource.camera,
        maxHeight: 150.0,
        maxWidth: 150.0,
      );
      if (imageFile != null) {
        return imageFile;
      }
    } catch (e) {
      iShowSnackBar(
        context,
        title: "Error Take Photo",
      );
    }
    return null;
  }
}
