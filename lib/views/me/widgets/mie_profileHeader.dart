
import 'package:flutter/material.dart';
import 'package:mortalheart_gouyi/utils/app_fontIcons.dart';
import 'package:mortalheart_gouyi/utils/app_screenAdapter.dart';
import 'package:mortalheart_gouyi/views/me/controller/mie_controller.dart';

 mieProfileHeader (BuildContext context, MieController controller) {
  // return Obx(() => controller.isLogin.value
  //     ? SizedBox(
  //   height: GouyiScreenAdapter.h(45),
  //   child: Row(
  //     crossAxisAlignment: CrossAxisAlignment.center,
  //     children: [
  //       InkWell(
  //         highlightColor:Colors.transparent,
  //         splashColor:Colors.transparent,
  //         onTap: () {
  //           Get.toNamed('/personalHomepage');
  //         },
  //         child: CircleAvatar(
  //           radius: GouyiScreenAdapter.w(25),
  //           backgroundImage:
  //           const AssetImage(GouyiFontIcon.icAvatarDefault),
  //         ),
  //
  //       ),
  //       SizedBox(
  //         width: GouyiScreenAdapter.w(10),
  //       ),
  //       Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text(
  //             "姓名",
  //             style: TextStyle(
  //                 fontSize: GouyiScreenAdapter.fs(14),
  //                 fontWeight: FontWeight.bold),
  //           ),
  //           SizedBox(height: GouyiScreenAdapter.h(5)),
  //           Row(
  //             children: [
  //               Container(
  //                 padding: EdgeInsets.all(GouyiScreenAdapter.w(3)),
  //                 decoration: BoxDecoration(
  //                     color: GouyiColors.gray238,
  //                     borderRadius:
  //                     BorderRadius.circular(GouyiScreenAdapter.w(10))),
  //                 child: Text(
  //                   "123123",
  //                   style: TextStyle(fontSize: GouyiScreenAdapter.fs(10)),
  //                 ),
  //               ),
  //               SizedBox(width: GouyiScreenAdapter.w(10)),
  //               InkWell(
  //                 onTap: () {
  //                   Get.toNamed('/vipMedal');
  //                 },
  //                 child: Container(
  //                     padding: EdgeInsets.all(GouyiScreenAdapter.w(3)),
  //                     decoration: BoxDecoration(
  //                         color: GouyiColors.gray238,
  //                         borderRadius: BorderRadius.circular(
  //                             GouyiScreenAdapter.w(10))),
  //                     child: Row(
  //                       children: [
  //                         Text(
  //                           "勋章5枚",
  //                           style: TextStyle(
  //                               fontSize: GouyiScreenAdapter.fs(10)),
  //                         ),
  //                         const Icon(
  //                           Icons.arrow_forward_ios_outlined,
  //                           size: 10,
  //                           color: Colors.black26,
  //                         )
  //                       ],
  //                     )),
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ],
  //   ),
  // )
  //     : SizedBox(
  //   height: GouyiScreenAdapter.h(40),
  //   child: InkWell(
  //     onTap: () {
  //       ///一键登录页面
  //       Get.toNamed("/oneClickLoginView");
  //       ///验证码登录
  //
  //     },
  //     child: Row(
  //       children: [
  //         CircleAvatar(
  //           radius: GouyiScreenAdapter.w(25),
  //           backgroundImage:
  //           const AssetImage(GouyiFontIcon.icAvatarDefault),
  //         ),
  //         SizedBox(
  //           width: GouyiScreenAdapter.w(10),
  //         ),
  //         const Text(
  //           "登录/注册",
  //           style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
  //         ),
  //         const Icon(
  //           Icons.arrow_forward_ios_outlined,
  //           size: 10,
  //           color: Colors.black26,
  //         )
  //       ],
  //     ),
  //   ),
  // )
  // );

   BoxDecoration defaultBackground = const BoxDecoration(
     gradient: LinearGradient(
       begin: Alignment.topLeft,
       end: Alignment.bottomRight,
       colors: [Color(0xFFA477FC), Color(0xFFB07CF7), Color(0xFFBC8CF3), Color(0xFFCA89EE), Color(0xFFD58FEA)],
     ),
   );

   Widget title = Positioned(
     top: 0,
     left: (getScreenWidth(context) - 100) / 2,
     child: Container(
       width: 100,
       height: 36,
       alignment: Alignment.center,
       child: ValueListenableBuilder<double>(
         builder: (BuildContext context, double value, Widget? child) {
           HeaderSize headerSize = calcSize(value);
           return Opacity(
             opacity: headerSize.opacity,
             child: const Text(
              '名称',
               style: TextStyle(color: Colors.black, fontSize: 20),
             ),
           );
         },
         valueListenable: controller.pageScrollY,
       ),
     ),
   );
   Widget header = ValueListenableBuilder<double>(
     builder: (BuildContext context, double value, Widget? child) {
       HeaderSize headerSize = calcSize(value);
       return Positioned(
         top: headerSize.top,
         left: 0,
         child: Container(
           width: headerSize.size,
           height: headerSize.size,
           margin: const EdgeInsets.only(left: 16),
           decoration:  const ShapeDecoration(
             shape: CircleBorder(),
             image: DecorationImage(
               fit: BoxFit.contain,
               image: AssetImage(GouyiFontIcon.headerIn),
             ),
           ),
         ),
       );
     },
     valueListenable: controller.pageScrollY,
   );

   Widget userInfo = ValueListenableBuilder<double>(
     builder: (BuildContext context, double value, Widget? child) {
       HeaderSize headerSize = calcSize(value);
       return Positioned(
         top: headerSize.name2Top,
         left: 100,
         child: SizedBox(
           width: getScreenWidth(context) - 100,
           height: 60,
           child: Opacity(
             opacity: 1 - headerSize.opacity,
             child: child,
           ),
         ),
       );
     },
     valueListenable: controller.pageScrollY,
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       mainAxisAlignment: MainAxisAlignment.spaceAround,
       children: [
         const Text(
          '李四',
           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
         ),
         Row(
           children: [
             const Text("积分: 200", style: TextStyle(fontSize: 14)),
             Container(
               margin: const EdgeInsets.only(left: 20),
               child: const Text(
                 "1200",
                 style: TextStyle(fontSize: 14),
               ),
             )
           ],
         )
       ],
     ),
   );

  return Container(
    height: 130 + getStatusHeight(context),
    padding: EdgeInsets.only(top: getStatusHeight(context)),
    decoration: defaultBackground,
    child: Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: [
        Positioned(
          top: 4,
          right: 116,
         child: Container(
           width: 20,
           height: 20,
           color: Colors.blue,
         ),
        ),
        Positioned(
          top: 4,
          right: 66,
          child: Container(
            width: 20,
            height: 20,
            color: Colors.black,
          ),
        ),
        Positioned(
          top: 4,
          right: 18,
          child: Container(
            width: 20,
            height: 20,
            color: Colors.deepPurple,
          ),
        ),
        title,
        header,
        userInfo
      ],
    ),
  );

}

double maxTop = 40;
double minTop = 4;
double nameMaxTop = 48;
double maxSize = 70;
double minSize = 30;
double maxOpacity = 1;
double minOpacity = 0;

HeaderSize calcSize(double y) {
  double toTop = maxTop - y * 0.8;
  double name2Top = nameMaxTop - y * 0.8;
  double realSize = maxSize - y * 0.8;
  double opacity = minOpacity + y * 0.01;
  if (toTop < minTop) toTop = minTop;
  if (toTop > maxTop) toTop = maxTop;
  if (name2Top < minTop) name2Top = minTop;
  if (name2Top > nameMaxTop) name2Top = nameMaxTop;
  if (realSize > maxSize) realSize = maxSize;
  if (realSize < minSize) realSize = minSize;

  if (opacity > maxOpacity) opacity = maxOpacity;
  if (opacity < minOpacity) opacity = minOpacity;

  return HeaderSize(toTop, name2Top, realSize, opacity);
}

class HeaderSize {
  double top;
  double name2Top;
  double size;
  double opacity;

  HeaderSize(this.top, this.name2Top, this.size, this.opacity);
}
