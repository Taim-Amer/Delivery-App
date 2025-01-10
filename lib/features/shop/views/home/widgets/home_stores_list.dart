import 'package:delivery_app/features/shop/controllers/store_controller.dart';
import 'package:delivery_app/features/shop/views/stores/widgets/store_card.dart';
import 'package:delivery_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeStoresList extends StatelessWidget {
  const HomeStoresList({super.key});

  @override
  Widget build(BuildContext context) {
    var storeList = StoreController.instance.allStoresModel;
    return SizedBox(
      height: 150.h,
      child: ListView.separated(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => StoreCard(
          name: storeList.value.data?[index].name ?? "",
          location: storeList.value.data?[index].location ?? "",
          image: storeList.value.data?[index].imageStore ?? "",
          represents: storeList.value.data?[index].represents ?? "",
          storeID: storeList.value.data?[index].id ?? 0,
        ),
        separatorBuilder: (_, index) => const SizedBox(width: TSizes.spaceBtwItems),
      ),
    );
  }
}
