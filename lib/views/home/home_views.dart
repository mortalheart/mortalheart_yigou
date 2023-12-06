import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/utils/app_colors.dart';
import 'package:mortalheart_gouyi/views/home/controller/home_controller.dart';
import 'package:mortalheart_gouyi/views/home/widgets/home_conentViews.dart';
import 'package:mortalheart_gouyi/views/home/widgets/home_header.dart';
import 'package:mortalheart_gouyi/widgets/keepAliveWrapper.dart';
class HomeViews extends GetView<HomeController> {
  const HomeViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return KeepAliveWrapper(
      child: Scaffold(
        backgroundColor: GouyiColors.gray249,
        body: Stack(
          children: [
            homeContentView(context,controller),
            homeHeader(context, controller),
          ],
        ),
      ),
    );
  }
}