import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mortalheart_gouyi/utils/app_colors.dart';
import 'package:mortalheart_gouyi/utils/app_screenAdapter.dart';
import 'package:mortalheart_gouyi/views/home/controller/home_controller.dart';
Widget homeBestGoods(BuildContext context,HomeController controller) {
  return Container(
    padding: EdgeInsets.fromLTRB(
        GouyiScreenAdapter.w(10),
        GouyiScreenAdapter.w(8),
        GouyiScreenAdapter.w(10),
        GouyiScreenAdapter.w(8)
    ),
    child:Obx(() => buildBastList(controller.bestGoodsList,controller))
  );
}
/// 小组件 布局分类
Widget buildBastList(RxList bestGoodsList, HomeController controller) {
  return  Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: bestGoodsList.map<Widget>((element) =>
  element['type']=='双排入口'?
  singleRow(element,controller):element['type'] == '个性入口'?
  leftOneRightThree(element,controller):element['type'] == '单品'?
  leftOneRightTwo(element,controller):
  const Text('')
    ).toList(),
  );
}

leftOneRightTwo(element, HomeController controller) {
 return Container(
   margin: EdgeInsets.only(bottom: GouyiScreenAdapter.h(8)),
   child: Column(
     mainAxisAlignment: MainAxisAlignment.start,
     crossAxisAlignment: CrossAxisAlignment.start,
     children: [
       SizedBox(
         height:GouyiScreenAdapter.h(30),
         child:   Row(
           children: [
             Text("限时秒杀",style: TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: GouyiScreenAdapter.fs(13),
                 color: GouyiColors.string2Color('#333333')
             ),),
             SizedBox(width: GouyiScreenAdapter.w(5),),
             Obx(() =>
                 Container(
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(6)),
                       border: Border.all(
                           color: GouyiColors.string2Color('#ff0052'),
                           width: GouyiScreenAdapter.w(1)
                       )
                   ),
                   child: Row(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       Container(
                         padding: EdgeInsets.only(left: GouyiScreenAdapter.w(7),right: GouyiScreenAdapter.w(7),bottom: GouyiScreenAdapter.w(2),top: GouyiScreenAdapter.w(2)),
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(3)),
                           color: GouyiColors.string2Color('#ff0052'),
                         ),
                         child: Text('9点场',style: TextStyle(
                             fontSize: GouyiScreenAdapter.fs(13),
                             color: GouyiColors.string2Color('#ffffff')
                         ),),
                       ),
                       Container(
                         padding: EdgeInsets.only(left: GouyiScreenAdapter.w(7),right: GouyiScreenAdapter.w(7),bottom: GouyiScreenAdapter.w(2),top: GouyiScreenAdapter.w(2)),
                         child:
                         Text(
                           controller.countdownString.value,style: TextStyle(
                           color: GouyiColors.string2Color('#ff0052'),
                           fontSize: GouyiScreenAdapter.fs(12),
                         ),),
                       )
                     ],
                   ),
                 )
             )
           ],
         ),
       ),
       SizedBox(height: GouyiScreenAdapter.h(4),),
       Row(
         crossAxisAlignment: CrossAxisAlignment.start,
         mainAxisAlignment: MainAxisAlignment.start,
         children: [
           Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               ClipRRect(
                 borderRadius:  BorderRadius.all(Radius.circular(GouyiScreenAdapter.w(6))),
                 child: CachedNetworkImage(
                   width: GouyiScreenAdapter.w(85),
                   height: GouyiScreenAdapter.h(75),
                   imageUrl: 'https://ik.imagekit.io/guoguodad/mall/common/goods4.jpeg?updatedAt=1691718085548',
                   fit: BoxFit.cover,
                 ),
               ),
               SizedBox(
                 height: GouyiScreenAdapter.h(4),
               ),
               Text('￥199',style: TextStyle(
                   fontWeight: FontWeight.bold,
                   fontSize: GouyiScreenAdapter.fs(13),
                   color: GouyiColors.string2Color('#F44336')
               )),
             ],
           ),
           SizedBox(width: GouyiScreenAdapter.w(4),),
           Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               ClipRRect(
                 borderRadius:  BorderRadius.all(Radius.circular(GouyiScreenAdapter.w(6))),
                 child: CachedNetworkImage(
                   width: GouyiScreenAdapter.w(85),
                   height: GouyiScreenAdapter.h(75),
                   imageUrl: 'https://ik.imagekit.io/guoguodad/mall/common/goods4.jpeg?updatedAt=1691718085548',
                   fit: BoxFit.cover,
                 ),
               ),
               SizedBox(
                 height: GouyiScreenAdapter.h(4),
               ),
               Text('￥199',style: TextStyle(
                   fontWeight: FontWeight.bold,
                   fontSize: GouyiScreenAdapter.fs(13),
                   color: GouyiColors.string2Color('#F44336')
               )),
             ],
           ),
           SizedBox(width: GouyiScreenAdapter.w(4),),
           Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               ClipRRect(
                 borderRadius:  BorderRadius.all(Radius.circular(GouyiScreenAdapter.w(6))),
                 child: CachedNetworkImage(
                   width: GouyiScreenAdapter.w(85),
                   height: GouyiScreenAdapter.h(75),
                   imageUrl: 'https://ik.imagekit.io/guoguodad/mall/common/goods4.jpeg?updatedAt=1691718085548',
                   fit: BoxFit.cover,
                 ),
               ),
               SizedBox(
                 height: GouyiScreenAdapter.h(4),
               ),
               Text('￥199',style: TextStyle(
                   fontWeight: FontWeight.bold,
                   fontSize: GouyiScreenAdapter.fs(13),
                   color: GouyiColors.string2Color('#F44336')
               )),
             ],
           ),
           SizedBox(width: GouyiScreenAdapter.w(4),),
           Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               ClipRRect(
                 borderRadius:  BorderRadius.all(Radius.circular(GouyiScreenAdapter.w(6))),
                 child: CachedNetworkImage(
                   width: GouyiScreenAdapter.w(85),
                   height: GouyiScreenAdapter.h(75),
                   imageUrl: 'https://ik.imagekit.io/guoguodad/mall/common/goods4.jpeg?updatedAt=1691718085548',
                   fit: BoxFit.cover,
                 ),
               ),
               SizedBox(
                 height: GouyiScreenAdapter.h(4),
               ),
               Text('￥199',style: TextStyle(
                   fontWeight: FontWeight.bold,
                   fontSize: GouyiScreenAdapter.fs(13),
                   color: GouyiColors.string2Color('#F44336')
               )),
             ],
           ),
         ],
       )
     ],
   ),
 );
}

