
import 'package:flutter/cupertino.dart';
import 'package:flutter_gif/flutter_gif.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter/material.dart'
    hide RefreshIndicator, RefreshIndicatorState;
class GifHeader extends RefreshIndicator {
  const GifHeader({super.key}) : super(height: 80.0, refreshStyle: RefreshStyle.Follow);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GifHeaderState();
  }
}
class GifHeaderState extends RefreshIndicatorState<GifHeader>
    with SingleTickerProviderStateMixin {
  late FlutterGifController _controller;

  @override
  void initState() {
    // TODO: implement initState
    // init frame is 2
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.repeat(
        min: 0,
        max: 13,
        period: const Duration(milliseconds: 200),
      );
    });
    super.initState();
  }

  @override
  Future<void> endRefresh() {
    // TODO: implement endRefresh
    _controller.value = 30;
    return _controller.animateTo(59, duration: const Duration(milliseconds: 500));
  }

  @override
  void resetValue() {
    // TODO: implement resetValue
    // reset not ok , the plugin need to update lowwer
    _controller.value = 0;
    super.resetValue();
  }

  @override
  Widget buildContent(BuildContext context, RefreshStatus mode) {
    // TODO: implement buildContent
    return GifImage(
      image:  const NetworkImage(
       'http://img.mp.itc.cn/upload/20161107/5cad975eee9e4b45ae9d3c1238ccf91e.jpg',
      ),
      controller: _controller,
      // height: 80.0,
      // width: 537.0,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
}
