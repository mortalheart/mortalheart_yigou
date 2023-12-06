import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mortalheart_gouyi/utils/app_colors.dart';
import 'package:mortalheart_gouyi/utils/app_fontIcons.dart';
import 'package:mortalheart_gouyi/utils/app_screenAdapter.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

///空数据时显示
Widget commonEmptyView(String title) {
  return SizedBox(
    width: double.infinity,
    height: GouyiScreenAdapter.h(250),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Image.asset(
        //   "assets/images/emptyOrder.png",
        //   width: GouyiScreenAdapter.w(100),
        //   height: GouyiScreenAdapter.w(100),
        //   // color: Colors.cyan,
        //   fit: BoxFit.fill,
        // ),
        SizedBox(height: GouyiScreenAdapter.h(10)),
        Text(
          title,
          style: TextStyle(
              fontSize: GouyiScreenAdapter.fs(14), color: GouyiColors.gray154),
        ),
      ],
    ),
  );
}


///登录注册前同意协议
Widget commonRoundCheckBox(bool isChecked,
    {required dynamic Function(bool?)? onTap}) {
  return Container(
    padding: EdgeInsets.all(GouyiScreenAdapter.w(10)),
    child: RoundCheckBox(
      onTap: onTap,
      checkedColor: GouyiColors.theme,
      checkedWidget:
      Icon(Icons.check, color: Colors.white, size: GouyiScreenAdapter.fs(12)),
      uncheckedColor: Colors.white,
      disabledColor: Colors.grey[300],
      animationDuration: const Duration(milliseconds: 50),
      isRound: true,
      isChecked: isChecked,
      size: 20,
      border: Border.all(
        width: 1,
        color: isChecked ? GouyiColors.theme : GouyiColors.gray154, //根据选择状态来改
      ),
    ),
  );
}


///通用标题头组件
Widget commonHeader({required String title, Widget? trailing, Function()? onTap}) {
  return SizedBox(
    height: GouyiScreenAdapter.h(40),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
        ),
        InkWell(
          onTap: onTap,
          child: Container(
            child: trailing,
          ),
        ),
      ],
    ),
  );
}

///登录注册前同意协议--RichText结合Expanded实现，最佳方式
Widget commonProtocolView(bool isChecked,
    {required dynamic Function(bool?)? onTap, bool isOneClick = false}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: GouyiScreenAdapter.w(25),
        height: GouyiScreenAdapter.w(25),
        alignment: Alignment.topCenter, //上面相当于加大了热区
        child: RoundCheckBox(
          onTap: onTap,
          checkedColor: GouyiColors.theme,
          checkedWidget: Icon(Icons.check,
              color: Colors.white, size: GouyiScreenAdapter.fs(12)),
          // uncheckedWidget: Icon(Icons.close, size: DoScreenAdapter.fs(12)),
          uncheckedColor: Colors.white,
          disabledColor: Colors.grey[300],
          animationDuration: const Duration(milliseconds: 50),
          isRound: true,
          isChecked: isChecked,
          size: 15,
          border: Border.all(
            width: 1,
            color: isChecked ? GouyiColors.theme : GouyiColors.gray154, //根据选择状态来改
          ),
        ),
      ),
      SizedBox(width: GouyiScreenAdapter.w(5)),
      Expanded(
        child: RichText(
          softWrap: true,
          text: TextSpan(
              text: "已阅读并同意",
              style: const TextStyle(color: GouyiColors.gray154, fontSize: 12),
              children: [
                TextSpan(
                  text: "《轻松购商城用户协议》",
                  style: TextStyle(
                    // letterSpacing: 6,//字符间距
                      height: 1.2, //和css一样1.2就是字体大小的1.2倍
                      // decoration: TextDecoration.underline,
                      /*
                      有5个值
                        underline:下划线
                        none:无划线
                        overline:上划线
                        lineThrough:中划线
                        combine:这个就厉害了，可以传入一个List,三线齐划
                      */
                      color: GouyiColors.theme,
                      fontSize: GouyiScreenAdapter.fs(12)),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      EasyLoading.showToast("《轻松购商城用户协议》");
                    },
                ),
                TextSpan(
                  text: "《轻松购商城隐私政策》",
                  style: TextStyle(
                      height: 1.2,
                      color: GouyiColors.theme,
                      fontSize: GouyiScreenAdapter.fs(12)),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      EasyLoading.showToast("《小米商城隐私政策》");
                    },
                ),
                TextSpan(
                  text: "《轻松购账号用户协议》",
                  style: TextStyle(
                      height: 1.2,
                      color: GouyiColors.theme,
                      fontSize: GouyiScreenAdapter.fs(12)),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      EasyLoading.showToast("《小米账号用户协议》");
                    },
                ),
                TextSpan(
                  text: "《轻松购账号隐私政策》",
                  style: TextStyle(
                      height: 1.2,
                      color: GouyiColors.theme,
                      fontSize: GouyiScreenAdapter.fs(12)),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      EasyLoading.showToast("《小米账号隐私政策》");
                    },
                ),
                isOneClick
                    ? TextSpan(
                  text: "《中国联通认证服务条款》",
                  style: TextStyle(
                      height: 1.2,
                      color: GouyiColors.theme,
                      fontSize: GouyiScreenAdapter.fs(12)),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      EasyLoading.showToast("《中国联通认证服务条款》");
                    },
                )
                    : const TextSpan(text: ""),
              ]),
        ),
      ),
    ],
  );
}

