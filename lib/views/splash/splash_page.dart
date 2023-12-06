import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/utils/app_fontIcons.dart';
import 'package:mortalheart_gouyi/utils/app_screenAdapter.dart';
import 'package:mortalheart_gouyi/views/navigation/navigation_views.dart';
import 'package:mortalheart_gouyi/views/splash/controller/splash_controller.dart';

/// 开屏广告页倒计时
class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return Obx(() => controller.isShowAd.value
        ? _advertisingPage()
        : const NavigationViews());
  }

  Widget _advertisingPage() {
    return Stack(
      children: [
        Container(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: GestureDetector(
                onTap: () async => controller.adOnclick(),
                child: SvgPicture.asset(
                  GouyiSvgIcon.svgStartupDiagram,
                ),
                // child: Image.network(
                //   controller.adObj['image'] ?? '',
                //   fit: BoxFit.cover,
                // ),
              ),
            )
        ),
        Positioned(
          top: GouyiScreenAdapter.navH() + GouyiScreenAdapter.h(10),
          right: GouyiScreenAdapter.w(20),
          child: InkWell(
            onTap: () async => controller.jumpToMain(),
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(25)),
                ),
                width: GouyiScreenAdapter.w(55),
                height: GouyiScreenAdapter.h(25),
                padding: const EdgeInsets.only(left: 5,right: 5),
                // color: Colors.black.withOpacity(0.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "跳过",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                    Obx(
                      () => Text(
                        "${controller.timeCount.value}s",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: GouyiScreenAdapter.fs(15),
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                )),
          ),
        ),
        Obx(() => controller.adObj['type']== 'ad_details' ? Positioned(
            left: (GouyiScreenAdapter.screenW() - GouyiScreenAdapter.w(170)) *
                0.5,
            right: (GouyiScreenAdapter.screenW() - GouyiScreenAdapter.w(170)) *
                0.5,
            bottom:
            GouyiScreenAdapter.adapterBottomH() + GouyiScreenAdapter.h(30),
            height: GouyiScreenAdapter.h(35),
            child: InkWell(
              onTap: () async => controller.adOnclick() ,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius:
                    BorderRadius.circular(GouyiScreenAdapter.w(35))),
                child: Text(
                  "查看详情",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: GouyiScreenAdapter.fs(14),
                      fontWeight: FontWeight.bold),
                ),
              ),
            )):const Text('')
        ),
      ],
    );
  }
}
