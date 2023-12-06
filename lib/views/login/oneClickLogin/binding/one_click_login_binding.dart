import 'package:get/get.dart';
import 'package:mortalheart_gouyi/views/login/oneClickLogin/controller/one_click_login_controller.dart';

class OneClickLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OneClickLoginController>(
          () => OneClickLoginController(),
    );
  }
}