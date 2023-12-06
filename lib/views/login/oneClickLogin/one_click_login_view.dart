
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/views/login/oneClickLogin/widgets/oneClickLoginBody.dart';

import 'controller/one_click_login_controller.dart';

class OneClickLoginView extends GetView<OneClickLoginController> {
  const OneClickLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: oneClickLoginBody(context,controller),
    );
  }

}