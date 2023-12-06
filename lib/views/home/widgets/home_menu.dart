import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/utils/app_colors.dart';
import 'package:mortalheart_gouyi/utils/app_screenAdapter.dart';
import 'package:mortalheart_gouyi/views/home/controller/home_controller.dart';

const rowNum = 5;
const pageNum = rowNum * 2;
Widget homeMenu(BuildContext context,HomeController controller) {
    return Container(
      color: Colors.white,
      width: GouyiScreenAdapter.w(375),
      height: GouyiScreenAdapter.h(180),
      child: Column(
        children: [
          Expanded(flex: 1, child: menuPageList(context, controller)),
          Container(
              height: GouyiScreenAdapter.h(25),
              alignment: Alignment.center,
              child: indicator(context, controller))
        ],
      ),
    );
}

Widget indicator(BuildContext context,HomeController controller) {
  return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: (controller.menuList.length % pageNum) > 0
          ? (controller.menuList.length ~/ pageNum) + 1
          : (controller.menuList.length ~/ pageNum),
      itemBuilder: (context, index) {
        return Container(
            alignment: const Alignment(0, .5),
            height: GouyiScreenAdapter.w(10),
            width: GouyiScreenAdapter.h(10),
            child: Obx(() => controller.menuSliderIndex.value == index
                ? AnimatedOpacity(
                    opacity:
                        controller.menuSliderIndex.value == index ? 1.0 : 0.0,
                    duration: const Duration(seconds: 1000),
                    curve: Curves.fastOutSlowIn,
                    child: Container(
                      height: GouyiScreenAdapter.w(5),
                      width: GouyiScreenAdapter.h(10),
                      decoration: BoxDecoration(
                          color: GouyiColors.string2Color('#0972e6'),
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                  )
                : CircleAvatar(
                    radius: 3,
                    backgroundColor: GouyiColors.string2Color('#333333'),
                    child: Container(
                      alignment: const Alignment(0, .5),
                      height: GouyiScreenAdapter.w(10),
                      width: GouyiScreenAdapter.h(10),
                    ),
                  )));
      });
}

Widget menuPageList(BuildContext context,HomeController controller) {
  return PageView.builder(
    itemCount: (controller.menuList.length % pageNum) > 0
        ? (controller.menuList.length ~/ pageNum) + 1
        : (controller.menuList.length ~/ pageNum),
    onPageChanged: controller.setMenuSliderIndex,
    itemBuilder: (BuildContext context, int index) {
      return GridView.builder(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          itemCount: (index < (controller.menuList.length ~/ pageNum))
              ? pageNum
              : (controller.menuList.length % pageNum),
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: rowNum,
            crossAxisSpacing: GouyiScreenAdapter.w(25), //水平间距
            mainAxisSpacing: GouyiScreenAdapter.h(5), //垂直间距
            childAspectRatio: 0.65 //！！！！这个非常重要，默认是1，也就是item整体是宽高比1：1，感觉优先级比较高，
            //下面单独设置的图片container的宽高都不生效, 这个值调高一些，就会出现bottom overflowed by 26 PIXELS的报错
          ),
          itemBuilder: (context, position) {
            return GestureDetector(
              onTap: () {},
              child: Obx(
                () => Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CachedNetworkImage(
                      // height: GouyiScreenAdapter.w(40),
                      // width: GouyiScreenAdapter.h(40),
                      fit: BoxFit.fitHeight,
                      imageUrl: controller.menuList[index * pageNum + position]['menuIcon']!
                          .toString(),
                    ),
                    SizedBox(
                      height: GouyiScreenAdapter.h(5),
                    ),
                    Text(
                      controller.menuList[index * pageNum + position]['menuName']
                          .toString(),
                      style:  TextStyle(fontSize:  GouyiScreenAdapter.fs(12)),
                    ),
                  ],
                ),
              ),
            );
          });
    },
  );
}
