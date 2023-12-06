import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/utils/app_colors.dart';
import 'package:mortalheart_gouyi/utils/app_screenAdapter.dart';
import 'package:mortalheart_gouyi/views/settings/controller/settings_controller.dart';
import 'package:mortalheart_gouyi/widgets/app_components.dart';

Widget settingsBody(BuildContext context, SettingsController controller) {
  return Obx(
        () => ListView(
      children: [
        controller.isLogin.value
            ? Column(
          children: [
            commonListTile("密保手机", onTap: () {}),
            commonListTile("收货地址", onTap: () {}),
            Container(
                height: GouyiScreenAdapter.h(10),
                color: GouyiColors.gray238
            ),
            commonListTile("消息推送", onTap: () {}),
            commonListTile("隐私设置", onTap: () {})
          ],
        )
            : const SizedBox(width: 0),

        commonListTile("轻松购商城隐私政策", onTap: () {}),
        commonListTile("轻松购商城隐私政策-简要版", onTap: () {}),
        Container(
            height: GouyiScreenAdapter.h(10),
            color: GouyiColors.gray238
        ),
        commonListTile("关于商城", onTap: () {}),
        commonListTile("网络诊断", onTap: () {}),
        commonListTile("个人信息收集与使用清单", onTap: () {}),
        commonListTile("个人信息第三方共享清单", onTap: () {}),
        commonListTile("协议规则", onTap: () {}),
        commonListTile("资质证照", onTap: () {}),
        commonListTile("轻松购商城用户协议", onTap: () {}),
        commonListTile("轻松购账号用户协议", onTap: () {}),
        commonListTile("轻松购账号隐私政策", onTap: () {}),
        Container(
            height: GouyiScreenAdapter.h(10),
        ),
        TextButton(
          onPressed: () {
            _showLogoutAlertDialog();
          },
          child: Text("退出账号",
              style: TextStyle(
                  fontSize: GouyiScreenAdapter.fs(14),
                  color: GouyiColors.theme)
          ),
        )
      ],
    ),
  );
}
void _showLogoutAlertDialog() async {
  await showCupertinoDialog(
    context: Get.context!,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: const Text(
          "温馨提示",
        ),
        content: const Text("确定要退出登录么？"),
        actions: [
          TextButton(
            onPressed: () {
              EasyLoading.showSuccess("退出登录");
            },
            child: const Text("确定",
                style: TextStyle(
                    fontSize: 14,
                    color: GouyiColors.theme)
            ),
          ),
          TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("取消"))
        ],
      );
    },
  );
}