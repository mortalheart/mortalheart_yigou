import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/views/details/openScan/controller/scan_controller.dart';

class ScanViews extends GetView<ScanController> {
  const ScanViews({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Scaffold(
      backgroundColor: Color.fromRGBO(246, 246, 246, 1),
      body: Text('我是内容'),
    );
  }


}