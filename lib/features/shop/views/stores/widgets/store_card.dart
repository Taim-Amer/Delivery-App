import 'package:delivery_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:delivery_app/common/widgets/images/rounded_image.dart';
import 'package:delivery_app/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:delivery_app/common/widgets/texts/product_title_text.dart';
import 'package:delivery_app/utils/constants/colors.dart';
import 'package:delivery_app/utils/constants/sizes.dart';
import 'package:delivery_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoreCard extends StatelessWidget {
  const StoreCard({super.key, required this.name, required this.location, required this.image, required this.represents, required this.storeID});

  final String name;
  final String location;
  final String image;
  final String represents;
  final int storeID;

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
              child: SizedBox(height: 120, width: 120, child: TRoundedImage(imageUrl: image, applyImageRadius: true, isNetworkImage: true)),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TBrandTitleWithVerifiedIcon(title: name),
              SizedBox(
                width: 172,
                child: TProductTitleText(title: location, smallSize: true),
              ),
              SizedBox(
                width: 172,
                child: TProductTitleText(title: represents, smallSize: true),
              ),
            ],
          )
        ],
      ),
    );
  }
}
