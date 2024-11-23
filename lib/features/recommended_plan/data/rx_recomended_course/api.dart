import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:poswell_app/features/recommended_plan/model/recomended_course.dart';
import '../../../../networks/dio/dio.dart';
import '../../../../networks/endpoints.dart';
import '../../../../networks/exception_handler/data_source.dart';

final class GetRecomendedCourseApi {
  static final GetRecomendedCourseApi _singleton = GetRecomendedCourseApi._internal();
  GetRecomendedCourseApi._internal();

  static GetRecomendedCourseApi get instance => _singleton;

  Future<Recomendedcourse> getCourse() async {
    try {
      Response response = await getHttp(Endpoints.recomendedCourse());

      if (response.statusCode == 200) {
        final data =
            Recomendedcourse.fromRawJson(json.encode(response.data));
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
