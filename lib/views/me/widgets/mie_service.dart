import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mortalheart_gouyi/utils/app_screenAdapter.dart';
import 'package:mortalheart_gouyi/views/me/controller/mie_controller.dart';
import 'package:mortalheart_gouyi/widgets/app_components.dart';

Widget mieService (BuildContext context, MieController controller) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(10))),
    child: Column(
      children: [
        Container(
          // color: Colors.purple,
          padding: EdgeInsets.symmetric(horizontal: GouyiScreenAdapter.w(10)),
          child: commonHeader(
              title: "服务",
              onTap: () {
                EasyLoading.showToast("全部服务页面");
              },
              trailing: Row(
                children: [
                  Text(
                    "查看更多",
                    style: TextStyle(
                        fontSize: GouyiScreenAdapter.fs(12), color: Colors.black38),
                  ),
                  SizedBox(
                    width: GouyiScreenAdapter.w(5),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 12,
                    color: Colors.black38,
                  ),
                ],
              )

          ),
        ),
        SizedBox(
            height: GouyiScreenAdapter.h(140),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 20,
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: GouyiScreenAdapter.w(10),
                  crossAxisSpacing: GouyiScreenAdapter.w(10),
                  childAspectRatio: 1),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    EasyLoading.showToast('测试');
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.contactless_sharp,
                        // color: controller.serviceList[index]["color"],
                      ),
                      SizedBox(
                        height: GouyiScreenAdapter.h(10),
                      ),
                      Text(
                       '测试',
                        style: TextStyle(fontSize: GouyiScreenAdapter.fs(12)),
                      ),
                    ],
                  ),
                );
              },
            )
        ),
      ],
    ),
  );
}