import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchControllers extends GetxController {
  TextEditingController searchController = TextEditingController();
  String? searchWords = "";
  RxList searchHistoryList = [].obs;

  @override
  void onInit() {
    super.onInit();
    getSearchHistory();
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  void getSearchHistory() async {

  }

  void deleteSearchHistoryOf(String keyWords) async {
  }

  void removeAllSearchHistory() async {
  }

  void onBack() async {
    // searchController.clear();
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    Get.back();

  }
}