
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/utils/app_colors.dart';
import 'package:mortalheart_gouyi/utils/app_screenAdapter.dart';
import 'package:mortalheart_gouyi/views/cart/controller/cart_controller.dart';
import 'package:mortalheart_gouyi/views/cart/widgets/cart_goodsListView.dart';
import 'package:mortalheart_gouyi/widgets/app_components.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

Widget cartListViews (BuildContext context, CartController controller) {
       return Positioned(
           left: 0,
           right: 0,
           top: 0,
           bottom: GouyiScreenAdapter.h(60),
  child: SmartRefresher(
         enablePullDown: true,
         controller: controller.refreshController,
         onRefresh: controller.onRefresh,
         header: const WaterDropMaterialHeader(
           color: Colors.white,
           backgroundColor: GouyiColors.theme,
         ),
         child: ListView(
           padding: EdgeInsets.all(GouyiScreenAdapter.w(10)),
           children: [
             ...controller.cartList
                 .map((element) =>InkWell(
               onTap: () {
                 ///判断来源
                 if (Get.arguments == null) {

                     controller.onRefresh();
                 }
               },
               child: Container(
                 margin: EdgeInsets.only(top: GouyiScreenAdapter.h(10)),
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(10)),
                   color: Colors.white,
                 ),
                 child: Column(
                   children: [
                     Container(
                       width: double.infinity,
                       // height: DoScreenAdapter.w(80),
                       padding: EdgeInsets.fromLTRB(
                         GouyiScreenAdapter.w(0), //与浮动区对齐，左不加
                         GouyiScreenAdapter.h(10),
                         GouyiScreenAdapter.w(10),
                         GouyiScreenAdapter.h(10),
                       ),
                       child: Row(
                         // crossAxisAlignment: CrossAxisAlignment.center,
                         // mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             _checkboxSection(element,controller),
                             _coverSection(element["pic"]),
                             Expanded(
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   _titleSection(element["title"]),
                                   SizedBox(height: GouyiScreenAdapter.h(5)),
                                   _attributesSection(
                                       element["selectedGoodsAttributes"]),
                                   SizedBox(height: GouyiScreenAdapter.h(10)),
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       _priceSection(element["price"]),
                                       _numSection(element,controller),
                                     ],
                                   ),
                                 ],
                               ),
                             ),
                           ]),
                     ),
                   ],
                 ),
               ),
             ))
                 .toList(),
             cartGoodsListView(context, controller)
           ],
         ),
  ),
       );
}
///-----------------子组件区-----------------
///选择区
Widget _checkboxSection(Map element ,controller) {
  return commonRoundCheckBox(element["checked"], onTap: (value) {
    controller.changeCheckboxState(element);
  });
}


///封面区
Widget _coverSection(String? pic) {
  return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(right: GouyiScreenAdapter.h(10)),
      padding: EdgeInsets.all(GouyiScreenAdapter.w(5)),
      width: GouyiScreenAdapter.w(100),
      height: GouyiScreenAdapter.w(100),
      decoration: BoxDecoration(
          color: GouyiColors.gray249,
          borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(10))),
  );
}

///标题区
Widget _titleSection(String title) {
  return Text(
    title,
    maxLines: 2,
    softWrap: true,
    overflow: TextOverflow.ellipsis,
    style:
    TextStyle(color: GouyiColors.black51, fontSize: GouyiScreenAdapter.fs(14)),
  );
}
///属性区
Widget _attributesSection(String selectedGoodsAttributes) {
  return Row(
    children: [
      InkWell(
        onTap: () {
          EasyLoading.showToast("bottomSheet显示对应商品的类型选择框");
        },
        child: Container(
          padding: EdgeInsets.all(GouyiScreenAdapter.w(5)),
          decoration: BoxDecoration(
              color: GouyiColors.gray249,
              borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(5))),
          child: Row(
            children: [
              Text(selectedGoodsAttributes,
                  style: TextStyle(
                    color: GouyiColors.black51,
                    fontSize: GouyiScreenAdapter.fs(10),
                  )),
              Icon(
                Icons.keyboard_arrow_down_outlined,
                size: GouyiScreenAdapter.fs(10),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

///价格区
Widget _priceSection(int price) {
  return Row(children: [
    Text("￥",
        style: TextStyle(
            fontSize: GouyiScreenAdapter.fs(10),
            fontWeight: FontWeight.bold,
            color: GouyiColors.theme)),
    Text("$price",
        style: TextStyle(
            fontSize: GouyiScreenAdapter.fs(16),
            fontWeight: FontWeight.bold,
            color: GouyiColors.theme)),
  ]);
}

///数量区
Widget _numSection(Map element, CartController controller) {
  return Container(
    decoration: BoxDecoration(
      // color: Colors.cyan,
        border: Border.all(color: GouyiColors.gray238, width: 0.5),
        borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(20))),
    height: GouyiScreenAdapter.h(22),
    child: Row(
      children: [
        InkWell(
          onTap: () {
            controller.minusBuyNumber(element);
          },
          child: Container(
            alignment: Alignment.center,
            width: GouyiScreenAdapter.w(36),
            child: Text(
              "-",
              style: TextStyle(
                  fontSize: GouyiScreenAdapter.fs(18),
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            border: Border(
                left: BorderSide(color: GouyiColors.gray238, width: 0.5),
                right: BorderSide(color: GouyiColors.gray238, width: 0.5)),
          ),
          alignment: Alignment.center,
          width: GouyiScreenAdapter.w(42),
          child: TextField(
            style: TextStyle(
                fontSize: GouyiScreenAdapter.fs(14),
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            textAlignVertical: TextAlignVertical.center,
            onChanged: (value) {},
            keyboardType: TextInputType.number,
            controller: TextEditingController(text: "${element["buyNumber"]}"
              // "12"
            ),
            decoration: const InputDecoration(border: InputBorder.none),
          ),
        ),
        InkWell(
          onTap: () {
            controller.plusBuyNumber(element);
          },
          child: Container(
            alignment: Alignment.center,
            width: GouyiScreenAdapter.w(36),
            child: Text(
              "+",
              style: TextStyle(
                  fontSize: GouyiScreenAdapter.fs(18),
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    ),
  );
}
