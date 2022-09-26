import 'dart:io';

enum EnumStatusAddPhoto {
  initial,
  filled,
  empty,
}

class ModelCardAddPhoto {
  String title;
  EnumStatusAddPhoto? status;
  File? file;

  ModelCardAddPhoto({
    required this.title,
    this.file,
    this.status,
  });
}
