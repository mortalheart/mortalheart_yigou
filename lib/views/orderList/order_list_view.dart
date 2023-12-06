

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/utils/app_colors.dart';
import 'package:mortalheart_gouyi/utils/app_screenAdapter.dart';
import 'package:mortalheart_gouyi/widgets/app_components.dart';

import 'controller/order_list_controller.dart';

class OrderListView extends GetView<OrderListController> {
  const OrderListView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: _customAppBar(),
      body: _body(),
    );
  }
  ///自定义appBar
  AppBar _customAppBar() {
    return AppBar(
      title: const Text('商城订单'),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0.2,
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(Icons.search_outlined, size: GouyiScreenAdapter.fs(20))),
        IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart_outlined,
                size: GouyiScreenAdapter.fs(20)))
      ],
      bottom: TabBar(
        tabs: controller.tabBarList,
        labelColor: GouyiColors.theme,
        unselectedLabelColor: GouyiColors.black128,

        ///以下两项里面设置颜色有问题
        labelStyle: TextStyle(
          fontSize: GouyiScreenAdapter.fs(14),
          fontWeight: FontWeight.bold,
          // color: DoColors.theme,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: GouyiScreenAdapter.fs(14),
          fontWeight: FontWeight.normal,
          // color: DoColors.gray154,
        ),
        indicatorColor: GouyiColors.theme,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorWeight: 3,
        onTap: (value) {
        },
        controller: controller.tabController,
        isScrollable: false,
      ),
    );
  }

  Widget _body(){
    return TabBarView(
      controller: controller.tabController,
      children: [
        _allOrderListView(),
        _waitingPayOrderListView(),
        _waitingReceiverOrderListView(),
        _waitingCommentOrderListView()
      ],
    );
  }

  ///--------------
  ///全部
  Widget _allOrderListView() {
    return Obx(
          () => controller.allOrderList.isNotEmpty
          ? ListView(
        shrinkWrap: true,
        children: controller.allOrderList
            .map((element) => _orderItem(element))
            .toList(),
      )
          : commonEmptyView("暂无订单"),
    );
  }

  ///待付款
  Widget _waitingPayOrderListView() {
    return Obx(
          () => controller.paymentOrderList.isNotEmpty
          ? ListView(
        shrinkWrap: true,
        children: controller.paymentOrderList
            .map((element) => _orderItem(element))
            .toList(),
      )
          : commonEmptyView("暂无订单"),
    );
  }

  ///待收货
  Widget _waitingReceiverOrderListView() {
    return Obx(
          () => controller.receiverOrderList.isNotEmpty
          ? ListView(
        shrinkWrap: true,
        children: controller.receiverOrderList
            .map((element) => _orderItem(element))
            .toList(),
      )
          : commonEmptyView("暂无订单"),
    );
  }

  ///待评价
  Widget _waitingCommentOrderListView() {
    return Obx(
          () => controller.commentOrderList.isNotEmpty
          ? ListView(
        shrinkWrap: true,
        children: controller.commentOrderList
            .map((element) => _orderItem(element))
            .toList(),
      )
          : commonEmptyView("暂无订单"),
    );
  }

  ///--------------
  ///订单子项
  Widget _orderItem( orderItemModel) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            // print("跳转--${orderItemModel.sId}");
            Get.toNamed("/order-content", arguments: {
              "sId": orderItemModel.sId,
            });
          },
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(
                horizontal: GouyiScreenAdapter.w(10),
                vertical: GouyiScreenAdapter.h(5)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                            width: GouyiScreenAdapter.w(20),
                            height: GouyiScreenAdapter.h(20),
                            child: Image.asset("assets/images/logo.png")),
                        SizedBox(width: GouyiScreenAdapter.w(5)),
                        Text(
                          "小米商城",
                          style: TextStyle(fontSize: GouyiScreenAdapter.fs(14)),
                        ),
                      ],
                    ),
                    Text(orderItemModel.payStatus == 0 ? "待付款" : "",
                        style: TextStyle(
                            fontSize: GouyiScreenAdapter.fs(14),
                            color: GouyiColors.theme))
                  ],
                ),
                SizedBox(height: GouyiScreenAdapter.w(5)),
                const Divider(height: 1, color: GouyiColors.gray238),
                ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: orderItemModel.orderItem!
                      .map((e) => _orderGoodsItem(e))
                      .toList(),
                ),
                const Divider(height: 1, color: GouyiColors.gray238),
                SizedBox(height: GouyiScreenAdapter.w(10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        "${DateTime.fromMillisecondsSinceEpoch(orderItemModel.addTime!)}",
                        style: TextStyle(
                            fontSize: GouyiScreenAdapter.fs(12),
                            color: GouyiColors.gray154)),
                    Row(
                      children: [
                        Text("共${orderItemModel.orderItem!.length}件商品",
                            style: TextStyle(fontSize: GouyiScreenAdapter.fs(12))),
                        SizedBox(width: GouyiScreenAdapter.w(10)),
                        Text("应付金额:",
                            style: TextStyle(fontSize: GouyiScreenAdapter.fs(12))),
                        Text("￥",
                            style: TextStyle(fontSize: GouyiScreenAdapter.fs(10))),
                        Text("${orderItemModel.allPrice}",
                            style: TextStyle(fontSize: GouyiScreenAdapter.fs(18))),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: GouyiScreenAdapter.h(10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Container()),
                    Wrap(
                      spacing: 5,
                      children: [
                        OutlinedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              // maximumSize: MaterialStateProperty.all(
                              //     Size.fromHeight(GouyiScreenAdapter.h(55))),
                                padding:
                                MaterialStateProperty.all(EdgeInsets.zero),
                                side: MaterialStateProperty.all(
                                    const BorderSide(color: GouyiColors.gray238))),
                            child: Text(
                              "取消订单",
                              style: TextStyle(
                                  fontSize: GouyiScreenAdapter.fs(12),
                                  color: GouyiColors.gray186),
                            )),
                        OutlinedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              padding:
                              MaterialStateProperty.all(EdgeInsets.zero),
                              side: MaterialStateProperty.all(
                                  const BorderSide(color: GouyiColors.theme))),
                          child: Text(
                            "修改地址",
                            style: TextStyle(
                                fontSize: GouyiScreenAdapter.fs(12),
                                color: GouyiColors.theme),
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              padding:
                              MaterialStateProperty.all(EdgeInsets.zero),
                              side: MaterialStateProperty.all(
                                  const BorderSide(color: GouyiColors.theme))),
                          child: Text(
                            "立即付款",
                            style: TextStyle(
                                fontSize: GouyiScreenAdapter.fs(12),
                                color: GouyiColors.theme),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(height: GouyiScreenAdapter.h(5), color: GouyiColors.gray238),
      ],
    );
  }

  ///商品项
  Widget _orderGoodsItem( goodsItemModel) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: GouyiScreenAdapter.h(10)),
      child: Row(children: [
        _coverSection(goodsItemModel.productImg),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: _titleSection(goodsItemModel.productTitle)),
                  SizedBox(width: GouyiScreenAdapter.w(10)),
                  _priceSection(goodsItemModel.productPrice),
                ],
              ),
              SizedBox(height: GouyiScreenAdapter.h(10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _attributesSection(goodsItemModel.selectedAttr),
                  _buyNumberSection(goodsItemModel.productCount),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }

  ///封面区
  Widget _coverSection(String? pic) {
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: GouyiScreenAdapter.h(10)),
        width: GouyiScreenAdapter.w(60),
        height: GouyiScreenAdapter.w(60),
        decoration: BoxDecoration(
            color: GouyiColors.gray249,
            borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(10))),
        child: Image.network(
          pic!,
          fit: BoxFit.fitHeight,
        ));
  }

  ///标题区
  Widget _titleSection(String? title) {
    return Text(
      title ?? "",
      maxLines: 2,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      style:
      TextStyle(color: GouyiColors.black51, fontSize: GouyiScreenAdapter.fs(14)),
    );
  }

  ///属性区
  Widget _attributesSection(String? attributes) {
    return Text(attributes ?? "",
        style: TextStyle(
          color: GouyiColors.gray154,
          fontSize: GouyiScreenAdapter.fs(12),
        ));
  }

  ///价格区
  Widget _priceSection(int? price) {
    return Row(children: [
      Text("￥",
          style: TextStyle(
              fontSize: GouyiScreenAdapter.fs(10), color: GouyiColors.gray154)),
      Text("$price",
          style: TextStyle(
              fontSize: GouyiScreenAdapter.fs(12), color: GouyiColors.gray154)),
    ]);
  }

  ///购买数量区
  Widget _buyNumberSection(int? buyNumber) {
    return Text("x $buyNumber",
        style: TextStyle(
          color: GouyiColors.gray154,
          fontSize: GouyiScreenAdapter.fs(12),
        ));
  }
}