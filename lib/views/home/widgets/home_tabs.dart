import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/utils/app_colors.dart';
import 'package:mortalheart_gouyi/utils/app_fontIcons.dart';
import 'package:mortalheart_gouyi/utils/app_screenAdapter.dart';
import 'package:mortalheart_gouyi/views/home/controller/home_controller.dart';

Widget homeTabs(BuildContext context,HomeController controller) {
  BoxDecoration defaultBackground = const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xFFA477FC), Color(0xFFB07CF7), Color(0xFFBC8CF3), Color(0xFFCA89EE), Color(0xFFD58FEA)],
    ),
  );
  return Obx(() =>
      Opacity(
          opacity: controller.homeHeaderOpacity.value,
        child:  Container(
            height: GouyiScreenAdapter.h(controller.homeHeaderOpacity.value==1.0?30:0),
            width: GouyiScreenAdapter.screenW(),
            decoration: defaultBackground,
            alignment: Alignment.center,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width:GouyiScreenAdapter.w(330),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.tabs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                          onTap: () => controller.onTabChange(
                              controller.tabs[index]['code'], controller.tabs),
                          child: Flex(
                            direction: Axis.vertical,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(
                                        left: GouyiScreenAdapter.w(20),
                                    ),
                                    child: Obx(() => Text(
                                      controller.tabs[index]['name'] ?? "",
                                      style:  TextStyle(
                                        fontSize: GouyiScreenAdapter.fs(13),
                                        fontWeight:  controller.tabs[index]['code'] == controller.tabsCodeIndex.value  ? FontWeight.bold :FontWeight.normal,
                                        color: controller.tabs[index]['code'] == controller.tabsCodeIndex.value  ? GouyiColors.string2Color('#333333') :  Colors.white,
                                      ),
                                    ),
                                  ),
                                  ),
                              ),
                            ],
                          )
                      );
                    },
                ),
                ),
                InkWell(
                    onTap: () => controller.categoryPage(),
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(left: 5),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 5),
                            child:  SvgPicture.asset(
                              GouyiSvgIcon.svgClassify,
                              width:  GouyiScreenAdapter.w(15),
                              height: GouyiScreenAdapter.h(15),
                            ),
                          ),
                        ],
                      ),
                    )
                )
              ],
            )
        ),
      )
  );
}
