import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/utils/app_screenAdapter.dart';
import 'package:mortalheart_gouyi/views/category/controller/category_controller.dart';

Widget categoryRightView (BuildContext context, CategoryController controller) {
  return  Expanded(
      child: Obx(
            () => Container(
          color: Colors.white,
          child: GridView.builder(
            itemCount: controller.rightCategoryList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: GouyiScreenAdapter.w(10),
                crossAxisSpacing: GouyiScreenAdapter.w(0),
                childAspectRatio: 0.8),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {

                },
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(GouyiScreenAdapter.w(10)),
                      child:CachedNetworkImage(
                        height: GouyiScreenAdapter.h(50),
                        width: GouyiScreenAdapter.w(50),
                        imageUrl: controller.rightCategoryList[index]['pic']!,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text("${controller.rightCategoryList[index]['title']}"),
                  ],
                ),
              );
            },
          ),
        ),
      ));
}