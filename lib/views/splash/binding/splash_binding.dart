
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/views/cart/controller/cart_controller.dart';
import 'package:mortalheart_gouyi/views/category/controller/category_controller.dart';
import 'package:mortalheart_gouyi/views/home/controller/home_controller.dart';
import 'package:mortalheart_gouyi/views/me/controller/mie_controller.dart';
import 'package:mortalheart_gouyi/views/navigation/controller/navigation_controller.dart';
import 'package:mortalheart_gouyi/views/splash/controller/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<NavigationController>(
          NavigationController(),
    );
    /// 首页
    Get.put<HomeController>( HomeController(),);
    /// 分类
    Get.put<CategoryController>(
         CategoryController(),
    );
    ///:购物车
    Get.put<CartController>(
           CartController(),
    );
    ///:我的
    Get.put<MieController>(
          MieController(),
    );
    Get.lazyPut<SplashController>(
          () => SplashController(),
    );

  }
}