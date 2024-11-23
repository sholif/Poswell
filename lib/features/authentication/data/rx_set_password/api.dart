import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:poswell_app/helpers/toast.dart';
import '../../../../../networks/dio/dio.dart';
import '../../../../networks/exception_handler/data_source.dart';
import '/networks/endpoints.dart';

final class SetPasswordApi {
  static final SetPasswordApi _singleton = SetPasswordApi._internal();
  SetPasswordApi._internal();
  static SetPasswordApi get instance => _singleton;

  Future<Map> setPassowrd({
    required String email,
    required String otp,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      Map data = {
        "email": email,
        'otp': otp,
        "new_password": password,
        "new_password_confirmation": confirmPassword,
      };

      Response response = await postHttp(Endpoints.setPassword(), data);

      if (response.statusCode == 200) {
        final data =
            json.decode(json.encode(response.data));
            ToastUtil.showShortToast("Password updated, Please login to continue");
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
