import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:poswell_app/helpers/toast.dart';
import '../../../../../networks/dio/dio.dart';
import '../../../../networks/exception_handler/data_source.dart';
import '/networks/endpoints.dart';

final class RegistrationVerifyOtpApi {
  static final RegistrationVerifyOtpApi _singleton = RegistrationVerifyOtpApi._internal();
  RegistrationVerifyOtpApi._internal();
  static RegistrationVerifyOtpApi get instance => _singleton;

  Future<Map> verifyOtp({
    required String email,
    required String otp,
  }) async {
    try {
      Map data = {
        "email": email,
        "otp": otp,
      };

      Response response = await postHttp(Endpoints.registrationOtpVerify(), data);

      if (response.statusCode == 200) {
        final data =
            json.decode(json.encode(response.data));
            ToastUtil.showShortToast("OTP verification Sucessfull");
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
