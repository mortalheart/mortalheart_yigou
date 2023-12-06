
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/utils/app_colors.dart';
import 'package:mortalheart_gouyi/utils/app_screenAdapter.dart';

import 'controller/checkout_controller.dart';

class CheckoutViews extends GetView<CheckoutController> {
  const CheckoutViews({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     backgroundColor: GouyiColors.gray249,
     appBar: AppBar(
       title: const Text('确认订单'),
       centerTitle: true,
       backgroundColor: Colors.white, //Colors.transparent=白色透明度为0
       elevation: 0,
     ),
     body: _body(),
   );
  }
  Widget _body() {
    return Stack(
      children: [
        _contentListView(),
        _floatingView(),
      ],
    );
  }
  Widget _contentListView(){
    return Positioned(
        left: 0,
        right: 0,
        top: 0,
        bottom: GouyiScreenAdapter.h(60),
        child: ListView(
        padding: EdgeInsets.all(GouyiScreenAdapter.w(10)),
        children: [
           _deliveryAddressSection(),
          SizedBox(height: GouyiScreenAdapter.h(10),),
          _cartItemView(),
          _deliveryDateSection(),
          SizedBox(height: GouyiScreenAdapter.h(10),),
          _costSection(),
          SizedBox(height: GouyiScreenAdapter.h(10),),
          _invoiceSection(),
          SizedBox(height: GouyiScreenAdapter.h(20),),
        ]
    )
    );
  }
  Widget _floatingView() {
    return Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        height: GouyiScreenAdapter.adapterBottomH(),
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              border:
              Border(top: BorderSide(width: 0.5, color: GouyiColors.gray238))),
          padding: EdgeInsets.symmetric(horizontal: GouyiScreenAdapter.w(10)),
          child: Container(
            color: Colors.white,
            margin: EdgeInsets.only(bottom: GouyiScreenAdapter.bottomH()),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "￥",
                      style: TextStyle(
                          fontSize: GouyiScreenAdapter.fs(10),
                          fontWeight: FontWeight.bold,
                          color: GouyiColors.theme),
                    ),
                    Text(
                      "100000",
                      style: TextStyle(
                          fontSize: GouyiScreenAdapter.fs(18),
                          fontWeight: FontWeight.bold,
                          color: GouyiColors.theme),
                    )
                  ],
                ),
                InkWell(
                  onTap: () async {
                    Get.toNamed('/paymentMethods');

                  },
                  child: Container(
                    margin: EdgeInsets.only(right: GouyiScreenAdapter.w(10)),
                    padding: EdgeInsets.fromLTRB(
                        GouyiScreenAdapter.w(25),
                        GouyiScreenAdapter.h(5),
                        GouyiScreenAdapter.w(25),
                        GouyiScreenAdapter.h(5)),
                    height: GouyiScreenAdapter.h(30),
                    decoration: BoxDecoration(
                        color: GouyiColors.theme,
                        borderRadius:
                        BorderRadius.circular(GouyiScreenAdapter.w(30))),
                    alignment: Alignment.center,
                    child: Text(
                      "去付款",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: GouyiScreenAdapter.fs(16)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }

  Widget _deliveryAddressSection() {
    return Obx(() {
      if (controller.defaultAddressList.isEmpty) {
        return InkWell(
          onTap: () {
            Get.toNamed("/address-create")!
                .then((value) => controller.requestAddressData());
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: GouyiScreenAdapter.w(10)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(10)),
              color: Colors.white,
            ),
            child: ListTile(
                contentPadding: EdgeInsets.symmetric(
                    horizontal: GouyiScreenAdapter.w(10), vertical: 0),
                leading: Icon(
                  Icons.location_on_outlined,
                  size: GouyiScreenAdapter.fs(20),
                ),
                title: Text("添加地址",
                    style: TextStyle(fontSize: GouyiScreenAdapter.fs(14)))),
          ),
        );
      } else {
        final model = controller.defaultAddressList[0];
        String fullAddress = model['address']!;
        List list = fullAddress.split(" ");
        String addressDistrict = "${list[0]} ${list[1]} ${list[2]}";
        list.removeRange(0, 3);
        String addressDetail = list.join(" ");

        return InkWell(
          onTap: () {
            // showAddressBottomSheet();
          },
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(
                GouyiScreenAdapter.w(10),
                GouyiScreenAdapter.h(10),
                GouyiScreenAdapter.w(10),
                GouyiScreenAdapter.h(0)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            addressDistrict,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: GouyiScreenAdapter.fs(12),
                            ),
                          ),
                          SizedBox(height: GouyiScreenAdapter.h(2)),
                          Text(
                            addressDetail,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: GouyiScreenAdapter.fs(16),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: GouyiScreenAdapter.h(2)),
                          Row(
                            children: [
                              Text(
                                model['name']!,
                                style:
                                TextStyle(fontSize: GouyiScreenAdapter.fs(12)),
                              ),
                              SizedBox(width: GouyiScreenAdapter.w(5)),
                              Text(
                                model['phone']!,
                                style: TextStyle(
                                  fontSize: GouyiScreenAdapter.fs(12),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: GouyiScreenAdapter.w(10)),
                    Row(
                      children: [
                        Icon(Icons.arrow_forward_ios_outlined,
                            size: GouyiScreenAdapter.fs(12),
                            color: GouyiColors.black128)
                      ],
                    ),
                  ],
                ),
                SizedBox(height: GouyiScreenAdapter.h(10)),
                const Divider(height: 0.5, color: GouyiColors.gray238)
              ],
            ),
          ),
        );
      }
    });
  }

  Widget _cartItemView(){
    return Container(
      // margin: EdgeInsets.only(top: GouyiScreenAdapter.h(10)),
      decoration: const BoxDecoration(
        // borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(10)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(
              GouyiScreenAdapter.w(10), //与浮动区对齐，左不加
              GouyiScreenAdapter.h(10),
              GouyiScreenAdapter.w(10),
              GouyiScreenAdapter.h(10),
            ),
            child: Row(children: [
              _coverSection('111'),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _titleSection('名称'),
                    SizedBox(height: GouyiScreenAdapter.h(5)),
                    _attributesSection('红色'),
                    SizedBox(height: GouyiScreenAdapter.h(10)),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                            children: [
                          Text("￥",
                              style: TextStyle(
                                  fontSize: GouyiScreenAdapter.fs(10),
                                  fontWeight: FontWeight.bold,
                                  color: GouyiColors.theme)
                          ),
                          Text("1000",
                              // "1199",
                              style: TextStyle(
                                  fontSize: GouyiScreenAdapter.fs(16),
                                  fontWeight: FontWeight.bold,
                                  color: GouyiColors.theme)),
                        ]
                        ),
                        Text("x 100",
                            style: TextStyle(
                              color: GouyiColors.gray154,
                              fontSize: GouyiScreenAdapter.fs(12),
                            )
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _coverSection(String? pic){
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: GouyiScreenAdapter.h(10)),
        padding: EdgeInsets.all(GouyiScreenAdapter.w(5)),
        width: GouyiScreenAdapter.w(100),
        height: GouyiScreenAdapter.w(100),
        decoration: BoxDecoration(
            color: GouyiColors.gray249,
            borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(10))
        ),
    );
  }

  Widget _titleSection(String? title){
    return Text(
      title!,
      maxLines: 2,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      style:
      TextStyle(color: GouyiColors.black51, fontSize: GouyiScreenAdapter.fs(14)),
    );
  }

  Widget _attributesSection(String? attributes){
    return Text(
        attributes!,
        style: TextStyle(
          color: GouyiColors.gray154,
          fontSize: GouyiScreenAdapter.fs(12),
        )
    );
  }

  Widget _deliveryDateSection(){
    return Container(
      padding: EdgeInsets.all(GouyiScreenAdapter.w(10)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(10)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(
                "服务",
                style: TextStyle(
                    fontSize: GouyiScreenAdapter.fs(14),
                    color: GouyiColors.black51)
            ),
            trailing: Text(
                "请选择服务",
                style: TextStyle(
                    fontSize: GouyiScreenAdapter.fs(12),
                    color: GouyiColors.black51
                )
            ),
          ),
          ListTile(
            title: Text(
                "配送",
                style: TextStyle(
                    fontSize: GouyiScreenAdapter.fs(14),
                    color: GouyiColors.black51)
            ),
            trailing: Text(
                "快递 免运费 ",
                style: TextStyle(
                    fontSize: GouyiScreenAdapter.fs(12),
                    color: GouyiColors.black51
                )
            ),
          ),
          ListTile(
            title: Text(
                "店铺优惠",
                style: TextStyle(
                    fontSize: GouyiScreenAdapter.fs(14),
                    color: GouyiColors.black51)
            ),
            trailing: Text(
                "不使用",
                style: TextStyle(
                    fontSize: GouyiScreenAdapter.fs(12),
                    color: GouyiColors.black51
                )
            ),
          ),
          ListTile(
            title: Text(
                "订单备注",
                style: TextStyle(
                    fontSize: GouyiScreenAdapter.fs(14),
                    color: GouyiColors.black51)
            ),
            trailing: Text(
                "无备注",
                style: TextStyle(
                    fontSize: GouyiScreenAdapter.fs(12),
                    color: GouyiColors.black51
                )
            ),
          )
        ],
      ),
    );
  }

  Widget _costSection(){
    return Container(
      padding: EdgeInsets.all(GouyiScreenAdapter.w(10)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(10)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          ListTile(
            title: Text("商品总价",
                style: TextStyle(
                    fontSize: GouyiScreenAdapter.fs(14), color: GouyiColors.black51)),
            trailing: Text("￥1000",
                style: TextStyle(
                    fontSize: GouyiScreenAdapter.fs(12), color: GouyiColors.black51)),
          ),
          ListTile(
            title: Text("优惠券",
                style: TextStyle(
                    fontSize: GouyiScreenAdapter.fs(14), color: GouyiColors.black51)),
            trailing: Wrap(
              children: [
                Text("无可用",
                    style: TextStyle(
                        fontSize: GouyiScreenAdapter.fs(12),
                        color: GouyiColors.gray154)),
                Icon(
                  Icons.keyboard_arrow_right_outlined,
                  size: GouyiScreenAdapter.fs(15),
                )
              ],
            ),
          ),
          ListTile(
            title: Text("红包",
                style: TextStyle(
                    fontSize: GouyiScreenAdapter.fs(14), color: GouyiColors.black51)),
            trailing: Wrap(
              children: [
                Text("无可用",
                    style: TextStyle(
                        fontSize: GouyiScreenAdapter.fs(12),
                        color: GouyiColors.gray154)),
                Icon(
                  Icons.keyboard_arrow_right_outlined,
                  size: GouyiScreenAdapter.fs(15),
                )
              ],
            ),
          ),
          ListTile(
            title: Text("运费",
                style: TextStyle(
                    fontSize: GouyiScreenAdapter.fs(14), color: GouyiColors.black51)),
            trailing: Text("包邮",
                style: TextStyle(
                    fontSize: GouyiScreenAdapter.fs(12), color: GouyiColors.black51)),
          ),
        ],
      ),
    );
  }


  Widget _invoiceSection(){
    return Container(
      padding: EdgeInsets.all(GouyiScreenAdapter.w(10)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(10)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          ListTile(
            title: Text("发票",
                style: TextStyle(
                    fontSize: GouyiScreenAdapter.fs(14), color: GouyiColors.black51)),
            trailing: Wrap(
              children: [
                Text("个人电子发票",
                    style: TextStyle(
                        fontSize: GouyiScreenAdapter.fs(12),
                        color: GouyiColors.black51)),
                Icon(
                  Icons.keyboard_arrow_right_outlined,
                  size: GouyiScreenAdapter.fs(15),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}