
import 'package:flutter/material.dart';
import 'package:mortalheart_gouyi/utils/app_screenAdapter.dart';
import 'package:mortalheart_gouyi/views/me/controller/mie_controller.dart';

Widget mieMallVIP (BuildContext context, MieController controller) {
  return Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(GouyiScreenAdapter.h(8)),
      color: Colors.green,
    ),
    height: GouyiScreenAdapter.h(60),
    child: const Text('加入会员'),
  );
}