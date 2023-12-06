import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mortalheart_gouyi/utils/app_screenAdapter.dart';
import 'package:mortalheart_gouyi/views/me/controller/mie_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'mieProfileMenu.dart';
import 'mie_goodsListView.dart';
import 'mie_mallVIP.dart';
import 'mie_orderRecord.dart';
import 'mie_profileHeader.dart';
import 'mie_service.dart';

 mieBody (BuildContext context, MieController controller) {
  return  SmartRefresher(
      enablePullDown: true,
      controller: controller.refreshController,
      onRefresh: controller.onRefresh,
      header: const ClassicHeader(
          releaseText: '松手刷新',
          completeText: '刷新完成',
          idleText:'下拉刷新',
          refreshingText:"刷新中"
      ),
      child: ListView(
        controller: controller.scrollController,
        children: [
          mieProfileHeader(context,controller),
          Container(
            padding: EdgeInsets.all(GouyiScreenAdapter.w(8)),
            child: Column(
              children: [
                mieProfileMenu(context,controller),
                mieMallVIP(context,controller),
                SizedBox(height: GouyiScreenAdapter.h(8)),
                mieOrderRecord(context,controller),
                SizedBox(height: GouyiScreenAdapter.h(8)),
                mieService(context,controller),
                SizedBox(height: GouyiScreenAdapter.h(8)),
              ],
            ),
          ),
          mieGoodsListView(context,controller),
        ],
      ),
  );
}
