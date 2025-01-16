import 'package:delivery_app/common/widgets/loaders/shimmer_loader.dart';
import 'package:delivery_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrdersShimmer extends StatelessWidget {
  const OrdersShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => ShimmerLoader(width: double.infinity, height: 130.h,),
      separatorBuilder: (context, _) => TSizes.spaceBtwItems.verticalSpace,
      itemCount: 12,
    );
  }
}
