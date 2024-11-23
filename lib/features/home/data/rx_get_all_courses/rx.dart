// ignore_for_file: use_build_context_synchronously
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:poswell_app/features/home/data/rx_get_all_courses/api.dart';
import 'package:poswell_app/features/home/model/all_couses_response_model.dart';
import 'package:poswell_app/helpers/all_routes.dart';
import 'package:poswell_app/helpers/navigation_service.dart';
import 'package:poswell_app/helpers/toast.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../networks/rx_base.dart';

final class GetAllCoursesRX extends RxResponseInt<AllCoursesResponseModel> {
  final api = GetAllCoursesApi.instance;

  GetAllCoursesRX({required super.empty, required super.dataFetcher});

  ValueStream get allCoursesStream => dataFetcher.stream;

  Future<void> getAllCourses() async {
    try {
      AllCoursesResponseModel data = await api.getAllCouses();
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
      }
      else if(error.response!.statusCode == 401 ){
        NavigationService.popAndReplace(Routes.authScreen);
      }
      
      else{
         ToastUtil.showShortToast(error.response!.data["error"]);
      }
    }
    log(error.toString());
    dataFetcher.sink.addError(error);
    // throw error;
    return false;
  }




}
