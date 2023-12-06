
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/views/paymentMethods/controller/paymentMethods_controller.dart';

class PaymentMethodsBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(PaymentMethodsController());
  }

}