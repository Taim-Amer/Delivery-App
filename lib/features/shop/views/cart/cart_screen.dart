import 'package:delivery_app/common/widgets/appbar/appbar.dart';
import 'package:delivery_app/common/widgets/layouts/grid_layout.dart';
import 'package:delivery_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: BackButtonIcon()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
        child: TGridLayout(
          itemCount: 20,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (_, index) => SizedBox(),
          mainAxisExtent: 288,
        ),
      ),
    );
  }
}
