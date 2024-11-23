import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:poswell_app/features/artical_details/model/single_article_model.dart';
import '../../../../networks/dio/dio.dart';
import '../../../../networks/endpoints.dart';
import '../../../../networks/exception_handler/data_source.dart';

final class GetSingleArticleApi {
  static final GetSingleArticleApi _singleton = GetSingleArticleApi._internal();
  GetSingleArticleApi._internal();

  static GetSingleArticleApi get instance => _singleton;

  Future<SingleArticleModel> getSingleArticle(int id) async {
    try {
      Response response = await getHttp(Endpoints.getSingleArticle(id));

      if (response.statusCode == 200) {
        final data =
            SingleArticleModel.fromRawJson(json.encode(response.data));
        return data;
      } else {
        // Handle non-200 status code errors
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      // Handle generic errors
      throw ErrorHandler.handle(error).failure.responseMessage;
    }
  }
}
