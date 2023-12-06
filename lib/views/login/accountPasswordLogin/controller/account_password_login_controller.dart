
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/views/me/controller/mie_controller.dart';

class AccountPasswordLoginController extends GetxController {
  MieController meController = Get.find();
  TextEditingController accountController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isLoginButtonEnable = false.obs;
  RxBool isCheckedProtocol = false.obs;
  RxBool isObscure = true.obs;


  @override
  void onClose() {
    super.onClose();

    ///本页面关闭的时候，获取用户信息刷新
    meController.getUserInfo();
  }


  ///更新登录按钮状态
  void updateLoginButtonState() {
    isLoginButtonEnable.value = (accountController.text.length == 11 &&
        passwordController.text.length >= 8)
        ? true
        : false;
    update();
  }

  void updateObscureState() {
    isObscure.value = !isObscure.value;
    update();
  }

  Future login() async {

  }
}