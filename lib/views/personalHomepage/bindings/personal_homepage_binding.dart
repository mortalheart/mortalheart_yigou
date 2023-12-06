
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/views/personalHomepage/controller/personal_homepage_controller.dart';

class PersonalHomepageBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<PersonalHomepageController>(
          () => PersonalHomepageController(),
    );
  }

}