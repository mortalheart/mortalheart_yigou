import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/utils/app_colors.dart';
import 'package:mortalheart_gouyi/views/found/widget/foundVideo.dart';
import 'package:mortalheart_gouyi/views/found/widget/header.dart';
import 'controller/found_controller.dart';

class FoundViews extends GetView<FoundController> {
  const FoundViews({super.key});
  /// 1、header： 左侧-头像（点击左侧滑出） 中间-tab（关注、推荐、朋友） 右侧-搜索（跳转搜索组件模块）
  /// 2、内容区：默认播放视频（根据Type类型去判断是否直播）
  ///     1、头像、关注、查看资料
  ///     2、点赞、收藏、分享、评论
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
              backgroundColor: GouyiColors.gray249,
              body: Stack(
                alignment: Alignment.center,
                children: [
                  foundVideo(context,controller),
                  foundHeader(context,controller),
                ],
              ),
          );
  }
}