import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:poswell_app/features/profile/model/profile_response_model.dart';
import '../../../../../networks/dio/dio.dart';
import '../../../../networks/exception_handler/data_source.dart';
import '/networks/endpoints.dart';

final class GetProfileApi {
  static final GetProfileApi _singleton = GetProfileApi._internal();
  GetProfileApi._internal();
  static GetProfileApi get instance => _singleton;

  Future<ProfileResponseModel> getProfile() async {
    try {
      Response response = await getHttp(Endpoints.getProfile());

      if (response.statusCode == 200) {
        final data =
            ProfileResponseModel.fromRawJson(json.encode(response.data));
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
