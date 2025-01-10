import 'package:delivery_app/common/styles/spacing_styles.dart';
import 'package:delivery_app/common/widgets/appbar/appbar.dart';
import 'package:delivery_app/common/widgets/loaders/shimmer_loader.dart';
import 'package:delivery_app/features/shop/views/cart/widgets/cart_menu_icon.dart';
import 'package:delivery_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoresShimmer extends StatelessWidget {
  const StoresShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(actions: [CartCounterIcon(onPressed: (){})]),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
        child: ListView.separated(
          itemCount: 5,
          itemBuilder: (context, index) => ShimmerLoader(width: double.infinity, height: 150.h),
          separatorBuilder: (_, index) => TSizes.spaceBtwItems.verticalSpace,
        ),
      ),
    );
  }
}
