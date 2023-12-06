import 'package:flutter/cupertino.dart';
import 'package:mortalheart_gouyi/utils/app_asset_image.dart';
import 'package:mortalheart_gouyi/utils/app_fontIcons.dart';
import 'package:mortalheart_gouyi/utils/app_screenAdapter.dart';
import 'package:mortalheart_gouyi/views/cart/controller/cart_controller.dart';

Widget cartAdders (BuildContext context, CartController controller) {
  return  SizedBox(
      height: GouyiScreenAdapter.h(400),
      child: Container(
          padding: const EdgeInsets.all(15),
          child:Column(
            children: [
              SizedBox(
                width: GouyiScreenAdapter.screenW(),
                height: GouyiScreenAdapter.h(50),
                child:  Row(
                  children: [
                    Container(
                      width:GouyiScreenAdapter.w(318),
                      alignment: Alignment.center,
                      child:const Text(
                        '配送至',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight:FontWeight.w600,
                        ),
                      ) ,
                    ),
                    GestureDetector(
                      onTap: ()=>{
                        Navigator.of(context).pop()
                      },
                      child:const Text('关闭'),
                    ),
                  ],

                ),
              ),
              Container(
                height: GouyiScreenAdapter.h(300),
                // color: CupertinoColors.destructiveRed,
                margin: const EdgeInsets.only(top: 6.0,bottom: 6.0),
                child: ListView.builder(
                    itemCount:controller.addersList.length,
                    itemBuilder: (BuildContext context, int index) {
                      String? detailed = controller.addersList[index]['detailed'];
                      String? address = controller.addersList[index]['address'];
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                              width: 25,
                              height: 25,
                              child: detailed == controller.isCheckAdders.value?  UnconstrainedBox(
                                child: assetImage(GouyiFontIcon.icCheck, 17, 17),
                              ):  UnconstrainedBox(
                                child: assetImage(GouyiFontIcon.icAddress, 17, 17),
                              )
                            // ic_check.png
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              margin: const EdgeInsets.only(bottom: 5.0),
                              padding: const EdgeInsets.only(right: 5),
                              child: GestureDetector(
                                  onTap: ()=>{
                                    controller.isCheckAdders.value = controller.addersList[index].detailed ?? '',
                                    Navigator.of(context).pop()
                                  },
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          '$detailed',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600
                                          )
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 4.0,bottom: 4.0),
                                        child: Text(
                                            '$address',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontSize: 13
                                            )
                                        ),
                                      )
                                    ],
                                  )
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                ),
              ),
              // LinearButton(
              //     width: getScreenWidth(context),
              //     height: 48,
              //     btnName: "选择其他地址",
              //     borderRadius: const BorderRadius.all(Radius.circular(50)),
              //     onTap: () => print("=======")
              // ),
            ],
          )
      )
  );
}