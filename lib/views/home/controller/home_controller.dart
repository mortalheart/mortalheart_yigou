
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/api/home.dart';
import 'package:mortalheart_gouyi/utils/app_screenAdapter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeController extends GetxController{
  final ScrollController scrollController = ScrollController();
  final SwiperController swiperController = SwiperController();
  RefreshController refreshController = RefreshController(initialRefresh: false);
  final PageController pageController = PageController();
  /// 背景图片 https://img-qn.51miz.com/preview/element/00/01/16/16/E-1161680-1DF4A9DA.jpg!/quality/90/unsharp/true/compress/true/format/jpg/fw/720
  final headerBackgroundImage = RxString('');
  final homeHeaderOpacity = 1.0.obs;
  final adUrl ='https://img-qn.51miz.com/preview/element/00/01/16/16/E-1161680-1DF4A9DA.jpg!/quality/90/unsharp/true/compress/true/format/jpg/fw/720'.obs;
  RxList searchList = [].obs;
  RxList tabs = [].obs;
  RxString tabsCodeIndex = "1".obs;
  RxList menuList = [].obs;
  RxList bannerList = [].obs;
  RxList bestGoodsList  = [].obs;
  final menuSliderIndex = 0.obs;
  final goodsList = RxList([]);
  final twiceTriggerDistance = 180 - (GouyiScreenAdapter.statusH() + 48 + 40);
  late Timer _timer;
  late  int _seconds = 3600;
  RxString countdownString = "00:00:00".obs;


  @override
  void onInit() {
    super.onInit();
    _addScrollListener();
    reuqestHomeData();
    getCountdown();

  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
  @override
  void dispose() {
    super.dispose();
    refreshController.dispose();
    scrollController.dispose();
    pageController.dispose();
    _timer.cancel();
    // swiperController.dispose();
  }
  /// 加载数据
  void reuqestHomeData() async{
    final data = await HomeApi.getBannerPath();
    bannerList.value = data.data!.result!;
    tabs.value = [{
      "name":"精选",
      "code": "1"
    },{
      "name":"测试数据",
      "code": "2"
    },{
      "name":"测试数据",
      "code": "3"
    },{
      "name":"测试数据",
      "code": "4"
    },{
      "name":"测试数据",
      "code": "5"
    },{
      "name":"测试数据",
      "code": "6"
    },{
      "name":"测试数据",
      "code": "7"
    },{
      "name":"测试数据",
      "code": "8"
    },{
      "name":"测试数据",
      "code": "9"
    },{
      "name":"测试数据",
      "code": "10"
    },{
      "name":"测试数据",
      "code": "11"
    },{
      "name":"测试数据",
      "code": "12"
    },{
      "name":"测试数据",
      "code": "13"
    },{
      "name":"测试数据",
      "code": "14"
    },{
      "name":"测试数据",
      "code": "15"
    }];
    menuList.value =[{
      "menuIcon": "https://ik.imagekit.io/guoguodad/mall/home/supermarket.png?updatedAt=1691716657143",
      "menuName": "超市",
      "menuCode": "m01",
      "h5url": "https://prodev.m.jd.com/mall/active/3xhqjGH1wMz5FaMgrfYhR22sFvqz/index.html"
    },
      {
        "menuIcon": "https://ik.imagekit.io/guoguodad/mall/home/supermarket.png?updatedAt=1691716657143",
        "menuName": "超市",
        "menuCode": "m01",
        "h5url": "https://prodev.m.jd.com/mall/active/3xhqjGH1wMz5FaMgrfYhR22sFvqz/index.html"
      },{
        "menuIcon": "https://ik.imagekit.io/guoguodad/mall/home/supermarket.png?updatedAt=1691716657143",
        "menuName": "超市",
        "menuCode": "m01",
        "h5url": "https://prodev.m.jd.com/mall/active/3xhqjGH1wMz5FaMgrfYhR22sFvqz/index.html"
      },{
        "menuIcon": "https://ik.imagekit.io/guoguodad/mall/home/supermarket.png?updatedAt=1691716657143",
        "menuName": "超市",
        "menuCode": "m01",
        "h5url": "https://prodev.m.jd.com/mall/active/3xhqjGH1wMz5FaMgrfYhR22sFvqz/index.html"
      },{
        "menuIcon": "https://ik.imagekit.io/guoguodad/mall/home/supermarket.png?updatedAt=1691716657143",
        "menuName": "超市",
        "menuCode": "m01",
        "h5url": "https://prodev.m.jd.com/mall/active/3xhqjGH1wMz5FaMgrfYhR22sFvqz/index.html"
      },{
        "menuIcon": "https://ik.imagekit.io/guoguodad/mall/home/supermarket.png?updatedAt=1691716657143",
        "menuName": "超市",
        "menuCode": "m01",
        "h5url": "https://prodev.m.jd.com/mall/active/3xhqjGH1wMz5FaMgrfYhR22sFvqz/index.html"
      },{
        "menuIcon": "https://ik.imagekit.io/guoguodad/mall/home/supermarket.png?updatedAt=1691716657143",
        "menuName": "超市",
        "menuCode": "m01",
        "h5url": "https://prodev.m.jd.com/mall/active/3xhqjGH1wMz5FaMgrfYhR22sFvqz/index.html"
      },{
        "menuIcon": "https://ik.imagekit.io/guoguodad/mall/home/supermarket.png?updatedAt=1691716657143",
        "menuName": "超市",
        "menuCode": "m01",
        "h5url": "https://prodev.m.jd.com/mall/active/3xhqjGH1wMz5FaMgrfYhR22sFvqz/index.html"
      },{
        "menuIcon": "https://ik.imagekit.io/guoguodad/mall/home/supermarket.png?updatedAt=1691716657143",
        "menuName": "超市",
        "menuCode": "m01",
        "h5url": "https://prodev.m.jd.com/mall/active/3xhqjGH1wMz5FaMgrfYhR22sFvqz/index.html"
      },{
        "menuIcon": "https://ik.imagekit.io/guoguodad/mall/home/supermarket.png?updatedAt=1691716657143",
        "menuName": "超市",
        "menuCode": "m01",
        "h5url": "https://prodev.m.jd.com/mall/active/3xhqjGH1wMz5FaMgrfYhR22sFvqz/index.html"
      },{
        "menuIcon": "https://ik.imagekit.io/guoguodad/mall/home/supermarket.png?updatedAt=1691716657143",
        "menuName": "超市",
        "menuCode": "m01",
        "h5url": "https://prodev.m.jd.com/mall/active/3xhqjGH1wMz5FaMgrfYhR22sFvqz/index.html"
      },{
        "menuIcon": "https://ik.imagekit.io/guoguodad/mall/home/supermarket.png?updatedAt=1691716657143",
        "menuName": "超市",
        "menuCode": "m01",
        "h5url": "https://prodev.m.jd.com/mall/active/3xhqjGH1wMz5FaMgrfYhR22sFvqz/index.html"
      },{
        "menuIcon": "https://ik.imagekit.io/guoguodad/mall/home/supermarket.png?updatedAt=1691716657143",
        "menuName": "超市",
        "menuCode": "m01",
        "h5url": "https://prodev.m.jd.com/mall/active/3xhqjGH1wMz5FaMgrfYhR22sFvqz/index.html"
      },{
        "menuIcon": "https://ik.imagekit.io/guoguodad/mall/home/supermarket.png?updatedAt=1691716657143",
        "menuName": "超市",
        "menuCode": "m01",
        "h5url": "https://prodev.m.jd.com/mall/active/3xhqjGH1wMz5FaMgrfYhR22sFvqz/index.html"
      },{
        "menuIcon": "https://ik.imagekit.io/guoguodad/mall/home/supermarket.png?updatedAt=1691716657143",
        "menuName": "超市",
        "menuCode": "m01",
        "h5url": "https://prodev.m.jd.com/mall/active/3xhqjGH1wMz5FaMgrfYhR22sFvqz/index.html"
      }];
    bestGoodsList.value = [
      {
        "type": "双排入口",
      },
      {
        "type": "个性入口",
      },
      {
        "type": "单品",
      }
    ];

    searchList.value = [
      {
        "title": "HUAWEI Mate 60 Pro 抢先预购"
      },
      {
        "title": "西铁城机械手表"
      },
      {
        "title": "小米 K70"
      }
    ];

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

    startTimer();
    update();
  }

  ///下拉刷新
  void onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    refreshController.refreshCompleted();
    reuqestHomeData();
  }
  /// 上拉加载
  void onLoading() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    reuqestHomeData();
    refreshController.loadComplete();
  }

  void openScan() {}
  /// 首页tabs分类
  Future<void> onTabChange(String code, List tabs) async {
      tabsCodeIndex.value = code;
  }

  ///滚动监听
  void _addScrollListener() {
    scrollController.addListener(() {
      double scrollPixels = scrollController.position.pixels;
      // print('-----scroll: ${scrollController.position.pixels}----mode: ${refreshController.headerStatus}');
      if (scrollPixels < 0) {
        homeHeaderOpacity.value = 0.0;
      } else {
        homeHeaderOpacity.value = 1.0;
      }
        /// 二层楼时是否继续隐藏头部
      if (refreshController.headerStatus == RefreshStatus.twoLevelOpening ||
          refreshController.headerStatus == RefreshStatus.twoLeveling ||
          refreshController.headerStatus == RefreshStatus.refreshing) {
        // 隐藏头部：opacity=0
        homeHeaderOpacity.value = 0.0;
      } else if (scrollPixels < -twiceTriggerDistance) {
        homeHeaderOpacity.value = 0.0;
      } else if (scrollPixels >= 0) {
        homeHeaderOpacity.value =1.0;
      } else {
        homeHeaderOpacity.value = 1 + scrollPixels / twiceTriggerDistance;
      }
    });
  }
  /// 菜单 滑动
  Future<void> setMenuSliderIndex(int index) async {
    menuSliderIndex.value = index;
  }

  void openscan() async {
    // var options = const ScanOptions(
    //   autoEnableFlash: false,
    //   android: AndroidOptions(
    //     aspectTolerance: 0.6,
    //     useAutoFocus: false,
    //   ),
    //   strings: {
    //     'cancel': "取消",
    //     'flash_on': "打开闪光灯",
    //     'flash_off': "关闭闪光灯",
    //   },
    // );

    // var result = await BarcodeScanner.scan(options: options);
    // The barcode content
    // Get.toNamed('/scan');
    // EasyLoading.showToast('开发中');
  }

   startTimer() {
    const oneSec = Duration(seconds: 5);
    _timer = Timer.periodic(oneSec, (timer) {
        if (_seconds == 0) {
          _timer.cancel();
        } else {
          _seconds--;
          getCountdown();
        }
    });
  }
  getCountdown() {
    Duration duration = Duration(seconds:_seconds);
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String hours = twoDigits(duration.inHours.remainder(60));
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    countdownString.value = "$hours:$minutes:$seconds";
  }
  void categoryPage() async{
    Get.toNamed('/category');
  }

}
