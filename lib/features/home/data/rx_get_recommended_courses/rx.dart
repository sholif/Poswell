// ignore_for_file: use_build_context_synchronously
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:poswell_app/features/home/data/rx_get_recommended_courses/api.dart';
import 'package:poswell_app/features/home/model/recommended_courses_response_model.dart';
import 'package:poswell_app/helpers/toast.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../networks/rx_base.dart';

final class GetRecommendedCoursesRX extends RxResponseInt<RecommendedResponseModel> {
  final api = GetRecommendedCoursesApi.instance;

  GetRecommendedCoursesRX({required super.empty, required super.dataFetcher});

  ValueStream get recommendedCoursesStream => dataFetcher.stream;

  Future<void> getRecommendedCourses() async {
    try {
      RecommendedResponseModel data = await api.getRecommendedCouses();
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
