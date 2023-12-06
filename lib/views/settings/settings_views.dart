

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/utils/app_colors.dart';
import 'package:mortalheart_gouyi/views/settings/controller/settings_controller.dart';
import 'package:mortalheart_gouyi/views/settings/widgets/settings_body.dart';

class SettingsViews extends GetView<SettingsController> {
  const SettingsViews({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: GouyiColors.gray249,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('设置'),
        centerTitle: true,
      ),
      body: settingsBody(context,controller),
    );
  }

}