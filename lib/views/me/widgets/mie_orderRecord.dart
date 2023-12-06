
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/utils/app_screenAdapter.dart';
import 'package:mortalheart_gouyi/views/me/controller/mie_controller.dart';

Widget mieOrderRecord (BuildContext context, MieController controller) {
  return  Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(10))
      ),
      // height: GouyiScreenAdapter.h(90),
      child: Column(
        children: [
          SizedBox(
            height: GouyiScreenAdapter.h(30),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: GouyiScreenAdapter.h(30),
                    alignment: Alignment.center,
                    child: Text(
                      "收藏 100",
                      style: TextStyle(
                          fontSize: GouyiScreenAdapter.fs(12),
                          color: Colors.black45
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            left: BorderSide(
                                width: GouyiScreenAdapter.w(0.5),
                                color: Colors.black12),
                            right: BorderSide(
                                width: GouyiScreenAdapter.w(0.5),
                                color: Colors.black12))),
                    height: GouyiScreenAdapter.h(30),
                    alignment: Alignment.center,
                    child: Text(
                      "足迹",
                      style: TextStyle(
                          fontSize: GouyiScreenAdapter.fs(12),
                          color: Colors.black45
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: GouyiScreenAdapter.h(30),
                    alignment: Alignment.center,
                    child: Text(
                      "关注",
                      style: TextStyle(
                          fontSize: GouyiScreenAdapter.fs(12),
                          color: Colors.black45
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(height: GouyiScreenAdapter.h(1), color: Colors.black12),
          Container(
            height: GouyiScreenAdapter.h(50),
            margin: EdgeInsets.symmetric(vertical: GouyiScreenAdapter.w(5)),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        Get.toNamed('/orderList',arguments: {
                          "initialIndex":1
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(Icons.payment_outlined),
                          Text(
                            "待付款",
                            style: TextStyle(
                                fontSize: GouyiScreenAdapter.fs(12),
                                color: Colors.black45
                            ),
                          ),
                        ],
                      ),
                    )
                ),
                Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        Get.toNamed('/orderList',arguments: {
                          "initialIndex":2
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(Icons.delivery_dining_outlined),
                          Text(
                            "待收货",
                            style: TextStyle(
                                fontSize: GouyiScreenAdapter.fs(12),
                                color: Colors.black45
                            ),
                          ),
                        ],
                      ),
                    )
                ),
                Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        Get.toNamed('/orderList',arguments: {
                          "initialIndex":3
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(Icons.comment_outlined),
                          Text(
                            "待评价",
                            style: TextStyle(
                                fontSize: GouyiScreenAdapter.fs(12),
                                color: Colors.black45
                            ),
                          ),
                        ],
                      ),
                    )
                ),
                Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        // Get.toNamed('/orderList',arguments: {
                        //   "initialIndex":4
                        // });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(Icons.change_circle_outlined),
                          Text(
                            "退换/售后",
                            style: TextStyle(
                                fontSize: GouyiScreenAdapter.fs(12),
                                color: Colors.black45
                            ),
                          ),
                        ],
                      ),
                    )
                ),
                Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        Get.toNamed('/orderList');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(Icons.list_alt_outlined),
                          Text(
                            "全部订单",
                            style: TextStyle(
                                fontSize: GouyiScreenAdapter.fs(12),
                                color: Colors.black45
                            ),
                          ),
                        ],
                      ),
                    )
                ),
              ],
            ),
          ),
        ],
      ),
    );
}