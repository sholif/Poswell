import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:poswell_app/features/course_details/model/daily_read_article_response_model.dart';
import '../../../../../networks/dio/dio.dart';
import '../../../../networks/exception_handler/data_source.dart';
import '/networks/endpoints.dart';

final class GetDailyReadArticleApi {
  static final GetDailyReadArticleApi _singleton = GetDailyReadArticleApi._internal();
  GetDailyReadArticleApi._internal();
  static GetDailyReadArticleApi get instance => _singleton;

  Future<DailyReadArticleResponseModel> getDailyReadArticles({required String id }) async {
    try {
      Response response = await getHttp(Endpoints.getDailyReadArticle(id));

      if (response.statusCode == 200) {
        final data =
            DailyReadArticleResponseModel.fromRawJson(json.encode(response.data));
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