leftOneRightThree(element, HomeController controller) {
  return Container(
    margin: EdgeInsets.only(bottom: GouyiScreenAdapter.h(8)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: GouyiScreenAdapter.w(4)),
              child:  Text("百亿补贴",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: GouyiScreenAdapter.fs(13),
                  color: GouyiColors.string2Color('#333333')
              ),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius:  BorderRadius.all(Radius.circular(GouyiScreenAdapter.w(6))),
                      child: CachedNetworkImage(
                        width: GouyiScreenAdapter.w(85),
                        height: GouyiScreenAdapter.h(75),
                        imageUrl: 'https://ik.imagekit.io/guoguodad/mall/common/goods4.jpeg?updatedAt=1691718085548',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: GouyiScreenAdapter.h(4),
                    ),
                    Text('￥199',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: GouyiScreenAdapter.fs(13),
                        color: GouyiColors.string2Color('#F44336')
                    )),
                  ],
                ),
                SizedBox(width: GouyiScreenAdapter.w(4),),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius:  BorderRadius.all(Radius.circular(GouyiScreenAdapter.w(6))),
                      child: CachedNetworkImage(
                        width: GouyiScreenAdapter.w(85),
                        height: GouyiScreenAdapter.h(75),
                        imageUrl: 'https://ik.imagekit.io/guoguodad/mall/common/goods4.jpeg?updatedAt=1691718085548',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: GouyiScreenAdapter.h(4),
                    ),
                    Text('￥199',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: GouyiScreenAdapter.fs(13),
                        color: GouyiColors.string2Color('#F44336')
                    )),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: GouyiScreenAdapter.h(8),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius:  BorderRadius.all(Radius.circular(GouyiScreenAdapter.w(6))),
                      child: CachedNetworkImage(
                        width: GouyiScreenAdapter.w(85),
                        height: GouyiScreenAdapter.h(75),
                        imageUrl: 'https://ik.imagekit.io/guoguodad/mall/common/goods4.jpeg?updatedAt=1691718085548',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: GouyiScreenAdapter.h(4),
                    ),
                    Text('￥199',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: GouyiScreenAdapter.fs(13),
                        color: GouyiColors.string2Color('#F44336')
                    )),
                  ],
                ),
                SizedBox(width: GouyiScreenAdapter.w(4),),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius:  BorderRadius.all(Radius.circular(GouyiScreenAdapter.w(6))),
                      child: CachedNetworkImage(
                        width: GouyiScreenAdapter.w(85),
                        height: GouyiScreenAdapter.h(75),
                        imageUrl: 'https://ik.imagekit.io/guoguodad/mall/common/goods4.jpeg?updatedAt=1691718085548',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: GouyiScreenAdapter.h(4),
                    ),
                    Text('￥199',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: GouyiScreenAdapter.fs(13),
                        color: GouyiColors.string2Color('#F44336')
                    )),
                  ],
                ),
              ],
            )
          ],
        ),
        SizedBox(width: GouyiScreenAdapter.w(7),),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: GouyiScreenAdapter.w(4)),
              child:  Row(
                children: [
                  Text("9.9",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: GouyiScreenAdapter.fs(13),
                      color: GouyiColors.string2Color('#F44336')
                  ),),
                  Container(
                    margin: EdgeInsets.only(left: GouyiScreenAdapter.w(3),right: GouyiScreenAdapter.w(3)),
                    child:  Text("包邮",style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: GouyiScreenAdapter.fs(13),
                        color: GouyiColors.string2Color('#00000')
                    ),),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(GouyiScreenAdapter.w(4), GouyiScreenAdapter.w(0), GouyiScreenAdapter.w(6), GouyiScreenAdapter.w(0)),
                    width: GouyiScreenAdapter.w(90),
                    height: GouyiScreenAdapter.w(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(6)),
                      color:  GouyiColors.string2Color('#F44336'),
                    ),
                    child: Text('立即抢购',style: TextStyle(
                        fontSize: GouyiScreenAdapter.fs(12),
                        color: GouyiColors.string2Color('#ffffff')
                    )
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(6)),
                color: Colors.white,
              ),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius:  BorderRadius.all(Radius.circular(GouyiScreenAdapter.w(6))),
                        child: CachedNetworkImage(
                          width: GouyiScreenAdapter.w(85),
                          height: GouyiScreenAdapter.h(75),
                          imageUrl: 'https://ik.imagekit.io/guoguodad/mall/common/goods4.jpeg?updatedAt=1691718085548',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: GouyiScreenAdapter.h(4),
                      ),
                      Text('￥199',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: GouyiScreenAdapter.fs(13),
                          color: GouyiColors.string2Color('#F44336')
                      )),
                    ],
                  ),
                  SizedBox(width: GouyiScreenAdapter.w(4),),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius:  BorderRadius.all(Radius.circular(GouyiScreenAdapter.w(6))),
                        child: CachedNetworkImage(
                          width: GouyiScreenAdapter.w(85),
                          height: GouyiScreenAdapter.h(75),
                          imageUrl: 'https://ik.imagekit.io/guoguodad/mall/common/goods4.jpeg?updatedAt=1691718085548',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: GouyiScreenAdapter.h(4),
                      ),
                      Text('￥199',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: GouyiScreenAdapter.fs(13),
                          color: GouyiColors.string2Color('#F44336')
                      )),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: GouyiScreenAdapter.h(8),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(6)),
                color: Colors.white,
              ),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('直播',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: GouyiScreenAdapter.fs(13),
                          color: GouyiColors.string2Color('#00000')
                      )),
                      SizedBox(
                        height: GouyiScreenAdapter.h(4),
                      ),
                      ClipRRect(
                        borderRadius:  BorderRadius.all(Radius.circular(GouyiScreenAdapter.w(6))),
                        child: CachedNetworkImage(
                          width: GouyiScreenAdapter.w(85),
                          height: GouyiScreenAdapter.h(75),
                          imageUrl: 'https://ik.imagekit.io/guoguodad/mall/common/goods4.jpeg?updatedAt=1691718085548',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: GouyiScreenAdapter.w(4),),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('买菜',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: GouyiScreenAdapter.fs(13),
                          color: GouyiColors.string2Color('#00000')
                      )),
                      SizedBox(
                        height: GouyiScreenAdapter.h(4),
                      ),
                      ClipRRect(
                        borderRadius:  BorderRadius.all(Radius.circular(GouyiScreenAdapter.w(6))),
                        child: CachedNetworkImage(
                          width: GouyiScreenAdapter.w(85),
                          height: GouyiScreenAdapter.h(75),
                          imageUrl: 'https://ik.imagekit.io/guoguodad/mall/common/goods4.jpeg?updatedAt=1691718085548',
                          fit: BoxFit.cover,
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

singleRow(element, HomeController controller) {
   return Container(
     margin: EdgeInsets.only(bottom: GouyiScreenAdapter.h(8)),
     child: Column(
       /// 双排多入口
       crossAxisAlignment: CrossAxisAlignment.start,
       mainAxisAlignment: MainAxisAlignment.start,
       children: [
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 SizedBox(
                   height: GouyiScreenAdapter.h(20),
                   child:  Text("聚划算",style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: GouyiScreenAdapter.fs(13),
                       color: GouyiColors.string2Color('#333333')
                   ),),
                 ),
                 Row(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Container(
                       width: GouyiScreenAdapter.w(85),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(6)),
                         color:  GouyiColors.string2Color('#f9d07c'),
                       ),
                       padding: EdgeInsets.all(GouyiScreenAdapter.w(4)),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text("抢购",style: TextStyle(
                             color: Colors.white,
                             fontSize: GouyiScreenAdapter.fs(12),
                           ),),
                           SizedBox(height:GouyiScreenAdapter.h(2) ,),
                           CachedNetworkImage(
                             height: GouyiScreenAdapter.h(70),
                             imageUrl: 'https://ik.imagekit.io/guoguodad/mall/common/goods4.jpeg?updatedAt=1691718085548',
                             fit: BoxFit.cover,
                           ),
                         ],
                       ),
                     ),
                     SizedBox(width: GouyiScreenAdapter.w(4),),
                     Container(
                       width: GouyiScreenAdapter.w(85),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(6)),
                         color:  GouyiColors.string2Color('#f9d07c'),
                       ),
                       padding: EdgeInsets.all(GouyiScreenAdapter.w(4)),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text("打折促销",style: TextStyle(
                             color: Colors.white,
                             fontSize: GouyiScreenAdapter.fs(12),
                           ),),
                           SizedBox(height:GouyiScreenAdapter.h(2) ,),
                           CachedNetworkImage(
                             height: GouyiScreenAdapter.h(70),
                             imageUrl: 'https://ik.imagekit.io/guoguodad/mall/common/goods4.jpeg?updatedAt=1691718085548',
                             fit: BoxFit.cover,
                           ),
                         ],
                       ),
                     ),
                   ],
                 )
               ],
             ),
             SizedBox(
               width: GouyiScreenAdapter.w(7),
             ),
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 SizedBox(
                   height: GouyiScreenAdapter.h(20),
                   child:  Text("有好货",style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: GouyiScreenAdapter.fs(13),
                       color: GouyiColors.string2Color('#333333')
                   ),),
                 ),
                 Text("发现世间好物",style: TextStyle(
                   color: Colors.black,
                   fontSize: GouyiScreenAdapter.fs(12),
                 ),),
                 Row(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Container(
                       width: GouyiScreenAdapter.w(85),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(6)),
                         color:  GouyiColors.string2Color('#ffffff'),
                       ),
                       padding: EdgeInsets.all(GouyiScreenAdapter.w(4)),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           CachedNetworkImage(
                             height: GouyiScreenAdapter.h(70),
                             imageUrl: 'https://ik.imagekit.io/guoguodad/mall/common/goods4.jpeg?updatedAt=1691718085548',
                             fit: BoxFit.cover,
                           ),
                         ],
                       ),
                     ),
                     SizedBox(width: GouyiScreenAdapter.w(4),),
                     Container(
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(GouyiScreenAdapter.w(6)),
                         color:  GouyiColors.string2Color('#ffffff'),
                       ),
                       width: GouyiScreenAdapter.w(85),
                       padding: EdgeInsets.all(GouyiScreenAdapter.w(4)),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           CachedNetworkImage(
                             height: GouyiScreenAdapter.h(70),
                             imageUrl: 'https://ik.imagekit.io/guoguodad/mall/common/goods4.jpeg?updatedAt=1691718085548',
                             fit: BoxFit.cover,
                           ),
                         ],
                       ),
                     ),
                   ],
                 )
               ],
             )
           ],
         ),
       ],
     )
   );
  
}