
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/views/settings/controller/settings_controller.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<SettingsController>(() => SettingsController());
  }

}