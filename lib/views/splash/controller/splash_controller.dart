
import 'dart:async';

import 'package:get/get.dart';
import 'package:mortalheart_gouyi/utils/sp_utils.dart';

class SplashController extends GetxController {
  Timer? timer;
  RxBool isShowAd = false.obs;

  //倒计时（单位：秒）10s
  late  RxInt timeCount = 4.obs;
  final adObj = {}.obs;
  @override
  void onInit() {
    super.onInit();
    final list= {
      'type':'ad_details',
       'id':1,
       'image':'https://tse4-mm.cn.bing.net/th/id/OIP-C.tAxB3qFE_on9pF_qQfPEXAHaNI?pid=ImgDet&rs=1'
    };
    adObj.value = list;
    adPage();
  }


  void adPage() async{
    // final  data = await SPUtils.getData('ad');
    // print('获取：$data');
      isShowAd.value = true;
      if (isShowAd.value) {
        startLaunchTime();
      }
    // if (data==null) {
    //   isShowAd.value = true;
    //   if (isShowAd.value) {
    //     startLaunchTime();
    //   }
    // }else{
    //   print('不是第一次加载了');
    // }
  }
  /// 开启倒计时
  Future<void> startLaunchTime() async {
    Timer(const Duration(milliseconds: 0), () {
      //periodic 周期: 1秒
      timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
        timeCount--;
        if (timeCount <= 0) {
          Timer(const Duration(milliseconds: 500), () {
            //取消倒计时，并跳转主页
            jumpToMain();
          });
        }
      });
    });
  }

  /// 跳转到主页
  void jumpToMain() {
    if (timer != null) {
      timer?.cancel();
      //关闭当前页面并跳转到主页
      SPUtils.setData('ad', false);
      Get.offAllNamed("/navigation");
    }
  }

  adOnclick() {
    if(timer !=null){
      timer?.cancel();
      SPUtils.setData('ad', false);
      // 关闭当前页面跳转广告详情和活动页
      if(adObj['type']=='ad_details'){ /// 广告详情
        return false;
      }
      if(adObj['type']=='ad'){
        return false;
      }
    }

  }
}