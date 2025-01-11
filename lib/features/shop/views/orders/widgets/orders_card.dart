import 'package:flutter/material.dart';
import 'package:delivery_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:delivery_app/common/widgets/texts/product_price_text.dart';
import 'package:delivery_app/features/shop/controllers/products_controller.dart';
import 'package:delivery_app/features/shop/views/orders/widgets/update_order_dialog.dart';
import 'package:delivery_app/utils/constants/colors.dart';
import 'package:delivery_app/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class OrdersCard extends StatelessWidget {
  const OrdersCard({
    Key? key,
    required this.price,
    required this.orderID,
  }) : super(key: key);

  final int price; // سعر الطلب
  final int orderID; // رقم الطلب

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      width: double.infinity,
      showBorder: true,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(TSizes.sm),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // رقم الطلب مع تسمية
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Order ID",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                orderID.toString(),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),

          // سعر الطلب
          TProductPriceText(
            price: price.toString(),
            isLarge: true,
          ),

          // أيقونة التحقق (تمت معالجة الطلب)
          Tooltip(
            message: "Order Verified",
            child: const Icon(
              Iconsax.verify,
              size: 24,
              color: TColors.greenColor,
            ),
          ),

          // زر حذف الطلب
          IconButton(
            onPressed: () {
              // تأكيد الحذف
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Delete Order"),
                  content: const Text("Are you sure you want to delete this order?"),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        ProductsController.instance.deleteOrder(orderID: orderID);
                      },
                      child: const Text(
                        "Delete",
                        style: TextStyle(color: TColors.redColor),
                      ),
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(
              Iconsax.trash,
              size: 24,
              color: TColors.redColor,
            ),
            tooltip: "Delete Order",
          ),

          // زر تعديل الطلب
          IconButton(
            onPressed: () {
              showUpdateOrderDialog(context, orderID: orderID);
            },
            icon: const Icon(
              Iconsax.edit,
              size: 24,
              color: TColors.yellowColor,
            ),
            tooltip: "Edit Order",
          ),
        ],
      ),
    );
  }
}
