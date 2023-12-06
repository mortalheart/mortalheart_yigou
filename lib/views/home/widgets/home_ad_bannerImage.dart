
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/utils/app_screenAdapter.dart';
import 'package:mortalheart_gouyi/views/home/controller/home_controller.dart';

Widget homeAdBannerImage(BuildContext context,HomeController controller) {
    return GestureDetector(
      onTap: () => {},
      child: Obx(() => controller.adUrl.value.isNotEmpty ? Container(
        width: GouyiScreenAdapter.screenW(),
        margin: EdgeInsets.only(bottom: GouyiScreenAdapter.h(8)),
        child: CachedNetworkImage(
          height: GouyiScreenAdapter.h(40),
          imageUrl: controller.adUrl.value,
          fit: BoxFit.fill,
        ),
      ):Container()
      ),
    );

}
