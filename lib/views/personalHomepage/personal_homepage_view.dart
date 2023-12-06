
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/views/personalHomepage/controller/personal_homepage_controller.dart';

class PersonalHomepageView extends GetView<PersonalHomepageController>{
  const PersonalHomepageView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('个人主页'),
        centerTitle: true,
      ),
      body: _body(),
    );
  }
 Widget _body() {
    return ListView(
      children:  const [
        SizedBox(height: 20,),
        ListTile(title: Text("昵称")),
        ListTile(
          title:
          Text("姓别", style: TextStyle(color: Colors.black, fontSize: 16)),
          trailing: Icon(Icons.keyboard_arrow_right),
        ),
        ListTile(
          title:
          Text("出生日期", style: TextStyle(color: Colors.black, fontSize: 16)),
          trailing: Icon(Icons.keyboard_arrow_right),
        ),
      ],
    );
 }
}