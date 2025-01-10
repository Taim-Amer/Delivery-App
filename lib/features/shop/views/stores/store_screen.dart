import 'package:delivery_app/common/widgets/appbar/appbar.dart';
import 'package:delivery_app/features/shop/controllers/store_controller.dart';
import 'package:delivery_app/features/shop/repositories/store/store_repo_impl.dart';
import 'package:delivery_app/features/shop/views/cart/widgets/cart_menu_icon.dart';
import 'package:delivery_app/features/shop/views/stores/widgets/store_card.dart';
import 'package:delivery_app/features/shop/views/stores/widgets/stores_shimmer.dart';
import 'package:delivery_app/utils/constants/colors.dart';
import 'package:delivery_app/utils/constants/enums.dart';
import 'package:delivery_app/utils/constants/sizes.dart';
import 'package:delivery_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put<StoreController>(StoreController());
    Get.put<StoreRepoImpl>(StoreRepoImpl());
    var storesList = StoreController.instance.allStoresModel.value.data;
    final dark = THelperFunctions.isDarkMode(context);
    return RefreshIndicator(
      color: TColors.primary,
      backgroundColor: dark ? TColors.dark : TColors.light,
      onRefresh: () async{
        await StoreController.instance.getAllStores();
      },
      child: Obx(() => StoreController.instance.getStoresApiStatus.value == RequestState.loading ? const StoresShimmer() : Scaffold(
        appBar: TAppBar(actions: [CartCounterIcon(onPressed: (){})],),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
          child: ListView.separated(
            itemBuilder: (context, index) => StoreCard(
              name: storesList?[index].name ?? "",
              location: storesList?[index].location ?? "",
              image: storesList?[index].imageStore ?? "",
              represents: storesList?[index].represents ?? "",
              storeID: storesList?[index].id ?? 0,
            ),
            separatorBuilder: (_, index) => const SizedBox(height: TSizes.spaceBtwItems),
            itemCount: storesList?.length ?? 0,
          ),
        ),
      )));
  }
}
