import 'package:dio/dio.dart';
import 'package:mortalheart_gouyi/models/banner_model.dart';
import 'package:mortalheart_gouyi/utils/http/api_response.dart';
import 'package:mortalheart_gouyi/utils/http/app_exceptions.dart';
import 'package:mortalheart_gouyi/utils/http/http.dart';

class HomeApi {
  static const String _article = 'api/focus/';

  static Future<ApiResponse<SomeRootEntity>> getBannerPath() async {
    try {
      final response =
      await Https.instance.get(_article);
      var data = SomeRootEntity.fromJson(response);
      return ApiResponse.completed(data);
    } on DioException catch (e) {
      return ApiResponse.error(e.error as AppException?);
    }
  }
}