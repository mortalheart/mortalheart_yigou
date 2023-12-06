import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/views/cart/controller/cart_controller.dart';
import 'package:mortalheart_gouyi/views/cart/widgets/cart_contentView.dart';
import 'package:mortalheart_gouyi/views/cart/widgets/cart_floatingView.dart';
import 'package:mortalheart_gouyi/views/cart/widgets/cart_hader.dart';
class  CartViews extends GetView<CartController>{
  const CartViews({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
        children: [
          cartHeader(context,controller),
          Expanded(child: cartContentView(context,controller),),
          if(controller.cartList.isNotEmpty)
          cartFloatingView(context,controller)
        ],
    );
  }

}