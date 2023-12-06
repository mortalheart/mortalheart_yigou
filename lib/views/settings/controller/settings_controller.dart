

import 'package:get/get.dart';

class SettingsController extends GetxController {
  RxBool isLogin = true.obs;

  @override
  void onInit() {
    super.onInit();
    getUserInfo();
  }

  void getUserInfo() async {

  }
}