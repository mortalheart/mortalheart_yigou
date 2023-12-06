
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/utils/app_screenAdapter.dart';
import 'package:mortalheart_gouyi/views/me/controller/mie_controller.dart';

Widget mieProfileMenu (BuildContext context, MieController controller) {
  return Obx(
        () => Container(
      height: GouyiScreenAdapter.h(40),
      margin: EdgeInsets.symmetric(vertical: GouyiScreenAdapter.h(10)),
            child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    controller.isLogin.value
                        ? "${controller.model['gold']}"
                        : "-",
                    style: TextStyle(
                        fontSize: GouyiScreenAdapter.fs(12),
                        color: Colors.black87,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "乐金",
                    style: TextStyle(
                        fontSize: GouyiScreenAdapter.fs(12),
                        color: Colors.black45),
                  ),
                ],
              )),
          Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    controller.isLogin.value
                        ? "${controller.model['coupon']}"
                        : "-",
                    style: TextStyle(
                        fontSize: GouyiScreenAdapter.fs(12),
                        color: Colors.black87,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "优惠券",
                    style: TextStyle(
                        fontSize: GouyiScreenAdapter.fs(12),
                        color: Colors.black45),
                  ),
                ],
              )),
          Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    controller.isLogin.value
                        ? "${controller.model['redPacket']}"
                        : "-",
                    style: TextStyle(
                        fontSize: GouyiScreenAdapter.fs(12),
                        color: Colors.black87,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "红包",
                    style: TextStyle(
                        fontSize: GouyiScreenAdapter.fs(12),
                        color: Colors.black45),
                  ),
                ],
              )),
          Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    controller.isLogin.value
                        ? "${controller.model['quota']}万元"
                        : "-",
                    style: TextStyle(
                        fontSize: GouyiScreenAdapter.fs(12),
                        color: Colors.black87,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "最高额度",
                    style: TextStyle(
                        fontSize: GouyiScreenAdapter.fs(12),
                        color: Colors.black45),
                  ),
                ],
              )),
          Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(Icons.account_balance_wallet_outlined),
                  Text(
                    "钱包",
                    style: TextStyle(
                        fontSize: GouyiScreenAdapter.fs(12),
                        color: Colors.black45),
                  ),
                ],
              )),
        ],
      ),
    ),
  );
}