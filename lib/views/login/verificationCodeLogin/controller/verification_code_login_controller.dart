
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class VerificationCodeLoginController extends GetxController{
  TextEditingController phoneController = TextEditingController();
  RxBool isSendCodeButtonEnable = false.obs;
  RxBool isCheckedProtocol = false.obs;


  ///获取验证码
  Future requestVerificationCode() async {

  }
}