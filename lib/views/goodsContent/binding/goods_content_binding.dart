import 'package:get/get.dart';
import 'package:mortalheart_gouyi/views/goodsContent/controller/goods_content_controller.dart';

class GoodsContentBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<GoodsContentController>(() => GoodsContentController());
  }

}