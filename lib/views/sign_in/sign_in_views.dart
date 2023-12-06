import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/views/sign_in/controller/sign_in_controller.dart';

class SignInViews extends GetView<SignInController> {
  const SignInViews({super.key});

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
          child:const Text('签到')
      ),
    );
  }
}