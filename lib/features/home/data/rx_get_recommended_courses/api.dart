import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:poswell_app/features/home/model/recommended_courses_response_model.dart';
import '../../../../../networks/dio/dio.dart';
import '../../../../networks/exception_handler/data_source.dart';
import '/networks/endpoints.dart';

final class GetRecommendedCoursesApi {
  static final GetRecommendedCoursesApi _singleton = GetRecommendedCoursesApi._internal();
  GetRecommendedCoursesApi._internal();
  static GetRecommendedCoursesApi get instance => _singleton;

  Future<RecommendedResponseModel> getRecommendedCouses() async {
    try {
      Response response = await getHttp(Endpoints.getRecommendedCourses());

      if (response.statusCode == 200) {
        final data =
            RecommendedResponseModel.fromRawJson(json.encode(response.data));
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
