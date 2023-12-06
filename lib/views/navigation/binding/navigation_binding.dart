
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/views/cart/controller/cart_controller.dart';
import 'package:mortalheart_gouyi/views/found/controller/found_controller.dart';
import 'package:mortalheart_gouyi/views/home/controller/home_controller.dart';
import 'package:mortalheart_gouyi/views/me/controller/mie_controller.dart';
import 'package:mortalheart_gouyi/views/message/controller/message_controller.dart';
import 'package:mortalheart_gouyi/views/navigation/controller/navigation_controller.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NavigationController());
    /// 首页
    Get.lazyPut<HomeController>(() => HomeController(),);
    /// 发现
    Get.lazyPut<FoundController>(()=>FoundController());
    /// 消息
    Get.lazyPut<MessageController>(()=>MessageController());

    ///:购物车
    Get.lazyPut<CartController>(
          () => CartController(),
      fenix: true,
    );
    ///:我的
    Get.lazyPut<MieController>(
          () => MieController(),
    );
  }
}
