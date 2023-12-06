import 'package:get/get.dart';
import 'package:mortalheart_gouyi/views/login/verificationCodeLogin/controller/verification_code_login_controller.dart';

class VerificationCodeLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerificationCodeLoginController>(
          () => VerificationCodeLoginController(),
    );
  }
}