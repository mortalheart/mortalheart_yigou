import 'package:flutter/material.dart';
import 'package:mortalheart_gouyi/utils/app_asset_image.dart';
import 'package:mortalheart_gouyi/utils/app_colors.dart';
import 'package:mortalheart_gouyi/utils/app_fontIcons.dart';
import 'package:mortalheart_gouyi/utils/app_screenAdapter.dart';
import 'package:mortalheart_gouyi/views/found/controller/found_controller.dart';
import 'package:get/get.dart';

 foundHeader(BuildContext context, FoundController controller) {
  // TODO: implement build
  BoxDecoration defaultBackground =  const BoxDecoration(
  color: Color.fromRGBO(16, 16, 16, 0.3)
  );
  return Positioned(
    top: 0,
    left: 0,
    right: 0,
    child: Container(
        decoration: defaultBackground,
        height:GouyiScreenAdapter.h(85),
        child:Container(
            margin: EdgeInsets.only(top: GouyiScreenAdapter.statusH() - 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: GouyiScreenAdapter.w(50),
                  height: GouyiScreenAdapter.h(50),
                  child: assetImage(GouyiFontIcon.headerIn, GouyiScreenAdapter.w(50), GouyiScreenAdapter.w(50)),
                ),
                Container(
                  width: GouyiScreenAdapter.w(240),
                  height: GouyiScreenAdapter.h(25),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: controller.tabs.map((element) =>
                        InkWell(
                          onTap: () => controller.onTabChange(element),
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            padding: EdgeInsets.only(left: GouyiScreenAdapter.w(10),right: GouyiScreenAdapter.w(10)),
                            child: Obx(() => Text(
                              element['name'],
                              style:  TextStyle(
                                fontSize: GouyiScreenAdapter.fs(14),
                                fontWeight:  element['code'] == controller.tabsCodeIndex.value  ? FontWeight.bold :FontWeight.normal,
                                color: element['code'] == controller.tabsCodeIndex.value  ? GouyiColors.string2Color('#333333') :  Colors.white,
                              ),
                            )),
                          ),
                        )
                    ).toList(),
                  ),
                ),
                Container(
                    height: GouyiScreenAdapter.h(25),
                    alignment: Alignment.bottomCenter,
                    child:Image(
                        image: const AssetImage(GouyiFontIcon.search),
                        width: GouyiScreenAdapter.w(20),
                        height: GouyiScreenAdapter.w(20),
                        fit: BoxFit.contain
                    )
                ),
              ],
            )
        )
    )
  );
}