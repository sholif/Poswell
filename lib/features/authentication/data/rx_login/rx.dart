// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:poswell_app/constants/app_constants.dart';
import 'package:poswell_app/features/authentication/data/rx_login/api.dart';
import 'package:poswell_app/features/authentication/model/login_response_model.dart';
import 'package:poswell_app/helpers/di.dart';
import 'package:poswell_app/helpers/toast.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../networks/dio/dio.dart';
import '../../../../networks/rx_base.dart';

final class GetLoginResponseRX extends RxResponseInt<LoginResponseModel> {
  final api = LogInApi.instance;

  GetLoginResponseRX({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<bool> logIn(
    {
    required String email,
    required String password,
    }
  ) async {
    try {

      LoginResponseModel data = await api.logIn(
        email: email,
        password: password,
      );
      handleSuccessWithReturn(data);
      return true;
    } catch (error) {
      return handleErrorWithReturn(error);
      
    }
  }

  @override
  handleSuccessWithReturn(LoginResponseModel data) {
    var token = data.token!;
    log(token);
    appData.write(kKeyAccessToken, token);
    appData.write(kKeyIsLoggedIn, true);
    DioSingleton.instance.update(token);

    
    dataFetcher.sink.add(data);
    return data;
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
