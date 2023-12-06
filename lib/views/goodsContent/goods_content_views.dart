import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/goods_content_controller.dart';

class GoodsContentViews extends GetView<GoodsContentController> {
  const GoodsContentViews({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return  Scaffold(
     backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
     appBar: AppBar(
       backgroundColor: Colors.white,
       elevation: 0,
       title: const Text('商品详情'),
       centerTitle: true,
     ),
     body: const Text('我是内容'),
   );
  }

}