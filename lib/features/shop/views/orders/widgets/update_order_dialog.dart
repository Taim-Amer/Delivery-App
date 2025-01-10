import 'package:delivery_app/features/shop/controllers/products_controller.dart';
import 'package:delivery_app/utils/constants/colors.dart';
import 'package:delivery_app/utils/constants/sizes.dart';
import 'package:delivery_app/utils/helpers/helper_functions.dart';
import 'package:delivery_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

Future<dynamic> showUpdateOrderDialog(BuildContext context, {required int orderID}) async {
  final dark = THelperFunctions.isDarkMode(context);
  return await showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: dark ? TColors.dark : TColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: SizedBox(
          width: 395.w,
          height: 200.h,
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextFormField(
                  controller: ProductsController.instance.updateOrderController,
                  validator: (value) => TValidator.validateEmptyText(value, ' quantity'),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.edit),
                    hintText: "New Quantity",
                  ),
                ),
                SizedBox(
                  height: 50.h,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => ProductsController.instance.updateOrder(orderID: orderID),
                    child: const Text("Update"),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
