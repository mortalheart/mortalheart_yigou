
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/views/checkout/controller/checkout_controller.dart';

class CheckoutBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(CheckoutController());
  }

}