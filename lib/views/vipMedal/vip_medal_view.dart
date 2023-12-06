import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/vip_medal_controller.dart';

class VipMedalView extends GetView<VipMedalController> {
  const VipMedalView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('会员勋章'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MedalView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

}