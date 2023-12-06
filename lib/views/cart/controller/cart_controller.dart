
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CartController extends GetxController{
  // 配送默认地址
  final isCheckAdders = RxString('北京市海淀区西四环北路123号');
  // 是否编辑
  final isAdders = RxBool(false);
  RefreshController refreshController = RefreshController(initialRefresh: false);
  // bool isCanJumpGoodsInfo =
  // Get.arguments != null ? Get.arguments["isCanJumpGoodsInfo"] : false;
  RxList goodsList = [].obs;
  RxBool isEditing = false.obs;
  RxList cartList = [].obs;
  RxList addersList = [{
    'address': '北京市地质矿产勘查院',
    'detailed': '北京市海淀区西四环北路123号',
    'phone': '13847929103',
    'mobile': '(010)51560123',
    'name': '段蔚漪'
  }].obs;
  RxBool checkedAllState = false.obs;
  RxInt checkedTotalCount = 0.obs;
  RxDouble checkedTotalPrice = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    _requestGoodsData();
  }

  @override
  void dispose() {
    super.dispose();
    refreshController.dispose();
  }
  ///下拉刷新
  void onRefresh() {
    refreshController.refreshCompleted();
  }

  ///请求瀑布流商品数据
  void _requestGoodsData() async {

  }

  ///获取本地购物车数据
  void getLocalCartList() async {

  }

  ///增加购买数量
  void plusBuyNumber(Map element) async {

  }

  ///减少购买数量
  void minusBuyNumber(Map element) async {

  }

  ///改变选中状态
  void changeCheckboxState(Map element) async {
  }

  ///改变全选状态
  void changeCheckedAllBoxState(bool? state) async {
  }

  ///判断是不是全选
  bool? judgeIsCheckedAll() {
    return null;


  }

  ///获取已经选中的清单
  List getCheckedList() {
    var tempList = [];

    return tempList;
  }

  ///删除物品
  void deleteGoods() {

  }
  /// 改变编辑状态
  isAddersOnTap(bool bool) {
    isEditing.value = bool;
    update();
  }
}