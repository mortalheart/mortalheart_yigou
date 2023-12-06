
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/message_controller.dart';

class MessageViews extends GetView<MessageController> {
  const MessageViews({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
     appBar: AppBar(
       backgroundColor: Colors.white,
       elevation: 0,
       title: const Text('消息'),
       centerTitle: true,
     ),
     body: const Text('我是内容'),
   );
  }

}