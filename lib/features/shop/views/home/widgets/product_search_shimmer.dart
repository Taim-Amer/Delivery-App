import 'package:delivery_app/common/widgets/layouts/grid_layout.dart';
import 'package:delivery_app/common/widgets/loaders/shimmer_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductSearchShimmer extends StatelessWidget {
  const ProductSearchShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return TGridLayout(
      itemCount: 6,
      itemBuilder: (context, index) => Expanded(child: ShimmerLoader(width: 180, height: 300.h)),
    );
  }
}
