
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/views/details/active_page/controller/active_controller.dart';

class ActiveViews extends GetView<ActiveController> {
  const ActiveViews({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
      appBar: _customAppBar(context),
      body: const Text('我是内容'),
    );
  }

  AppBar _customAppBar(BuildContext context){
    return  AppBar(
      centerTitle: true,
      backgroundColor:const Color.fromRGBO(246, 246, 246, 1), //Colors.transparent=白色透明度为0
      elevation: 0,
      leading:  IconButton(
        icon:  const Icon(Icons.arrow_back_ios),
        onPressed:()=>controller.onBack(),
      ),
      title: InkWell(
        onTap: () {
        },
        child:const Text('活动页')
      ),
    );
  }
}