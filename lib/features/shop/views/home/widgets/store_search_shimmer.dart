import 'package:delivery_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/widgets/loaders/shimmer_loader.dart';

class StoreSearchShimmer extends StatelessWidget {
  const StoreSearchShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => ShimmerLoader(width: double.infinity, height: 150.h),
      separatorBuilder: (context, _) => TSizes.spaceBtwItems.verticalSpace,
      itemCount: 12,
    );
  }
}
