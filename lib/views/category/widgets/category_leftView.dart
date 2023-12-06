
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/utils/app_colors.dart';
import 'package:mortalheart_gouyi/utils/app_screenAdapter.dart';
import 'package:mortalheart_gouyi/views/category/controller/category_controller.dart';

Widget categoryLeftView(BuildContext context, CategoryController controller) {
  return SizedBox(
    width: GouyiScreenAdapter.w(90),
    child: Obx(
          () => Container(
        color: Colors.white,
        child: ListView.builder(
            itemCount: controller.leftCategoryList.length,
            itemBuilder: (context, index) {
              return Obx(
                    () => InkWell(
                  onTap: () {
                    controller.changeIndex(
                        index, controller.leftCategoryList[index]['_id']);
                  },
                  child: Container(
                    // color:
                    // Colors.white, //若是为了设置背景色，也可以在listView外面再包一层container来设置
                    color: controller.selectIndex.value == index
                        ? GouyiColors.gray249
                        : Colors.white,
                    height: GouyiScreenAdapter.h(50),
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Container(
                          width: GouyiScreenAdapter.w(4),
                          height: GouyiScreenAdapter.h(18),
                          color: controller.selectIndex.value == index
                              ? GouyiColors.string2Color('#666EE8')
                              : Colors.white,
                        ),
                        Padding(
                          padding:
                          EdgeInsets.only(left: GouyiScreenAdapter.w(20)),
                          child: Text(
                            "${controller.leftCategoryList[index]['title']}",
                            style: TextStyle(
                                fontWeight:
                                controller.selectIndex.value == index
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
        ),
      ),
    ),
  );
}