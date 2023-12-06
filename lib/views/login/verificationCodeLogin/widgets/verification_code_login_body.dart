import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/models/response_model.dart';
import 'package:mortalheart_gouyi/utils/app_colors.dart';
import 'package:mortalheart_gouyi/utils/app_screenAdapter.dart';
import 'package:mortalheart_gouyi/views/login/verificationCodeLogin/controller/verification_code_login_controller.dart';
import 'package:mortalheart_gouyi/widgets/app_components.dart';

Widget verificationCodeLoginBody(BuildContext context, VerificationCodeLoginController controller){
  return Stack(
    children: [
      _listView(controller),
      commonThirdLoginView(),
    ],
  );
}

Widget _listView(VerificationCodeLoginController controller) {
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
          height: GouyiScreenAdapter.h(50),
          padding: EdgeInsets.only(left: GouyiScreenAdapter.w(15)),
          decoration: BoxDecoration(
              color: GouyiColors.gray249,
              borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(10))),
          child: Row(
            children: [
              Row(children: [
                Text("+86",
                    style: TextStyle(
                        fontSize: GouyiScreenAdapter.fs(16),
                        color: GouyiColors.black128,
                        fontWeight: FontWeight.bold)),
                Icon(
                  Icons.arrow_drop_down_outlined,
                  size: GouyiScreenAdapter.fs(15),
                )
              ]),
              SizedBox(width: GouyiScreenAdapter.w(10)),
              Expanded(
                child: TextField(
                  inputFormatters: [LengthLimitingTextInputFormatter(11)],
                  textAlignVertical: TextAlignVertical.center,
                  controller: controller.phoneController,
                  keyboardType: TextInputType.number,
                  cursorColor: GouyiColors.theme,
                  style: TextStyle(
                      color: GouyiColors.black0,
                      fontSize: GouyiScreenAdapter.fs(16),
                      fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    // contentPadding: EdgeInsets.zero,//这个设置不设置，都主要看textAlignVertical才能使水平居中
                      border: InputBorder.none,
                      hintText: "请输入手机号",
                      hintStyle: TextStyle(
                          color: GouyiColors.gray168,
                          fontSize: GouyiScreenAdapter.fs(16),
                          fontWeight: FontWeight.bold),
                      suffixIcon: InkWell(
                        onTap: () {
                          controller.phoneController.text = "";
                        },
                        child: Icon(Icons.close_outlined,
                            size: GouyiScreenAdapter.fs(18)),
                      )),
                  onChanged: (value) {
                    controller.isSendCodeButtonEnable.value =
                    (controller.phoneController.text.length == 11)
                        ? true
                        : false;
                  },
                  onSubmitted: (value) {},
                ),
              ),
            ],
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
                      controller.isSendCodeButtonEnable.value
                          ? GouyiColors.theme
                          : GouyiColors.yellow253),
                  foregroundColor: MaterialStateProperty.all(Colors.white)),
              onPressed: !controller.isSendCodeButtonEnable.value
                  ? null
                  : () async {
                if (GetUtils.isPhoneNumber(
                    controller.phoneController.text)) {
                  if (controller.isCheckedProtocol.value) {
                    //自动收起键盘
                    FocusScope.of(Get.context!)
                        .requestFocus(FocusNode());
                    EasyLoading.show(status: "获取中...");
                    ResponseModel response =
                    await controller.requestVerificationCode();
                    if (response.success) {
                      ///替换路由
                      Get.offAndToNamed("/verification-code",
                          arguments: {
                            "phone": controller.phoneController.text
                          });
                      EasyLoading.showSuccess(response.message);
                    } else {
                      EasyLoading.showError(response.message);
                    }
                  } else {
                    EasyLoading.showToast("请先同意协议");
                  }
                } else {
                  EasyLoading.showError("请输入正确的手机号");
                }
              },
              child: Text("获取验证码",
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
                  Get.toNamed('/accountPasswordLogin');
                },
                child: Text("密码登录",
                    style: TextStyle(
                        fontSize: GouyiScreenAdapter.fs(14),
                        color: GouyiColors.black51)))
          ],
        ),
      ],
    ),
  );
}