
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderListController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  int initialIndex = Get.arguments != null ? Get.arguments["initialIndex"] : 0;

  ///tab标签列表
  RxList<Widget> tabBarList =  const [
    Tab(text: "全部"),
    Tab(text: "待付款"),
    Tab(text: "待收货"),
    Tab(text: "待评价")
  ].obs;

  ///所有订单列表
  RxList allOrderList = [].obs;
  RxList paymentOrderList = [].obs;
  RxList receiverOrderList = [].obs;
  RxList commentOrderList = [].obs;

  @override
  void onInit() {
    super.onInit();

    initialPage();
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  void initialPage() {
    tabController = TabController(
        length: tabBarList.length, vsync: this, initialIndex: initialIndex);
    switch (initialIndex) {
      case 0:
        requestAllOrderList();
        break;
      case 1:
        requestOrderList(1);
        break;
      case 2:
        requestOrderList(2);
        break;
      case 3:
        requestOrderList(3);
        break;
      default:
    }
  }

  void requestAllOrderList() {}

  void requestOrderList(int i) {}
}