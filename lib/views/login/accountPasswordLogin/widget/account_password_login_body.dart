
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/models/response_model.dart';
import 'package:mortalheart_gouyi/utils/app_colors.dart';
import 'package:mortalheart_gouyi/utils/app_screenAdapter.dart';
import 'package:mortalheart_gouyi/views/login/accountPasswordLogin/controller/account_password_login_controller.dart';
import 'package:mortalheart_gouyi/widgets/app_components.dart';

Widget accountPasswordLoginBody (BuildContext context, AccountPasswordLoginController controller) {
  return Stack(
    children: [
      _listView(controller),
      commonThirdLoginView(),
    ],
  );
}

Widget _listView (AccountPasswordLoginController controller) {
  return GestureDetector(
    onTap: () {
      //自动收起键盘
      FocusScope.of(Get.context!).requestFocus(FocusNode());
    },
    child: ListView(
      padding: EdgeInsets.all(GouyiScreenAdapter.w(20)),
      children: [
        commonLogoView(),
        Container(
          alignment: Alignment.center,
          height: GouyiScreenAdapter.h(50),
          padding: EdgeInsets.only(left: GouyiScreenAdapter.w(15)),
          decoration: BoxDecoration(
              color: GouyiColors.gray249,
              borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(10))),
          child: TextField(
            inputFormatters: [LengthLimitingTextInputFormatter(11)],
            textAlignVertical: TextAlignVertical.center,
            controller: controller.accountController,
            keyboardType: TextInputType.number,
            cursorColor: GouyiColors.theme,
            style: TextStyle(
                color: GouyiColors.black0,
                fontSize: GouyiScreenAdapter.fs(16),
                fontWeight: FontWeight.bold),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "手机号/轻松购账号/邮箱",
                hintStyle: TextStyle(
                    color: GouyiColors.gray168,
                    fontSize: GouyiScreenAdapter.fs(16),
                    fontWeight: FontWeight.bold),
                suffixIcon: InkWell(
                    onTap: () {
                      controller.accountController.text = "";
                    },
                    child: Icon(Icons.close_outlined,
                        size: GouyiScreenAdapter.fs(18)))),
            onChanged: (value) {
              controller.updateLoginButtonState();
            },
            onSubmitted: (value) {},
          ),
        ),
        SizedBox(height: GouyiScreenAdapter.h(10)),
        Obx(
              () => Container(
            alignment: Alignment.center,
            height: GouyiScreenAdapter.h(50),
            padding: EdgeInsets.only(left: GouyiScreenAdapter.w(15)),
            decoration: BoxDecoration(
                color: GouyiColors.gray249,
                borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(10))),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    controller: controller.passwordController,
                    keyboardType: TextInputType.text,
                    cursorColor: GouyiColors.theme,
                    obscuringCharacter: "*",
                    obscureText: controller.isObscure.value,
                    style: TextStyle(
                        color: GouyiColors.black0,
                        fontSize: GouyiScreenAdapter.fs(16),
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "密码",
                      hintStyle: TextStyle(
                          color: GouyiColors.gray168,
                          fontSize: GouyiScreenAdapter.fs(16),
                          fontWeight: FontWeight.bold),
                      suffixIcon: InkWell(
                          onTap: () {
                            controller.passwordController.text = "";
                          },
                          child: Icon(Icons.close_outlined,
                              size: GouyiScreenAdapter.fs(18))),
                    ),
                    onChanged: (value) {
                      controller.updateLoginButtonState();
                    },
                    onSubmitted: (value) {},
                  ),
                ),
                InkWell(
                  onTap: () {
                    controller.updateObscureState();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: GouyiScreenAdapter.w(15)),
                    child: Icon(
                        controller.isObscure.value
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        size: GouyiScreenAdapter.fs(18),
                        color: Colors.black38),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: GouyiScreenAdapter.h(20)),
        Obx(
              () => commonProtocolView(
            controller.isCheckedProtocol.value,
            onTap: (selected) {
              controller.isCheckedProtocol.value = selected!;
            },
          ),
        ),
        SizedBox(height: GouyiScreenAdapter.h(10)),
        Obx(
              () => ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(GouyiScreenAdapter.w(20)))),
                  backgroundColor: MaterialStateProperty.all(
                      controller.isLoginButtonEnable.value
                          ? GouyiColors.theme
                          : GouyiColors.yellow253),
                  foregroundColor: MaterialStateProperty.all(Colors.white)),
              onPressed: !controller.isLoginButtonEnable.value
                  ? null
                  : () async {
                if (GetUtils.isPhoneNumber(
                    controller.accountController.text)) {
                  if (controller.isCheckedProtocol.value) {
                    FocusScope.of(Get.context!)
                        .requestFocus(FocusNode());
                    // EasyLoading.show();
                    EasyLoading.show(status: "登录中...");
                    ResponseModel response = await controller.login();
                    if (response.success) {
                      // Get.offAllNamed("/tabs",
                      //     arguments: {"initialPage": 4});
                      Get.back(); //替换路由
                      EasyLoading.showSuccess(response.message);
                    } else {
                      EasyLoading.showError(response.message);
                    }
                  } else {
                    EasyLoading.showToast("请先同意协议");
                  }
                } else {
                  EasyLoading.showError("请输入正确手机号");
                }
              },
              child: Text("登录",
                  style: TextStyle(
                      fontSize: GouyiScreenAdapter.fs(14),
                      fontWeight: FontWeight.bold))),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () {
                },
                child: Text("忘记密码",
                    style: TextStyle(
                        fontSize: GouyiScreenAdapter.fs(14),
                        color: GouyiColors.black51))),
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("验证码登录",
                    style: TextStyle(
                        fontSize: GouyiScreenAdapter.fs(14),
                        color: GouyiColors.black51)))
          ],
        ),
      ],
    ),
  );
}