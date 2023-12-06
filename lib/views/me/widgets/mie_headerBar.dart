
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/utils/app_screenAdapter.dart';
import 'package:mortalheart_gouyi/views/me/controller/mie_controller.dart';

AppBar mieHeaderBar(BuildContext context, MieController controller) {
  return AppBar(
    centerTitle: true,
    backgroundColor:
    const Color.fromRGBO(246, 246, 246, 1), //Colors.transparent=白色透明度为0
    elevation: 0,
    actions: [
      InkWell(
        onTap: () {
        Get.toNamed('/settings');
        },
        child: Container(
            padding: EdgeInsets.only(
                right: GouyiScreenAdapter.w(10), left: GouyiScreenAdapter.w(5)),
            child: const Icon(
              Icons.settings,
              color: Colors.black87,
              size: 20,
            )),
      ),

    ],
  );
}