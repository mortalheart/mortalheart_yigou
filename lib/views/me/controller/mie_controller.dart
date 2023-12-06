import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MieController extends GetxController{
  final ScrollController scrollController = ScrollController();
  RefreshController refreshController = RefreshController(initialRefresh: false);
  final ValueNotifier<double> pageScrollY = ValueNotifier<double>(0);
  RxList bannerList = [].obs;
  RxList goodsList = [].obs;
  RxBool isLogin = true.obs;
  RxBool isEnableDarkMode = Get.isDarkMode.obs;
  late  RxMap<dynamic, String> model = {
    'sId':'',
    'username':'',
    'tel':'',
    'password':'',
    'salt':'',
    'gold':'',
    'coupon':'',
    'redPacket':'',
    'quota':'',
    'collect':'',
    'footmarks':'',
    'follow':'',
  }.obs;

  ///服务列表
  List<Map> serviceList = [];

  @override
  void onInit() {
    super.onInit();
    _addScrollListener();
    _requestBannerData();
  }

  @override
  void dispose() {
    super.dispose();
    refreshController.dispose();
    scrollController.dispose();
    pageScrollY.dispose();
  }

  ///下拉刷新
  void onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    refreshController.refreshCompleted();
  }

  ///请求banner数据
  void _requestBannerData() async {
    goodsList.value = [{
      "imgUrl": "https://ik.imagekit.io/guoguodad/mall/common/goods1.jpg?updatedAt=1691718084842",
      "tag": "时尚运动",
      "des1": "活动惊爆价",
      "des2": "实惠好货等你抢",
      "type": "2",
      "h5url": "https://shop.m.jd.com/shop/home?shopId=17529"
    },
      {
        "imgUrl": "https://ik.imagekit.io/guoguodad/mall/common/goods2.jpeg?updatedAt=1691718084893",
        "description": "帅电乔1男休闲运动篮球鞋倒钩TS 女鞋深棕鬼脸",
        "price": "799.00",
        "type": "1"
      },
      {
        "imgUrl": "https://ik.imagekit.io/guoguodad/mall/common/goods3.jpg?updatedAt=1691718084932",
        "tag": "好物集市",
        "des1": "专业运动装备",
        "des2": "运动与你相伴",
        "type": "2",
        "h5url": "https://shop.m.jd.com/shop/home?shopId=17529"
      },
      {
        "imgUrl": "https://ik.imagekit.io/guoguodad/mall/common/goods4.jpeg?updatedAt=1691718085548",
        "description": "ASICS 亚瑟士 男鞋运动鞋 GEL-VENTURE 7 MX 抓地缓冲越野跑鞋 黑色",
        "price": "590.00",
        "type": "1"
      },
      {
        "imgUrl": "https://ik.imagekit.io/guoguodad/mall/common/goods5.jpeg?updatedAt=1691718214230",
        "description": "塞洛蒙（Salomon）男款 户外运动轻便舒适网布透气排水浅滩涉水溯溪鞋 AMPHIB BOLD",
        "price": "798.00",
        "type": "1"
      },
      {
        "imgUrl": "https://ik.imagekit.io/guoguodad/mall/common/goods6.jpeg?updatedAt=1691718214230",
        "description": "蝴蝶乒乓球鞋 男比赛专业训练鞋防滑透气轻便耐磨鞋",
        "price": "268.60",
        "type": "1"
      },
      {
        "imgUrl": "https://ik.imagekit.io/guoguodad/mall/common/goods7.webp?updatedAt=1691718214122",
        "description": "乔丹官方旗舰板鞋春新款网透气休闲运动鞋高帮轻便搭扣滑板鞋",
        "price": "205.10",
        "type": "1"
      },
      {
        "imgUrl": "https://ik.imagekit.io/guoguodad/mall/common/goods4.jpeg?updatedAt=1691718085548",
        "description": "yysports 阿迪达斯adidas男鞋女鞋 三叶草 OZWE",
        "price": "809.00",
        "type": "1"
      },
      {
        "imgUrl": "https://ik.imagekit.io/guoguodad/mall/common/goods9.jpg?updatedAt=1691718368682",
        "description": "帅电乔1男休闲运动篮球鞋倒钩TS 女鞋深棕鬼脸",
        "price": "799.00",
        "type": "1"
      },
      {
        "imgUrl": "https://ik.imagekit.io/guoguodad/mall/common/goods10.jpg?updatedAt=1691718475914",
        "description": "ASICS 亚瑟士 男鞋运动鞋 GEL-VENTURE 7 MX 抓地缓冲越野跑鞋 黑色",
        "price": "590.00",
        "type": "1"
      },
      {
        "imgUrl": "https://ik.imagekit.io/guoguodad/mall/common/goods11.jpg?updatedAt=1691718475860",
        "description": "帅电乔1男休闲运动篮球鞋倒钩TS 女鞋深棕鬼脸",
        "price": "799.00",
        "type": "1"
      },
      {
        "imgUrl": "https://ik.imagekit.io/guoguodad/mall/common/goods12.jpg?updatedAt=1691718549427",
        "description": "ASICS 亚瑟士 男鞋运动鞋 GEL-VENTURE 7 MX 抓地缓冲越野跑鞋 黑色",
        "price": "590.00",
        "type": "1"
      },
      {
        "imgUrl": "https://ik.imagekit.io/guoguodad/mall/common/goods11.jpg?updatedAt=1691718475860",
        "description": "ASICS亚瑟士 女鞋运动鞋稳定旗舰跑鞋耐磨 GE",
        "price": "1399.00",
        "type": "1"
      },
      {
        "imgUrl": "https://ik.imagekit.io/guoguodad/mall/common/goods14.jpg?updatedAt=1691718615856",
        "description": "ASICS 亚瑟士 男鞋运动鞋 GEL-VENTURE 7 MX 抓地缓冲越野跑鞋 黑色",
        "price": "590.00",
        "type": "1"
      },
      {
        "imgUrl": "https://ik.imagekit.io/guoguodad/mall/common/goods15.jpg?updatedAt=1691718711216",
        "description": "帅电乔1男休闲运动篮球鞋倒钩TS 女鞋深棕鬼脸",
        "price": "799.00",
        "type": "1"
      },
      {
        "imgUrl": "https://ik.imagekit.io/guoguodad/mall/common/goods10.jpg?updatedAt=1691718475914",
        "description": "ASICS 亚瑟士 休闲鞋低帮运动鞋舒适透气 COO",
        "price": "792.00",
        "type": "1"
      },{
        "imgUrl": "https://ik.imagekit.io/guoguodad/mall/common/goods4.jpeg?updatedAt=1691718085548",
        "description": "ASICS 亚瑟士 男鞋运动鞋 GEL-VENTURE 7 MX 抓地缓冲越野跑鞋 黑色",
        "title": "男鞋运动鞋",
        "sub_title":"抓地缓冲越野跑鞋 黑色",
        "price":"599.00",
        "type": "1"
      },{
        "imgUrl": "https://ik.imagekit.io/guoguodad/mall/common/goods4.jpeg?updatedAt=1691718085548",
        "description": "ASICS 亚瑟士 男鞋运动鞋 GEL-VENTURE 7 MX 抓地缓冲越野跑鞋 黑色",
        "title": "男鞋运动鞋",
        "sub_title":"抓地缓冲越野跑鞋 黑色",
        "price":"599.00",
        "type": "1"
      },{
        "imgUrl": "https://ik.imagekit.io/guoguodad/mall/common/goods4.jpeg?updatedAt=1691718085548",
        "description": "ASICS 亚瑟士 男鞋运动鞋 GEL-VENTURE 7 MX 抓地缓冲越野跑鞋 黑色",
        "title": "男鞋运动鞋",
        "sub_title":"抓地缓冲越野跑鞋 黑色",
        "price":"599.00",
        "type": "1"
      },{
        "imgUrl": "https://ik.imagekit.io/guoguodad/mall/common/goods4.jpeg?updatedAt=1691718085548",
        "description": "ASICS 亚瑟士 男鞋运动鞋 GEL-VENTURE 7 MX 抓地缓冲越野跑鞋 黑色",
        "title": "男鞋运动鞋",
        "sub_title":"抓地缓冲越野跑鞋 黑色",
        "price":"599.00",
        "type": "1"
      },{
        "imgUrl": "https://ik.imagekit.io/guoguodad/mall/common/goods4.jpeg?updatedAt=1691718085548",
        "description": "ASICS 亚瑟士 男鞋运动鞋 GEL-VENTURE 7 MX 抓地缓冲越野跑鞋 黑色",
        "title": "男鞋运动鞋",
        "sub_title":"抓地缓冲越野跑鞋 黑色",
        "price":"599.00",
        "type": "1"
      },{
        "imgUrl": "https://ik.imagekit.io/guoguodad/mall/common/goods4.jpeg?updatedAt=1691718085548",
        "description": "ASICS 亚瑟士 男鞋运动鞋 GEL-VENTURE 7 MX 抓地缓冲越野跑鞋 黑色",
        "title": "男鞋运动鞋",
        "sub_title":"抓地缓冲越野跑鞋 黑色",
        "price":"599.00",
        "type": "1"
      },{
        "imgUrl": "https://ik.imagekit.io/guoguodad/mall/common/goods4.jpeg?updatedAt=1691718085548",
        "description": "ASICS 亚瑟士 男鞋运动鞋 GEL-VENTURE 7 MX 抓地缓冲越野跑鞋 黑色",
        "title": "男鞋运动鞋",
        "sub_title":"抓地缓冲越野跑鞋 黑色",
        "price":"599.00",
        "type": "1"
      },{
        "imgUrl": "https://ik.imagekit.io/guoguodad/mall/common/goods4.jpeg?updatedAt=1691718085548",
        "description": "ASICS 亚瑟士 男鞋运动鞋 GEL-VENTURE 7 MX 抓地缓冲越野跑鞋 黑色",
        "title": "男鞋运动鞋",
        "sub_title":"抓地缓冲越野跑鞋 黑色",
        "price":"599.00",
        "type": "1"
      },{
        "imgUrl": "https://ik.imagekit.io/guoguodad/mall/common/goods4.jpeg?updatedAt=1691718085548",
        "description": "ASICS 亚瑟士 男鞋运动鞋 GEL-VENTURE 7 MX 抓地缓冲越野跑鞋 黑色",
        "title": "男鞋运动鞋",
        "sub_title":"抓地缓冲越野跑鞋 黑色",
        "price":"599.00",
        "type": "1"
      },{
        "imgUrl": "https://ik.imagekit.io/guoguodad/mall/common/goods4.jpeg?updatedAt=1691718085548",
        "description": "ASICS 亚瑟士 男鞋运动鞋 GEL-VENTURE 7 MX 抓地缓冲越野跑鞋 黑色",
        "title": "男鞋运动鞋",
        "sub_title":"抓地缓冲越野跑鞋 黑色",
        "price":"599.00",
        "type": "1"
      },{
        "imgUrl": "https://ik.imagekit.io/guoguodad/mall/common/goods4.jpeg?updatedAt=1691718085548",
        "description": "ASICS 亚瑟士 男鞋运动鞋 GEL-VENTURE 7 MX 抓地缓冲越野跑鞋 黑色",
        "title": "男鞋运动鞋",
        "sub_title":"抓地缓冲越野跑鞋 黑色",
        "price":"599.00",
        "type": "1"
      },{
        "imgUrl": "https://ik.imagekit.io/guoguodad/mall/common/goods4.jpeg?updatedAt=1691718085548",
        "description": "ASICS 亚瑟士 男鞋运动鞋 GEL-VENTURE 7 MX 抓地缓冲越野跑鞋 黑色",
        "title": "男鞋运动鞋",
        "sub_title":"抓地缓冲越野跑鞋 黑色",
        "price":"599.00",
        "type": "1"
      }];
  }

  void getUserInfo() async {

  }

  void changeDarkMode(value) {

  }

  void _addScrollListener() {
    scrollController.addListener(() {

    });
  }
}