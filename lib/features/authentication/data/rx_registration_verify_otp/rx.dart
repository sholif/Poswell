// ignore_for_file: use_build_context_synchronously
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:poswell_app/features/authentication/data/rx_registration_verify_otp/api.dart';
import 'package:poswell_app/helpers/toast.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../constants/app_constants.dart';
import '../../../../helpers/di.dart';
import '../../../../networks/rx_base.dart';

final class RegistrationOtpVerifyRX extends RxResponseInt<Map> {
  final api = RegistrationVerifyOtpApi.instance;

  RegistrationOtpVerifyRX({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<bool> verifyOtp(
    {
    required String email,
    required String otp,
    }
  ) async {
    try {

      Map data = await api.verifyOtp(
        email: email,
        otp: otp
      );
      handleSuccessWithReturn(data);
      appData.write(kKeyIsLoggedIn, true);
      return true;
    } catch (error) {
      return handleErrorWithReturn(error);
      
    }
  }

  @override
  handleErrorWithReturn(dynamic error) {
    if(error is DioException){
      if(error.response!.statusCode == 400 ){
        ToastUtil.showShortToast(error.response!.data["error"]);
      }else{
         ToastUtil.showShortToast(error.response!.data["message"]);
      }
    }
    log(error.toString());
    dataFetcher.sink.addError(error);
    // throw error;
    return false;
  }




}
