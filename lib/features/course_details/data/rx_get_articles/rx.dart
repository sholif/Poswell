// ignore_for_file: use_build_context_synchronously
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:poswell_app/features/course_details/data/rx_get_articles/api.dart';
import 'package:poswell_app/features/course_details/model/course_article_response_model.dart';
import 'package:poswell_app/helpers/toast.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../networks/rx_base.dart';

final class GetCourseArticleRX extends RxResponseInt<CoursesArticleResponseModel> {
  final api = GetCourseArticleApi.instance;

  GetCourseArticleRX({required super.empty, required super.dataFetcher});

  ValueStream get courseArticleStream => dataFetcher.stream;

  Future<void> getCourseModules({ required String id}) async {
    try {
      CoursesArticleResponseModel data = await api.getCourseModules(id: id);
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
