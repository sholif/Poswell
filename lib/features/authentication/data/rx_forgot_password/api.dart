import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:poswell_app/helpers/toast.dart';
import '../../../../../networks/dio/dio.dart';
import '../../../../networks/exception_handler/data_source.dart';
import '/networks/endpoints.dart';

final class ForgotPasswordApi {
  static final ForgotPasswordApi _singleton = ForgotPasswordApi._internal();
  ForgotPasswordApi._internal();
  static ForgotPasswordApi get instance => _singleton;

  Future<Map> forgotPassowrd({
    required String email,
  }) async {
    try {
      Map data = {
        "email": email,
      };

      Response response = await postHttp(Endpoints.forgotPassword(), data);

      if (response.statusCode == 200) {
        final data =
            json.decode(json.encode(response.data));
            ToastUtil.showShortToast("Please check you email inbox for OTP code");
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
