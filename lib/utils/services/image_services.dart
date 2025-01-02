import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class TImageServices {
  TImageServices._();

  static final ValueNotifier<List<File>> selectedImages = ValueNotifier([]);
  static final ValueNotifier<bool> isSelected = ValueNotifier(false);
  static final ImagePicker _picker = ImagePicker();

  static Future<void> pickSingleImage({bool fromCamera = false}) async {
    final XFile? image = await _picker.pickImage(
      source: fromCamera ? ImageSource.camera : ImageSource.gallery,
      imageQuality: 80,
    );

    if (image != null) {
      selectedImages.value = [File(image.path)];
      isSelected.value = true;
    }
  }

  static Future<void> pickMultipleImages() async {
    final List<XFile> images = await _picker.pickMultiImage(
      imageQuality: 80,
    );

    List<File> files = images.map((xFile) => File(xFile.path)).toList();
    selectedImages.value = files;
    isSelected.value = files.isNotEmpty;
  }

  static void deleteImageByName(String fileName) {
    selectedImages.value.removeWhere((file) {
      return file.path.split('/').last == fileName;
    });
    isSelected.value = selectedImages.value.isNotEmpty;
  }

  static void clearAllImages() {
    selectedImages.value.clear();
    isSelected.value = false;
  }
}
