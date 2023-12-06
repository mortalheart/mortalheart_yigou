
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/utils/app_colors.dart';
import 'package:mortalheart_gouyi/utils/app_screenAdapter.dart';
import 'package:mortalheart_gouyi/utils/app_searchService.dart';
import 'package:mortalheart_gouyi/views/details/search_page/controller/search_controller.dart';
import 'package:mortalheart_gouyi/widgets/app_components.dart';

class SearchViews extends GetView<SearchControllers>{
  const SearchViews({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: GouyiColors.gray249,
      appBar: _customAppBar(),
      body: _contentListView(),
    );
  }
  /// 自定义的appBar
  AppBar _customAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white, //Colors.transparent=白色透明度为0
      elevation: 0,
      leading:  IconButton(
        icon:  const Icon(Icons.arrow_back_ios),
        onPressed:()=>controller.onBack(),
      ),
      title: Container(
          alignment: Alignment.centerLeft,
          // padding: const EdgeInsets.symmetric(horizontal: 10),
          width: GouyiScreenAdapter.w(250), //最长也不知道多少生效
          height: GouyiScreenAdapter.h(26),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(246, 246, 246, 1),
            // color: DoColors.theme,
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            controller: controller.searchController,
            autofocus: true,
            style: const TextStyle(fontSize: 14, color: Colors.black54),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(0),
              // hintText: "手机",
              // prefixText: "手机", //有接口的话可以做成活的
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.black26,
                size: 20,
              ),
              prefixIconConstraints:
              BoxConstraints(minWidth: GouyiScreenAdapter.w(40)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none),
            ),
            onChanged: (value) {
              controller.searchWords = value;
            },
            //监听键盘上的回车事件
            onSubmitted: (value) {
              if (value.isEmpty) {
                ///后面可以加个toast提示
                return;
              }
              GouyiSearchService.saveSearchHistory(value);

            },
          )),
      actions: [
        TextButton(
            onPressed: () {
              if (controller.searchWords!.isEmpty) {
                ///后面可以加个toast提示
                return;
              }

            },
            child: const Text(
              "搜索",
              style: TextStyle(fontSize: 14, color: Colors.black87),
            )),
      ],
    );
  }

  /// 列表内容区
  ///!!!ListView中添加的子控件，自动会居中，比如本页中的wrapView就会受到影响
  Widget _contentListView() {
    return ListView(
      padding: EdgeInsets.all(GouyiScreenAdapter.w(10)),
      children: [
        _searchHistoryHeader(),
        _searchHistoryWrapView(),
        _suggestSearchHeader(),
        _suggestSearchWrapView(),
        SizedBox(height: GouyiScreenAdapter.h(20)),
        _hotGridView()
      ],
    );
  }

  ///搜索历史头部
  Widget _searchHistoryHeader() {
    return Obx(
          () => controller.searchHistoryList.isNotEmpty
          ? commonHeader(
        title: "搜索历史",
        onTap: () {
          _showRemoveAllSearchAlertDialog();
        },
        trailing: const Icon(
          Icons.delete_forever,
          size: 20,
          color: Colors.black54,
        ),
      )
          : const SizedBox(
        width: 0,
        height: 0,
      ),
    );
  }

  ///搜素历史
  Widget _searchHistoryWrapView() {
    return Obx(
          () => Wrap(
        spacing: GouyiScreenAdapter.w(10), //水平
        runSpacing: GouyiScreenAdapter.w(10), //垂直
        children: controller.searchHistoryList.map((element) {
          return _commonSearchWidget(title: element, isNeedDelete: true);
        }).toList(),
      ),
    );
  }

  ///猜你想搜头部
  Widget _suggestSearchHeader() {
    return commonHeader(
      title: "猜你想搜",
      onTap: () {
        EasyLoading.showToast("更换想搜数据");
      },
      trailing: const Icon(
        Icons.refresh,
        size: 20,
        color: Colors.black54,
      ),
    );
  }

  ///猜你想搜
  Widget _suggestSearchWrapView() {
    return Wrap(
      spacing: GouyiScreenAdapter.w(10), //水平
      runSpacing: GouyiScreenAdapter.w(10), //垂直
      children: [
        _commonSearchWidget(title: "手机保护壳"),
        _commonSearchWidget(title: "空调"),
      ],
    );
  }

  /// 搜索
  Widget _hotGridView() {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: GouyiScreenAdapter.h(40),
              padding: EdgeInsets.only(left: GouyiScreenAdapter.w(15),right: GouyiScreenAdapter.w(15),top: GouyiScreenAdapter.w(10),),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
              ),
              child:const Text('热销专区',style: TextStyle(
                  color: GouyiColors.redEnd,
                  fontWeight: FontWeight.w600
              ),),
            ),
            Container(
              padding: EdgeInsets.only(left: GouyiScreenAdapter.w(15),right: GouyiScreenAdapter.w(15)),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: GouyiScreenAdapter.h(4)),
                        child: Stack(
                          children: [
                            SizedBox(
                              width: GouyiScreenAdapter.w(50),
                              height: GouyiScreenAdapter.h(40),
                              child: index<3? ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.network(
                                  "https://www.itying.com/images/shouji.png",
                                  fit: BoxFit.cover,
                                ),
                              ):Container(
                                alignment: Alignment.center,
                                child: Container(
                                  width:GouyiScreenAdapter.w(25),
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5)),
                                  ),
                                  padding: EdgeInsets.all(GouyiScreenAdapter.w(4)),
                                  child: Text('${index+1}',style:  TextStyle(
                                    color: Colors.white,
                                    fontSize: GouyiScreenAdapter.fs(12),

                                  ),textAlign: TextAlign.center,),
                                ),
                              ),
                            ),
                            if(index<3)
                              Positioned(
                                left: 0,
                                child:Container(
                                  width:GouyiScreenAdapter.w(25),
                                  decoration:  BoxDecoration(
                                    color:index==0? Colors.red:index==1?Colors.pink:Colors.lightGreen,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5)),
                                  ),
                                  padding: EdgeInsets.all(GouyiScreenAdapter.w(4)),
                                  child: Text('${index + 1}',style:  TextStyle(
                                      color: Colors.white,
                                      fontSize: GouyiScreenAdapter.fs(12)
                                  ),textAlign: TextAlign.center,),
                                ),
                                // left: 0,
                                // bottom: 0,
                                // right: 0,
                              )
                          ],
                        ),
                      ),
                      Expanded(
                          child: Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.all(GouyiScreenAdapter.w(5)),
                            child: Text(
                              "商品名称$index",
                              style: TextStyle(fontSize: GouyiScreenAdapter.fs(12)),
                            ),
                          )
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ));
  }

  ///----事件----
  ///清空搜索历史弹框
  void _showRemoveAllSearchAlertDialog() async {
    await showCupertinoDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text(
            "温馨提示",
          ),
          content: const Text("确定要清空搜索历史么？"),
          actions: [
            TextButton(
              onPressed: () {
                controller.removeAllSearchHistory();
                Get.back();
              },
              child: const Text("确定",
                  style: TextStyle(fontSize: 14, color: GouyiColors.theme)),
            ),
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text("取消"))
          ],
        );
      },
    );
  }

  ///删除某个历史搜索记录弹框
  void _showDeleteSearchAlertDialog(String title) async {
    await showCupertinoDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text(
            "温馨提示",
          ),
          content: const Text("确定要删除该搜索记录么？"),
          actions: [
            // CupertinoDialogAction(
            //   child: const Text("CupertinoDialogAction"),
            //   onPressed: () {
            //     print("");
            //   },
            //   // isDefaultAction: true,//加粗了点
            //   // isDestructiveAction: true,//红色
            // ),
            TextButton(
              onPressed: () {
                controller.deleteSearchHistoryOf(title);
                Get.back();
              },
              child: const Text("确定",
                  style: TextStyle(fontSize: 14, color: GouyiColors.theme)),
            ),
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text("取消"))
          ],
        );
      },
    );
  }

  ///----封装区域----
  ///只在当前页面用的就不抽出当前页面了
  ///抽取了一个搜索字段组件
  Widget _commonSearchWidget({
    required String title,
    // required bool isNeedDelete,//需要设置false的多，所以如下了
    bool isNeedDelete = false,
    // Function()? longPressFunc,
    // Function()? tapFunc
  }) {
    return GestureDetector(
      onLongPress: () {
        if (isNeedDelete) {
          _showDeleteSearchAlertDialog(title);
        }
      },
      onTap: () {
        controller.searchWords = title;
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(5))),
        padding: EdgeInsets.fromLTRB(GouyiScreenAdapter.w(10),
            GouyiScreenAdapter.h(5), GouyiScreenAdapter.w(10), GouyiScreenAdapter.h(5)),
        child: Text(
          title,
          style: const TextStyle(fontSize: 12),
        ),
      ),
    );
  }

}
