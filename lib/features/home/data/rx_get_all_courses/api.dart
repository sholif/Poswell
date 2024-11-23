import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:poswell_app/features/home/model/all_couses_response_model.dart';
import '../../../../../networks/dio/dio.dart';
import '../../../../networks/exception_handler/data_source.dart';
import '/networks/endpoints.dart';

final class GetAllCoursesApi {
  static final GetAllCoursesApi _singleton = GetAllCoursesApi._internal();
  GetAllCoursesApi._internal();
  static GetAllCoursesApi get instance => _singleton;

  Future<AllCoursesResponseModel> getAllCouses() async {
    try {
      Response response = await getHttp(Endpoints.getAllCourses());

      if (response.statusCode == 200) {
        final data =
            AllCoursesResponseModel.fromRawJson(json.encode(response.data));
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
