
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/views/category/controller/category_controller.dart';
import 'package:mortalheart_gouyi/views/category/widgets/category_appBar.dart';
import 'package:mortalheart_gouyi/views/category/widgets/category_leftView.dart';
import 'package:mortalheart_gouyi/views/category/widgets/category_rightView.dart';

class CategoryViews extends GetView<CategoryController>{
  const CategoryViews({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      appBar: categoryAppBar(context),
      body:  Row(
        children: [
          categoryLeftView(context,controller),
          categoryRightView(context,controller),
        ],
      ),
    );
  }

}