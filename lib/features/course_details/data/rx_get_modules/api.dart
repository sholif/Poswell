import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:poswell_app/features/course_details/model/course_module_response_model.dart';
import '../../../../../networks/dio/dio.dart';
import '../../../../networks/exception_handler/data_source.dart';
import '/networks/endpoints.dart';

final class GetCourseModulesApi {
  static final GetCourseModulesApi _singleton = GetCourseModulesApi._internal();
  GetCourseModulesApi._internal();
  static GetCourseModulesApi get instance => _singleton;

  Future<CoursesModuleResponseModel> getCourseModules({required String id }) async {
    try {
      Response response = await getHttp(Endpoints.getCourseModules(id));

      if (response.statusCode == 200) {
        final data =
            CoursesModuleResponseModel.fromRawJson(json.encode(response.data));
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
