import 'dart:io';
import 'dart:typed_data';

import 'package:delivery_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:delivery_app/utils/device/device_utility.dart';
import 'package:delivery_app/utils/helpers/helper_functions.dart';
import 'package:delivery_app/utils/services/image_services.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class RegisterImagePicker extends StatelessWidget {
  const RegisterImagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return ValueListenableBuilder<List<dynamic>>(
      valueListenable: TImageServices.selectedImages,
      builder: (context, images, child) {
        return GestureDetector(
          onTap: () => TImageServices.pickSingleImage(),
          child: TRoundedContainer(
            radius: 30,
            width: 130,
            height: 130,
            showBorder: true,
            backgroundColor: Colors.transparent,
            child: images.isNotEmpty ? ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: TDeviceUtils.isWeb() ? Image.memory(
                images.first as Uint8List,
                fit: BoxFit.cover,
              ) : Image.file(
                images.first as File,
                fit: BoxFit.cover,
              ),
            ) : const Icon(Iconsax.camera, size: 50, color: Colors.grey),
          ),
        );
      },
    );
  }
}
