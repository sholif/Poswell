// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:poswell_app/features/authentication/data/rx_forgot_password/api.dart';
import 'package:poswell_app/helpers/toast.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../networks/rx_base.dart';

final class ForgotPasswordRX extends RxResponseInt<Map> {
  final api = ForgotPasswordApi.instance;

  ForgotPasswordRX({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<bool> forgotPassword(
    {
    required String email,
    }
  ) async {
    try {

      Map data = await api.forgotPassowrd(
        email: email,
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
