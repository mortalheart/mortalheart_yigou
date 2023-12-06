
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/utils/app_screenAdapter.dart';
import 'package:mortalheart_gouyi/views/home/controller/home_controller.dart';
import 'package:mortalheart_gouyi/widgets/goods_item.dart';

Widget homeListViews(BuildContext context,HomeController controller) {
  double width = (getScreenWidth(context) - 20) / 2;
  return Obx(() => MasonryGridView.builder(
    padding: EdgeInsets.only(left: GouyiScreenAdapter.w(10),right: GouyiScreenAdapter.w(10)),
    gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
    ),
    mainAxisSpacing: GouyiScreenAdapter.w(8), //垂直间距
    crossAxisSpacing: GouyiScreenAdapter.h(8), //水平间距
    itemCount: controller.goodsList.length,
    shrinkWrap: true, //收缩，让子元素自适应宽度
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder: (BuildContext context, int index) => goodsItem(context,  controller.goodsList[index], width),
  )
  );
}
