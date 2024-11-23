import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:poswell_app/features/question/model/survey_mark_model.dart';
import '../../../../networks/dio/dio.dart';
import '../../../../networks/endpoints.dart';
import '../../../../networks/exception_handler/data_source.dart';

final class GetServeyMarkApi {
  static final GetServeyMarkApi _singleton = GetServeyMarkApi._internal();
  GetServeyMarkApi._internal();

  static GetServeyMarkApi get instance => _singleton;

  Future<SurveyMarkModel> getSurveyMark(int id) async {
    try {
      Response response = await getHttp(Endpoints.surveyMark(id));

      if (response.statusCode == 200) {
        final data =
            SurveyMarkModel.fromRawJson(json.encode(response.data));
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
