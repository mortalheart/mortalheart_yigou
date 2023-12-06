import 'package:get/get.dart';
import 'package:mortalheart_gouyi/views/category/controller/category_controller.dart';

class CategoryBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    /// 分类
    Get.put(CategoryController());
  }

}