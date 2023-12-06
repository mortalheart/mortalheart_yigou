import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:mortalheart_gouyi/utils/app_asset_image.dart';
import 'package:mortalheart_gouyi/utils/app_colors.dart';
import 'package:mortalheart_gouyi/utils/app_fontIcons.dart';
import 'package:mortalheart_gouyi/widgets/text_item.dart';

import 'line_two.dart';

Widget goodsItem(BuildContext context,  item, double width) {
  //
  List<Widget> widgets = [
    ClipRRect(
      borderRadius: const BorderRadius.only(topLeft: Radius.circular(6.0), topRight: Radius.circular(6.0)),
      child: CachedNetworkImage(
        width: width,
        height: width,
        imageUrl: item['imgUrl'] ?? "",
        placeholder: (context, url) => assetImage(GouyiFontIcon.defaultIn, width, width),
        errorWidget: (context, url, error) => assetImage(GouyiFontIcon.defaultIn, width, width),
        fit: BoxFit.fill,
      ),
    ),
  ];

  if (item['type'] == "2") {
    widgets.add(
      textItem(
        marginTop: 10,
        paddingLeft: 5,
        paddingRight: 6,
        bgColor: GouyiColors.string2Color("#ED4637"),
        gradient: LinearGradient(colors: [GouyiColors.string2Color("#E44746"), GouyiColors.string2Color("#E3909B")]),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        txt: item['tag'].toString(),
        fColor: Colors.white,
        fSize: 14,
      ),
    );
    widgets.add(
      textItem(
        marginTop: 2,
        paddingLeft: 0,
        paddingRight: 6,
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        txt: item['des1'].toString(),
        fColor:GouyiColors.string2Color("#ED4637"),
        fSize: 16,
      ),
    );
    widgets.add(
      textItem(
        marginTop: 2,
        paddingLeft: 0,
        paddingRight: 6,
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        txt: item['des2'].toString(),
        fColor:GouyiColors.string2Color("#737473"),
        fSize: 14,
      ),
    );
    widgets.add(
      textItem(
        marginTop: 2,
        paddingLeft: 3,
        paddingRight: 3,
        bgColor:GouyiColors.string2Color("#FDF4F0"),
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        txt: "点击进入",
        fColor:GouyiColors.string2Color("#ED4637"),
        fSize: 12,
      ),
    );
  } else {
    widgets.add(
      lineTwo(
        txt: item['description'].toString(),
        fColor:GouyiColors.string2Color("#737473"),
      ),
    );

    widgets.add(
      Container(
        margin: const EdgeInsets.only(top: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            lineTwo(
              txt: "￥${item['price'].toString()}",
              fColor:GouyiColors.string2Color("#ED4637"),
              fontWeight: FontWeight.bold,
            ),
            textItem(
              marginTop: 2,
              paddingLeft: 2,
              paddingRight: 2,
              bgColor:GouyiColors.string2Color("#F4F4F5"),
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(6), bottomLeft: Radius.circular(6)),
              txt: "看相似",
              fColor:GouyiColors.string2Color("#A4A5A4"),
              fSize: 12,
            ),
          ],
        ),
      ),
    );
  }

  return GestureDetector(
    onTap: () {
      if (item["type"] == '1') Navigator.of(context).pushNamed("/goods-content",);
      // if (item["type"] == '2');
    },
    child: Container(
      padding: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: const Offset(0, 0), // 偏移量
            blurRadius: 8,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widgets,
      ),
    ),
  );
}
