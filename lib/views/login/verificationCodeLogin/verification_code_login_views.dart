import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/utils/app_colors.dart';
import 'package:mortalheart_gouyi/utils/app_screenAdapter.dart';
import 'package:mortalheart_gouyi/views/login/verificationCodeLogin/controller/verification_code_login_controller.dart';
import 'package:mortalheart_gouyi/views/login/verificationCodeLogin/widgets/verification_code_login_body.dart';

class VerificationCodeLoginViews extends GetView<VerificationCodeLoginController> {
  const VerificationCodeLoginViews({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () {
              },
              child: Text(
                "注册",
                style: TextStyle(
                    fontSize: GouyiScreenAdapter.fs(14), color: GouyiColors.black51),
              )),
        ],
      ),
      body: verificationCodeLoginBody(context,controller),
    );
  }

}