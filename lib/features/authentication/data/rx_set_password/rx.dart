// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:poswell_app/features/authentication/data/rx_set_password/api.dart';
import 'package:poswell_app/helpers/toast.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../networks/rx_base.dart';

final class SetPasswordRX extends RxResponseInt<Map> {
  final api = SetPasswordApi.instance;

  SetPasswordRX({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<bool> setPassword(
    {
    required String email,
    required String otp,
    required String password,
    required String confirmPassword,
    }
  ) async {
    try {

      Map data = await api.setPassowrd(
        email: email,
        otp: otp,
        password: password ,
        confirmPassword: confirmPassword
      );
      handleSuccessWithReturn(data);
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
