
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/views/details/active_page/controller/active_controller.dart';

class ActiveBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ActiveController());
  }

}