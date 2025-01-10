import 'package:cached_network_image/cached_network_image.dart';
import 'package:delivery_app/common/widgets/appbar/appbar.dart';
import 'package:delivery_app/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:delivery_app/common/widgets/icons/circular_icon.dart';
import 'package:delivery_app/common/widgets/loaders/shimmer_loader.dart';
import 'package:delivery_app/utils/constants/colors.dart';
import 'package:delivery_app/utils/constants/sizes.dart';
import 'package:delivery_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TCurvedEdgeWidget(
      child: Stack(
        children: [
          SizedBox(
            height: 400,
            child: Padding(
              padding: const EdgeInsets.all(TSizes.productImageRadius * 2),
              child: CachedNetworkImage(
                imageUrl: image,
                fit: BoxFit.cover,
                placeholder: (context, url) => const ShimmerLoader(width: double.infinity, height: double.infinity),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          const TAppBar(showBackArrow: true)
        ],
      ),
    );
  }
}
