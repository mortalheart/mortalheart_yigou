
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CategoryController extends GetxController{
  RefreshController refreshController = RefreshController(initialRefresh: false);
  RxInt selectIndex = 0.obs;
  RxList leftCategoryList = [{
    "_id": "59f1e1ada1da8b15d42234e9",
    "title": "电脑办公",
    "status": 1,
    "pic": "",
    "pid": "0",
    "sort": 100,
    "go_product": 0,
    "product_id": ""
  },
    {
      "_id": "59f1e1e880e7ed050cec999d",
      "title": "女装内衣",
      "status": 1,
      "pic": "",
      "pid": "0",
      "sort": 100,
      "go_product": 0,
      "product_id": ""
    },
    {
      "_id": "59f1e4659bfd8f3bd030eed3",
      "title": "运动户外",
      "status": 1,
      "pic": "",
      "pid": "0",
      "sort": 100,
      "go_product": 0,
      "product_id": ""
    },
    {
      "_id": "59f1e46e9bfd8f3bd030eed4",
      "title": "手机数码",
      "status": 1,
      "pic": "",
      "pid": "0",
      "sort": 100,
      "go_product": 0,
      "product_id": ""
    },
    {
      "_id": "59f1e47e9bfd8f3bd030eed5",
      "title": "化妆品",
      "status": 1,
      "pic": "",
      "pid": "0",
      "sort": 100,
      "go_product": 0,
      "product_id": ""
    },
    {
      "_id": "5a04251e010e711234661438",
      "title": "箱包",
      "status": 1,
      "pic": "",
      "pid": "0",
      "sort": 100,
      "go_product": 0,
      "product_id": ""
    },
    {
      "_id": "5a04261e010e71123466143a",
      "title": "女鞋",
      "status": 1,
      "pic": "",
      "pid": "0",
      "sort": 100,
      "go_product": 0,
      "product_id": ""
    },
    {
      "_id": "5a042e29010e711234661443",
      "title": "汽车用品",
      "status": 1,
      "pic": "",
      "pid": "0",
      "sort": 100,
      "go_product": 0,
      "product_id": ""
    },
    {
      "_id": "5a042f27010e711234661446",
      "title": "酒水饮料",
      "status": 1,
      "pic": "",
      "pid": "0",
      "sort": 100,
      "go_product": 0,
      "product_id": ""
    },
    {
      "_id": "633122b71d033b0970c714b8",
      "title": "穿戴设备",
      "status": 1,
      "pic": "public\\upload\\ObTaeolxy6fJ50vPMBhCS_sO",
      "pid": "0",
      "sort": 0,
      "go_product": 0,
      "product_id": ""
    },
    {
      "_id": "633122b71d033b0970c714b8",
      "title": "穿戴设备1",
      "status": 1,
      "pic": "public\\upload\\ObTaeolxy6fJ50vPMBhCS_sO",
      "pid": "0",
      "sort": 0,
      "go_product": 0,
      "product_id": ""
    },
    {
      "_id": "633122b71d033b0970c714b8",
      "title": "穿戴设备2",
      "status": 1,
      "pic": "public\\upload\\ObTaeolxy6fJ50vPMBhCS_sO",
      "pid": "0",
      "sort": 0,
      "go_product": 0,
      "product_id": ""
    },
    {
      "_id": "633122b71d033b0970c714b8",
      "title": "穿戴设备3",
      "status": 1,
      "pic": "public\\upload\\ObTaeolxy6fJ50vPMBhCS_sO",
      "pid": "0",
      "sort": 0,
      "go_product": 0,
      "product_id": ""
    },
    {
      "_id": "633122b71d033b0970c714b8",
      "title": "穿戴设备4",
      "status": 1,
      "pic": "public\\upload\\ObTaeolxy6fJ50vPMBhCS_sO",
      "pid": "0",
      "sort": 0,
      "go_product": 0,
      "product_id": ""
    },
    {
      "_id": "633122b71d033b0970c714b8",
      "title": "穿戴设备5",
      "status": 1,
      "pic": "public\\upload\\ObTaeolxy6fJ50vPMBhCS_sO",
      "pid": "0",
      "sort": 0,
      "go_product": 0,
      "product_id": ""
    },
    {
      "_id": "633122b71d033b0970c714b8",
      "title": "穿戴设备6",
      "status": 1,
      "pic": "public\\upload\\ObTaeolxy6fJ50vPMBhCS_sO",
      "pid": "0",
      "sort": 0,
      "go_product": 0,
      "product_id": ""
    },
    {
      "_id": "633122b71d033b0970c714b8",
      "title": "穿戴设备7",
      "status": 1,
      "pic": "public\\upload\\ObTaeolxy6fJ50vPMBhCS_sO",
      "pid": "0",
      "sort": 0,
      "go_product": 0,
      "product_id": ""
    },
    {
      "_id": "633122b71d033b0970c714b8",
      "title": "穿戴设备",
      "status": 1,
      "pic": "public\\upload\\ObTaeolxy6fJ50vPMBhCS_sO",
      "pid": "0",
      "sort": 0,
      "go_product": 0,
      "product_id": ""
    }].obs;
  RxList rightCategoryList = [
    {
      "_id": "59f1e4f49bfd8f3bd030eed9",
      "title": "羽绒服",
      "status": 1,
      "pic": "https://xiaomi.itying.com/public/upload/lUKcKYWg6kOwprXx8L_OLDaq.jpg",
      "pid": "59f1e1e880e7ed050cec999d",
      "sort": 100,
      "is_best": 1,
      "go_product": 0,
      "product_id": ""
    },
    {
      "_id": "59f1e5019bfd8f3bd030eeda",
      "title": "毛呢大衣",
      "status": 1,
      "pic": "https://xiaomi.itying.com/public/upload/P0k6kLaHB1S35jSNWi2j9TH7.jpg",
      "pid": "59f1e1e880e7ed050cec999d",
      "sort": 100,
      "go_product": 0,
      "product_id": ""
    },
    {
      "_id": "59f1e5099bfd8f3bd030eedb",
      "title": "连衣裙",
      "status": 1,
      "pic": "https://xiaomi.itying.com/public/upload/nuyUqOC4E4vPN7vSMCkb0Xu5.jpg",
      "pid": "59f1e1e880e7ed050cec999d",
      "sort": 100,
      "go_product": 0,
      "product_id": ""
    },
    {
      "_id": "5a050c7f010e711234661465",
      "title": "外套",
      "status": 1,
      "pic": "https://xiaomi.itying.com/public/upload/TCCCj5BHhZc6vrmrcB_DlQL8.jpg",
      "pid": "59f1e1e880e7ed050cec999d",
      "sort": 0,
      "is_best": 1,
      "go_product": 0,
      "product_id": ""
    },
    {
      "_id": "5a050ca5010e711234661466",
      "title": "长袖连衣裙",
      "status": 1,
      "pic": "https://xiaomi.itying.com/public/upload/Rn45uI7M2cIliho78sups1fx.jpg",
      "pid": "59f1e1e880e7ed050cec999d",
      "sort": 0,
      "is_best": 0,
      "go_product": 0,
      "product_id": ""
    }
  ].obs;

  @override
  void onInit() {
    super.onInit();
    leftCategoryData();
  }


  @override
  void dispose() {
    super.dispose();
    refreshController.dispose();
  }
  ///下拉刷新
  void onRefresh() {
    leftCategoryData();
  }

  void changeIndex(index, id) {
    selectIndex.value = index;
    rightCategoryData(id);
    update();
  }

  void leftCategoryData() async {

  }

  void rightCategoryData(String id) async {

  }
}