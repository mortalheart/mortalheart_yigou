
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/utils/app_screenAdapter.dart';

AppBar categoryAppBar (BuildContext context) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.white, //Colors.transparent=白色透明度为0
    elevation: 0,
    title: InkWell(
      onTap: () {
        Get.toNamed("/search");
      },
      highlightColor: Colors.transparent,
      splashColor:Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: GouyiScreenAdapter.w(300),
        height: GouyiScreenAdapter.h(26),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(246, 246, 246, 1),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.search,
              color: Colors.black26,
              size: 20,
            ),
            SizedBox(
              width: GouyiScreenAdapter.w(5),
            ),
            Text(
              "搜索",
              style: TextStyle(
                fontSize: GouyiScreenAdapter.fs(14),
                color: Colors.black45,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}