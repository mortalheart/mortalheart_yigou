
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/utils/app_colors.dart';
import 'package:mortalheart_gouyi/utils/app_screenAdapter.dart';
import 'package:mortalheart_gouyi/views/paymentMethods/controller/paymentMethods_controller.dart';

class PaymentMethodsViews extends GetView<PaymentMethodsController>{
  const PaymentMethodsViews({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: GouyiColors.gray249,
      appBar: AppBar(
        title: const Text('收银台'),
        centerTitle: true,
        backgroundColor: Colors.white, //Colors.transparent=白色透明度为0
        elevation: 0,
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return  Container(
      padding: EdgeInsets.all(GouyiScreenAdapter.w(10)),
      child: Column(
        children: [
          const Text('支付金额'),
          SizedBox(height: GouyiScreenAdapter.h(10),),
          const Text('支付方式')
        ],
      ),
    );
  }
}