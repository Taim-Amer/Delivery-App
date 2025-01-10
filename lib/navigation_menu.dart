import 'package:delivery_app/features/shop/views/favourites/favourites_screen.dart';
import 'package:delivery_app/features/shop/views/home/home_screen.dart';
import 'package:delivery_app/features/shop/views/orders/orders_screen.dart';
import 'package:delivery_app/features/shop/views/stores/store_screen.dart';
import 'package:delivery_app/utils/constants/colors.dart';
import 'package:delivery_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = THelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(() => NavigationBar(
        height: 80,
        elevation: 0,
        selectedIndex: controller.selectedIndex.value,
        onDestinationSelected: (index) => controller.selectedIndex.value = index,
        backgroundColor: darkMode ? Colors.black : TColors.white,
        indicatorColor: darkMode ? TColors.white.withOpacity(.1) : TColors.black.withOpacity(.1),
        destinations: const [
          NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
          NavigationDestination(icon: Icon(Iconsax.shop), label: "Store"),
          NavigationDestination(icon: Icon(Iconsax.heart), label: "Wishlist"),
          NavigationDestination(icon: Icon(Iconsax.verify), label: "Orders"),
        ],
      )),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const StoreScreen(),
    const FavouritesScreen(),
    const OrdersScreen(),
  ];
}
