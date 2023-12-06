
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/views/orderList/controller/order_list_controller.dart';

class OrderListBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<OrderListController>(() => OrderListController());
  }

}