// import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:delivery_app/common/widgets/layouts/grid_layout.dart';
// import 'package:delivery_app/features/shop/views/products/widgets/product_card.dart';
// import 'package:delivery_app/utils/constants/sizes.dart';
//
// class TSortableProducts extends StatelessWidget {
//   const TSortableProducts({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         DropdownButtonFormField(
//           decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
//           onChanged: (value) {},
//           items: ["Name", "Higher Price", "Lower Price", "Sale", "Newest", "Popularity"]
//               .map((option) => DropdownMenuItem(child: Text(option)))
//               .toList(),
//         ),
//         const SizedBox(height: TSizes.spaceBtwSections),
//
//         TGridLayout(itemCount: 4, itemBuilder: (_, index) => const ProductCardVertical())
//       ],
//     );
//   }
// }
