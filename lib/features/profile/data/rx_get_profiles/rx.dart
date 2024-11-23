// ignore_for_file: use_build_context_synchronously
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:poswell_app/features/profile/data/rx_get_profiles/api.dart';
import 'package:poswell_app/features/profile/model/profile_response_model.dart';
import 'package:poswell_app/helpers/toast.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../networks/rx_base.dart';

final class GetProfileRX extends RxResponseInt<ProfileResponseModel> {
  final api = GetProfileApi.instance;

  GetProfileRX({required super.empty, required super.dataFetcher});

  ValueStream get profileStream => dataFetcher.stream;

  Future<void> getProfile() async {
    try {
      ProfileResponseModel data = await api.getProfile();
      handleSuccessWithReturn(data);
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
         ToastUtil.showShortToast(error.response!.data["error"]);
      }
    }
    log(error.toString());
    dataFetcher.sink.addError(error);
    // throw error;
    return false;
  }




}
