import 'package:get/get.dart';
import 'package:mortalheart_gouyi/views/vipMedal/controller/vip_medal_controller.dart';

class VipMedalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VipMedalController>(
          () => VipMedalController(),
    );
  }
}
