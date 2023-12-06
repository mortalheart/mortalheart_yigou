
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/views/cart/cart_views.dart';
import 'package:mortalheart_gouyi/views/found/found_views.dart';
import 'package:mortalheart_gouyi/views/home/home_views.dart';
import 'package:mortalheart_gouyi/views/me/mie_views.dart';
import 'package:mortalheart_gouyi/views/message/message_views.dart';

class NavigationController extends GetxController {

  RxInt currentIndex = 0.obs;

  final List<Widget> pages = [
    const HomeViews(),
    const FoundViews(),
    const MessageViews(),
    const CartViews(),
    const MieViews(),
  ];
  //设置当前索引
  void setCurrentIndex(index) {
    currentIndex.value = index;
  }

}