import 'package:delivery_app/features/orders/controllers/orders_controller.dart';
import 'package:get/get.dart';

class OrderBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<OrdersController>(OrdersController());
  }
}