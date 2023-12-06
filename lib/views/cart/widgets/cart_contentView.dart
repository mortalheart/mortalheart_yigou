
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/views/cart/controller/cart_controller.dart';
import 'package:mortalheart_gouyi/views/cart/widgets/cart_ListViews.dart';
import 'package:mortalheart_gouyi/views/cart/widgets/cart_goodsListView.dart';
import 'package:mortalheart_gouyi/widgets/app_components.dart';

Widget cartContentView (BuildContext context, CartController controller) {
  return GetBuilder<CartController>(
        init: controller,


        initState: (state) {


          ///这里每次update都会执行
          controller.getLocalCartList();
        },
        didChangeDependencies: (state) {

        },
        didUpdateWidget: (oldWidget, state) {

        },
        dispose: (state) {

        },
        builder: (controller) {
           return controller.cartList.isNotEmpty
              ? Stack(
            children: [
              cartListViews(context,controller),
            ],
          )
              : ListView(children: [
            commonEmptyView("购物车空空如也"),
             cartGoodsListView(context, controller)
          ]);
        },
  );
}