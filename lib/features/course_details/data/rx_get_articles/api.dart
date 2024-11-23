import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:poswell_app/features/course_details/model/course_article_response_model.dart';
import '../../../../../networks/dio/dio.dart';
import '../../../../networks/exception_handler/data_source.dart';
import '/networks/endpoints.dart';

final class GetCourseArticleApi {
  static final GetCourseArticleApi _singleton = GetCourseArticleApi._internal();
  GetCourseArticleApi._internal();
  static GetCourseArticleApi get instance => _singleton;

  Future<CoursesArticleResponseModel> getCourseModules({required String id }) async {
    try {
      Response response = await getHttp(Endpoints.getCourseArticle(id));

      if (response.statusCode == 200) {
        final data =
            CoursesArticleResponseModel.fromRawJson(json.encode(response.data));
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      // Handle generic errors
      rethrow;
    }
  }
}