///底部固定区域-第三方登录
Widget commonThirdLoginView() {
  return Positioned(
    left: GouyiScreenAdapter.h(60),
    right: GouyiScreenAdapter.h(60),
    bottom: GouyiScreenAdapter.h(80),
    // bottom: 0,
    child: Column(
      children: [
        Text("- 其他方式登录 -",
            style: TextStyle(
                fontSize: GouyiScreenAdapter.fs(12), color: GouyiColors.gray154)),
        SizedBox(height: GouyiScreenAdapter.h(10)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _thirdCircleButton(Icons.wechat,
                foregroundColor: Colors.green,
                backgroundColor: const Color.fromARGB(255, 206, 247, 221),
                onTap: () {}),
            // InkWell(
            //     onTap: () {},
            //     child: CircleAvatar(
            //         backgroundColor: const Color.fromARGB(255, 206, 247, 221),
            //         radius: GouyiScreenAdapter.w(15),
            //         child: const Icon(Icons.wechat,
            //             color: Colors.green, size: 18))),
            _thirdCircleButton(Icons.facebook,
                foregroundColor: Colors.blue,
                backgroundColor: const Color.fromARGB(255, 149, 199, 240),
                onTap: () {}),
            // InkWell(
            //     onTap: () {},
            //     child: CircleAvatar(
            //         backgroundColor: const Color.fromARGB(255, 149, 199, 240),
            //         radius: GouyiScreenAdapter.w(15),
            //         child: const Icon(Icons.facebook,
            //             color: Colors.blue, size: 18))),
            _thirdCircleButton(Icons.mail,
                foregroundColor: Colors.red,
                backgroundColor: const Color.fromARGB(255, 244, 150, 143),
                onTap: () {}),
            // InkWell(
            //     onTap: () {},
            //     child: CircleAvatar(
            //         backgroundColor: const Color.fromARGB(255, 244, 150, 143),
            //         radius: GouyiScreenAdapter.w(15),
            //         child:
            //             const Icon(Icons.mail, color: Colors.red, size: 18))),
            // InkWell(
            //     onTap: () {},
            //     child: CircleAvatar(
            //         backgroundColor: Colors.black,
            //         radius: GouyiScreenAdapter.w(15),
            //         child: const Icon(Icons.apple,
            //             color: Colors.white, size: 18))),
            _thirdCircleButton(Icons.apple,
                foregroundColor: Colors.white,
                backgroundColor: Colors.black,
                onTap: () {}),
          ],
        )
      ],
    ),
  );
}


///第三方登录按钮抽取
Widget _thirdCircleButton(IconData? icon,
    {Color? foregroundColor, Color? backgroundColor, void Function()? onTap}) {
  return InkWell(
    onTap: onTap,
    child: CircleAvatar(
        backgroundColor: backgroundColor,
        radius: GouyiScreenAdapter.w(15),
        child: Icon(icon, color: foregroundColor, size: 18)),
  );
}

Widget commonLogoView() {
  return Container(
      margin: EdgeInsets.only(bottom: GouyiScreenAdapter.h(20)),
      alignment: Alignment.center,
      child: Image.asset(
       GouyiFontIcon.icAvatarDefault,
        width: GouyiScreenAdapter.w(50),
        height: GouyiScreenAdapter.w(50),
      ));
}


///通用ListTile
Widget commonListTile(String data, {void Function()? onTap}) {
  return Container(
    color: Colors.white,
    // height: DoScreenAdapter.h(40), //用于改变ListTile的高
    // alignment: Alignment.centerLeft,
    child: ListTile(
      contentPadding:
      EdgeInsets.symmetric(horizontal: GouyiScreenAdapter.w(10), vertical: 0),
      title: Text(data, style: TextStyle(fontSize: GouyiScreenAdapter.fs(14))),
      trailing: Icon(Icons.arrow_forward_ios_outlined,
          size: GouyiScreenAdapter.fs(12), color: GouyiColors.black128),
      onTap: onTap,
    ),
  );
}