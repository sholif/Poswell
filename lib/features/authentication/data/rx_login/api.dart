import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:poswell_app/features/authentication/model/login_response_model.dart';
import 'package:poswell_app/helpers/toast.dart';
import '../../../../../networks/dio/dio.dart';
import '../../../../networks/exception_handler/data_source.dart';
import '/networks/endpoints.dart';

final class LogInApi {
  static final LogInApi _singleton = LogInApi._internal();
  LogInApi._internal();
  static LogInApi get instance => _singleton;

  Future<LoginResponseModel> logIn({
    required String email,
    required String password,
  }) async {
    try {
      Map data = {
        "email": email,
        "password": password,
      };

      Response response = await postHttp(Endpoints.logIn(), data);

      if (response.statusCode == 200) {
        final data =
            LoginResponseModel.fromRawJson(json.encode(response.data));
        ToastUtil.showShortToast("User logged in successfully.");
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
