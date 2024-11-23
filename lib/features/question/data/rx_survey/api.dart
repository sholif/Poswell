import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:poswell_app/features/question/model/survey_model.dart';
import '../../../../networks/dio/dio.dart';
import '../../../../networks/endpoints.dart';
import '../../../../networks/exception_handler/data_source.dart';

final class GetServeyApi {
  static final GetServeyApi _singleton = GetServeyApi._internal();
  GetServeyApi._internal();

  static GetServeyApi get instance => _singleton;

  Future<SurveyModel> getSurvey(int id) async {
    try {
      Response response = await getHttp(Endpoints.survey(id));

      if (response.statusCode == 200) {
        final data =
            SurveyModel.fromRawJson(json.encode(response.data));
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
