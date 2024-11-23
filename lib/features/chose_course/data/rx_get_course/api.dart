import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:poswell_app/features/chose_course/model/course_type_model.dart';
import '../../../../networks/dio/dio.dart';
import '../../../../networks/endpoints.dart';
import '../../../../networks/exception_handler/data_source.dart';

final class GetCourseTypeApi {
  static final GetCourseTypeApi _singleton = GetCourseTypeApi._internal();
  GetCourseTypeApi._internal();

  static GetCourseTypeApi get instance => _singleton;

  Future<GetCourseType> getCourseType() async {
    try {
      Response response = await getHttp(Endpoints.courseType());

      if (response.statusCode == 200) {
        final data =
            GetCourseType.fromRawJson(json.encode(response.data));
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
