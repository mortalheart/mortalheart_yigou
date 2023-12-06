
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/utils/app_asset_image.dart';
import 'package:mortalheart_gouyi/utils/app_colors.dart';
import 'package:mortalheart_gouyi/utils/app_fontIcons.dart';
import 'package:mortalheart_gouyi/utils/app_screenAdapter.dart';
import 'package:mortalheart_gouyi/views/cart/controller/cart_controller.dart';
import 'package:mortalheart_gouyi/widgets/bottom_sheets/cupertino_bottom_sheet.dart';

import 'cart_adders.dart';

Widget cartHeader (BuildContext context, CartController controller) {
  return SizedBox(
    height: GouyiScreenAdapter.h(40) + getStatusHeight(context),
    child: Container(
      padding: EdgeInsets.only(top: getStatusHeight(context)),
      color: GouyiColors.yellowBegin,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          const Positioned(
            left: 10,
            bottom: 10,
            child: Text(
                '购物车',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                )
            ),
          ),
          Positioned(
              bottom: 10,
              left: 65,
              child: InkWell(
                  onTap: ()=>{
                    showCupertinoModalBottomSheet(
                      expand: false,
                      enableDrag:false,
                      bounce:false,
                      context: context,
                      builder: (context) =>  cartAdders(context,controller),
                    )
                  },
                  child:  Container(
                    height: GouyiScreenAdapter.h(20),
                    width: GouyiScreenAdapter.w(260),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(1),
                        bottomLeft: Radius.circular(15.0),
                        topRight: Radius.circular(12.0),
                        bottomRight: Radius.circular(12.0),

                      ),
                      color: GouyiColors.yellowEnd,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                         SizedBox(
                            width: GouyiScreenAdapter.w(20),
                            height: GouyiScreenAdapter.h(20),
                            child: UnconstrainedBox(
                              child: assetImage(GouyiFontIcon.icAddress, GouyiScreenAdapter.w(15), GouyiScreenAdapter.w(15)),
                            )
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: GouyiScreenAdapter.h(20),
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(right: 2),
                            child: Obx(() => Text(
                                '配送至:${controller.isCheckAdders.value}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 13
                                )
                            ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
              )
          ),
          Positioned(
              bottom: 10,
              right: 10,
              child:SizedBox(
                height: GouyiScreenAdapter.h(20),
                // width: 65.0,
                child:Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(right: 5.0),
                        child:  InkWell(
                          onTap: () => controller.isAddersOnTap(!controller.isEditing.value),
                          child: Obx(() =>  Text(
                              controller.isEditing.value?'完成':'编辑',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13
                              )
                          ),),
                        )
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 6.0),
                      // child: assetImage('images/ellipsis.png', 28, 28),
                    )
                  ],
                ),
              )
          )
        ],
      ),
    ),
  );
}