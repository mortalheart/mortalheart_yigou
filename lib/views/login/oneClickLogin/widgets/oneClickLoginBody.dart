
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/utils/app_colors.dart';
import 'package:mortalheart_gouyi/utils/app_fontIcons.dart';
import 'package:mortalheart_gouyi/utils/app_screenAdapter.dart';
import 'package:mortalheart_gouyi/views/login/oneClickLogin/controller/one_click_login_controller.dart';
import 'package:mortalheart_gouyi/widgets/app_components.dart';

Widget oneClickLoginBody(BuildContext context, OneClickLoginController controller) {
  return Stack(
    children: [
      _listView(controller),
      commonThirdLoginView(), //键盘会顶起来，是一个问题
    ],
  );
}
Widget _listView(OneClickLoginController controller) {
  return ListView(
    padding: EdgeInsets.all(GouyiScreenAdapter.w(20)),
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        //不包个Row硬是显示不出来
        children: [
          CircleAvatar(
            radius: GouyiScreenAdapter.w(30),
            foregroundImage:
            const AssetImage(GouyiFontIcon.icAvatarDefault),
          ),
        ],
      ),
      Container(
        margin: EdgeInsets.only(bottom: GouyiScreenAdapter.h(20)),
      ),
      Text("156******69",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: GouyiScreenAdapter.fs(20),
              color: GouyiColors.black128,
              fontWeight: FontWeight.bold)),
      SizedBox(height: GouyiScreenAdapter.h(20)),
      Obx(
            () => commonProtocolView(
            isOneClick: true,
            controller.isCheckedProtocol.value, onTap: (selected) {
          controller.isCheckedProtocol.value = selected!;
        }),
      ),
      SizedBox(height: GouyiScreenAdapter.h(10)),
      ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(GouyiScreenAdapter.w(20)))),
              backgroundColor: MaterialStateProperty.all(GouyiColors.theme),
              foregroundColor: MaterialStateProperty.all(Colors.white)),
          onPressed: () {
            EasyLoading.showToast("一键登录");
          },
          child: Text("本机号码一键登录",
              style: TextStyle(
                  fontSize: GouyiScreenAdapter.fs(14),
                  fontWeight: FontWeight.bold)
          )
      ),
      TextButton(
          onPressed: () {
            Get.toNamed("/verificationCodeLogin");
          },
          child: Text("使用其他账号",
              style: TextStyle(
                  fontSize: GouyiScreenAdapter.fs(14),
                  color: GouyiColors.black51)
          )
      ),
    ],
  );
}