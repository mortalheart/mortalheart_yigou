import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/utils/app_asset_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:mortalheart_gouyi/utils/app_colors.dart';
import 'package:mortalheart_gouyi/utils/app_fontIcons.dart';
import 'package:mortalheart_gouyi/utils/app_screenAdapter.dart';
import 'package:mortalheart_gouyi/views/home/controller/home_controller.dart';
import 'package:mortalheart_gouyi/widgets/marquee_widget.dart';

Widget homeHeader(BuildContext context,HomeController controller) {
    // TODO: implement build
  BoxDecoration defaultBackground = const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xFFA477FC), Color(0xFFB07CF7), Color(0xFFBC8CF3), Color(0xFFCA89EE), Color(0xFFD58FEA)],
    ),
  );
  return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Obx(() => Opacity(
            opacity: controller.homeHeaderOpacity.value,
            child: SizedBox(
              height:GouyiScreenAdapter.h(75),
              child: Stack(
                alignment: Alignment.center,
                fit: StackFit.expand,
                children: [
                  Positioned(
                    top: 0,
                    right: 0,
                    bottom: 0,
                    left: 0,
                    child: controller.headerBackgroundImage.value.isNotEmpty
                        ? CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: controller.headerBackgroundImage.value,
                          )
                        :  Container(
                                decoration: defaultBackground,
                              ),
                  ),
                  Positioned(
                      top: GouyiScreenAdapter.h(35),
                      child: Container(
                        width: GouyiScreenAdapter.w(340),
                        height: GouyiScreenAdapter.h(28),
                        padding:  EdgeInsets.only(left: GouyiScreenAdapter.w(10), right: GouyiScreenAdapter.w(10)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            assetImage(
                                    GouyiFontIcon.search,
                                    GouyiScreenAdapter.w(18),
                                    GouyiScreenAdapter.h(18)
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: GouyiScreenAdapter.h(30),
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(left: 10),
                                child: InkWell(
                                  onTap: () => {
                                  Get.toNamed("/search")
                                  },
                                  child: buildMarqueeWidget(controller),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () =>{
                                controller.openscan()
                              },
                              child: assetImage(
                                      GouyiFontIcon.icScan,
                                      GouyiScreenAdapter.w(18),
                                      GouyiScreenAdapter.h(18)),
                            ),

                            Container(
                              margin:  EdgeInsets.only(left: GouyiScreenAdapter.w(5), right: GouyiScreenAdapter.w(5)),
                              width: 1,
                              height: 12,
                              child: const DecoratedBox(
                                decoration:
                                    BoxDecoration(color: Colors.black12),
                              ),
                            ),
                            InkWell(
                              onTap: () =>{
                                controller.openscan()
                              },
                              child: assetImage(
                                      GouyiFontIcon.icCamera,
                                      GouyiScreenAdapter.w(18),
                                      GouyiScreenAdapter.h(18)),
                            ),

                          ],
                        ),
                      )),
                ],
              ),
            ),
          )
      )
  );
}

MarqueeWidget buildMarqueeWidget(HomeController controller) {
  List itemStr = controller.searchList;

  ///上下轮播 安全提示
  return MarqueeWidget(
    //子Item构建器
    itemBuilder: (BuildContext context, int index) {
      //通常可以是一个 Text文本
      return Text(
        controller.searchList.isNotEmpty?itemStr[index]["title"]:'',
        textAlign: TextAlign.left,
        style: TextStyle(
            color: GouyiColors.gray154, height: GouyiScreenAdapter.h(2.0)),
      );
    },
    //循环的提示消息数量
    count: itemStr.length,
  );
}

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, 0);
    path.lineTo(0, size.height - 30);

    var firstPoint = Offset(size.width / 2, size.height);

    var endPoint = Offset(size.width, size.height - 30);

    path.quadraticBezierTo(
        firstPoint.dx, firstPoint.dy, endPoint.dx, endPoint.dy);

    path.lineTo(size.width, 0);

    // path.lineTo(0,0);
    // path.lineTo(0,size.height-40);
    //
    // var firstPoint=Offset(size.width/4,size.height);
    // var secondPoint=Offset(size.width/2.25,size.height-30);
    // path.quadraticBezierTo(firstPoint.dx, firstPoint.dy, secondPoint.dx, secondPoint.dy);
    //
    // var thirdPoint=Offset(size.width/4*3,size.height-90);
    // var fourthPoint=Offset(size.width,size.height-40);
    // path.quadraticBezierTo(thirdPoint.dx, thirdPoint.dy, fourthPoint.dx, fourthPoint.dy);
    //
    // path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
