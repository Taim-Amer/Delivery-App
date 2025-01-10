import 'package:delivery_app/common/styles/spacing_styles.dart';
import 'package:delivery_app/common/widgets/loaders/shimmer_loader.dart';
import 'package:delivery_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ShimmerLoader(width: double.infinity, height: 40.h),
        TSizes.spaceBtwItems.verticalSpace,
        ShimmerLoader(width: double.infinity, height: 150.h),
        TSizes.md.verticalSpace,
        ShimmerLoader(width: double.infinity, height: 40.h),
        TSizes.spaceBtwItems.verticalSpace,
        Row(
          children: [
            Expanded(child: ShimmerLoader(width: 180, height: 300.h)),
            TSizes.spaceBtwItems.horizontalSpace,
            Expanded(child: ShimmerLoader(width: 180, height: 300.h)),
          ],
        )
      ],
    );
  }
}
