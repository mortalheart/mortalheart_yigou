import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;
import 'package:mortalheart_gouyi/utils/app_colors.dart';
import 'package:mortalheart_gouyi/utils/app_fontIcons.dart';
import 'package:mortalheart_gouyi/utils/app_screenAdapter.dart';
import 'package:mortalheart_gouyi/views/navigation/controller/navigation_controller.dart';

class NavigationViews extends GetView<NavigationController> {
  const NavigationViews({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: controller.pages,
        ),
        bottomNavigationBar: Theme(
          data: ThemeData(
            brightness: Brightness.light,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
              enableFeedback: false,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              selectedItemColor:GouyiColors.string2Color('#0972e6'),
              unselectedItemColor: GouyiColors.string2Color('#333333'),
              currentIndex: controller.currentIndex.value,
              selectedLabelStyle:
                  TextStyle(fontSize: GouyiScreenAdapter.fs(12)),
              unselectedLabelStyle:
                  TextStyle(fontSize: GouyiScreenAdapter.fs(12)),
              onTap: (value) {
                controller.setCurrentIndex(value);
              },
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(GouyiSvgIcon.svgHome,
                    width:  GouyiScreenAdapter.w(20),
                    height: GouyiScreenAdapter.h(20),
                  ),
                  activeIcon: SvgPicture.asset(GouyiSvgIcon.svgHomeActive,
                    width:  GouyiScreenAdapter.w(20),
                    height: GouyiScreenAdapter.h(20),
                  ),
                  label: "首页",

                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(GouyiSvgIcon.svgFound,
                    width:  GouyiScreenAdapter.w(20),
                    height: GouyiScreenAdapter.h(20),
                  ),
                  activeIcon: SvgPicture.asset(GouyiSvgIcon.svgFoundActive,
                    width:  GouyiScreenAdapter.w(20),
                    height: GouyiScreenAdapter.h(20),
                  ),
                  label: "发现",

                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(GouyiSvgIcon.svgMessage,
                    width:  GouyiScreenAdapter.w(20),
                    height: GouyiScreenAdapter.h(20),
                  ),
                  activeIcon: SvgPicture.asset(GouyiSvgIcon.svgMessageActive,
                    width:  GouyiScreenAdapter.w(20),
                    height: GouyiScreenAdapter.h(20),
                  ),
                  label: "消息",

                ),
                BottomNavigationBarItem(
                    icon: badges.Badge(
                      position: badges.BadgePosition.topEnd(
                          top: GouyiScreenAdapter.h(-5),
                          end: GouyiScreenAdapter.w(-15)
                      ),
                      badgeAnimation: const badges.BadgeAnimation.rotation(
                        animationDuration: Duration(seconds: 1),
                        colorChangeAnimationDuration: Duration(seconds: 1),
                        loopAnimation: false,
                        curve: Curves.fastOutSlowIn,
                        colorChangeAnimationCurve: Curves.easeInCubic,
                      ),
                      badgeStyle: badges.BadgeStyle(
                          padding: EdgeInsets.all(GouyiScreenAdapter.w(5))),
                      badgeContent: Container(
                        alignment: Alignment.center,
                        child: Text("99",
                            style: TextStyle(
                                fontSize: GouyiScreenAdapter.fs(10),
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                      child:SvgPicture.asset(
                        GouyiSvgIcon.svgCart,
                        width:  GouyiScreenAdapter.w(20),
                        height: GouyiScreenAdapter.h(20),
                      ),
                    ),
                    activeIcon: badges.Badge(
                        position: badges.BadgePosition.topEnd(
                            top: GouyiScreenAdapter.h(-5),
                            end: GouyiScreenAdapter.w(-15)),
                        badgeAnimation: const badges.BadgeAnimation.rotation(
                          animationDuration: Duration(seconds: 1),
                          colorChangeAnimationDuration: Duration(seconds: 1),
                          loopAnimation: false,
                          curve: Curves.fastOutSlowIn,
                          colorChangeAnimationCurve: Curves.easeInCubic,
                        ),
                        badgeStyle: badges.BadgeStyle(
                            padding: EdgeInsets.all(GouyiScreenAdapter.w(5))),
                        badgeContent: Container(
                          alignment: Alignment.center,
                          child: Text("99",
                              style: TextStyle(
                                  fontSize: GouyiScreenAdapter.fs(10),
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                        child: SvgPicture.asset(
                             GouyiSvgIcon.svgCartActive,
                            width:  GouyiScreenAdapter.w(20),
                            height: GouyiScreenAdapter.h(20),
                        ),
                    ),
                    label: "购物车"),
                BottomNavigationBarItem(
                    icon:  SvgPicture.asset(
                      GouyiSvgIcon.svgMine,
                      width:  GouyiScreenAdapter.w(20),
                      height: GouyiScreenAdapter.h(20),
                    ),
                    activeIcon: SvgPicture.asset(
                      GouyiSvgIcon.svgMineActive,
                      width:  GouyiScreenAdapter.w(20),
                      height: GouyiScreenAdapter.h(20),
                    ),
                    label: "我的")
              ]),
        ),
      ),
    );
  }
}
