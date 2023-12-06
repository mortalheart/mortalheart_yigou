
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/utils/app_colors.dart';
import 'package:mortalheart_gouyi/utils/app_screenAdapter.dart';
import 'package:mortalheart_gouyi/views/cart/controller/cart_controller.dart';
import 'package:mortalheart_gouyi/widgets/app_components.dart';

Widget cartFloatingView (BuildContext context, CartController controller) {
  return Container(
    height: GouyiScreenAdapter.h(50),
    decoration: const BoxDecoration(
        color: Colors.white,
        border:
        Border(top: BorderSide(width: 0.5, color: GouyiColors.gray238))),
    padding: EdgeInsets.all(GouyiScreenAdapter.w(10)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            commonRoundCheckBox(controller.checkedAllState.value,
                onTap: (value) {
                  controller.changeCheckedAllBoxState(value);
                }),
            Text(
              "全选",
              style: TextStyle(
                  fontSize: GouyiScreenAdapter.fs(14),
                  fontWeight: FontWeight.bold,
                  color: GouyiColors.black51),
            )
          ],
        ),
        Obx(
              () => controller.isEditing.value
              ? Row(
            children: [
              InkWell(
                onTap: () {
                  ///删除和与结算共用一套选中逻辑，要是分开各自记录，就特别麻烦了，相关的都得两套
                  if (controller.checkedTotalCount.value > 0) {
                    controller.deleteGoods();
                    EasyLoading.showToast("移入收藏夹并删除");
                  } else {
                    EasyLoading.showToast("请勾选需要删除的商品");
                  }
                },
                child: Container(
                  margin:
                  EdgeInsets.only(left: GouyiScreenAdapter.w(10)),
                  padding: EdgeInsets.fromLTRB(
                      GouyiScreenAdapter.w(15),
                      GouyiScreenAdapter.h(0),
                      GouyiScreenAdapter.w(15),
                      GouyiScreenAdapter.h(0)),
                  height: GouyiScreenAdapter.h(30),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                          GouyiScreenAdapter.w(30)),
                      border: Border.all(
                          color: GouyiColors.gray186,
                          width: GouyiScreenAdapter.w(1))),
                  alignment: Alignment.center,
                  child: Text(
                    (controller.checkedTotalCount.value > 0)
                        ? "移入收藏 (${controller.checkedTotalCount.value})"
                        : "移入收藏",
                    style: TextStyle(
                        color: GouyiColors.gray154,
                        fontSize: GouyiScreenAdapter.fs(14)),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  if (controller.checkedTotalCount.value > 0) {
                    ///弹框，确定删除
                    controller.deleteGoods();
                    EasyLoading.showToast("删除成功");
                  } else {
                    EasyLoading.showToast("请勾选需要删除的商品");
                  }
                },
                child: Container(
                  margin:
                  EdgeInsets.only(left: GouyiScreenAdapter.w(10)),
                  padding: EdgeInsets.fromLTRB(
                      GouyiScreenAdapter.w(15),
                      GouyiScreenAdapter.h(0),
                      GouyiScreenAdapter.w(15),
                      GouyiScreenAdapter.h(0)),
                  height: GouyiScreenAdapter.h(30),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                          GouyiScreenAdapter.w(30)),
                      border: Border.all(
                          color: GouyiColors.gray154,
                          width: GouyiScreenAdapter.w(1))),
                  alignment: Alignment.center,
                  child: Text(
                    (controller.checkedTotalCount.value > 0)
                        ? "删除 (${controller.checkedTotalCount.value})"
                        : "删除",
                    style: TextStyle(
                        color: GouyiColors.gray154,
                        fontSize: GouyiScreenAdapter.fs(14)),
                  ),
                ),
              ),
            ],
          )
              : Row(
            children: [
              InkWell(
                onTap: () async {
                  Get.toNamed("/checkout", arguments: {
                    "checkoutList": controller.getCheckedList(),
                    "checkedTotalCount": controller.checkedTotalCount.value,
                    "checkedTotalPrice": controller.checkedTotalPrice.value,
                  });
        
                },
                child: Container(
                  margin:
                  EdgeInsets.only(left: GouyiScreenAdapter.w(10)),
                  padding: EdgeInsets.fromLTRB(
                      GouyiScreenAdapter.w(15),
                      GouyiScreenAdapter.h(5),
                      GouyiScreenAdapter.w(15),
                      GouyiScreenAdapter.h(5)),
                  width: GouyiScreenAdapter.w(100),
                  height: GouyiScreenAdapter.h(30),
                  decoration: BoxDecoration(
                      color: GouyiColors.theme,
                      borderRadius: BorderRadius.circular(
                          GouyiScreenAdapter.w(30))),
                  alignment: Alignment.center,
                  child: Text(
                    (controller.checkedTotalCount.value > 0)
                        ? "去结算 (${controller.checkedTotalCount.value})"
                        : "去结算",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: GouyiScreenAdapter.fs(16)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}