
import 'package:get/get.dart';

class FoundController extends GetxController {
  RxList tabs = [].obs;
  RxString tabsCodeIndex = "1".obs;
  @override
  void onInit() {
    super.onInit();
    reuqestHomeData();
  }
  onTabChange(element) {
    tabsCodeIndex.value = element["code"];
  }

  void reuqestHomeData() {
    tabs.value = [{
      "name":"关注",
      "code": "1"
    },{
      "name":"推荐",
      "code": "2"
    },{
      "name":"朋友",
      "code": "3"
    }];
  }
}