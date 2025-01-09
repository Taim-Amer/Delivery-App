import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:delivery_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:delivery_app/common/widgets/images/rounded_image.dart';
import 'package:delivery_app/common/widgets/texts/product_title_text.dart';
import 'package:delivery_app/utils/constants/colors.dart';
import 'package:delivery_app/utils/constants/sizes.dart';
import 'package:delivery_app/utils/helpers/helper_functions.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: THelperFunctions.screenWidth(context) - 60,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.softGrey
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(TSizes.md.w),
            child: TRoundedContainer(
              height: 120,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: const SizedBox(height: 120, width: 120, child: TRoundedImage(imageUrl: "assets/images/product1.png", applyImageRadius: true)),
            ),
          ),

          const SizedBox(
            width: 172,
            child: TProductTitleText(title: "Green Nike Half Sleeve Shirt", smallSize: true),
          )
        ],
      ),
    );
  }
}
