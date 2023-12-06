// ignore_for_file: overridden_fields

import 'package:flutter/cupertino.dart';
import 'package:get/route_manager.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';

/// 路由验证中间件
/// 未登录则跳转到登录页
class RouteAuthMiddleware extends GetMiddleware {
  @override
  int? priority = 0; // priority 数字小优先级高

  RouteAuthMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    return null;
  }
}
