
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/views/details/openScan/controller/scan_controller.dart';

class ScanBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<ScanController>(() => ScanController());
  }

}