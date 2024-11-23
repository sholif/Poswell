// ignore_for_file: use_build_context_synchronously
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:poswell_app/features/course_details/data/rx_get_daily_read_articles/api.dart';
import 'package:poswell_app/features/course_details/model/daily_read_article_response_model.dart';
import 'package:poswell_app/helpers/toast.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../networks/rx_base.dart';

final class GetDailyReadArticleRX extends RxResponseInt<DailyReadArticleResponseModel> {
  final api = GetDailyReadArticleApi.instance;

  GetDailyReadArticleRX({required super.empty, required super.dataFetcher});

  ValueStream get dailyReadArticlesStream => dataFetcher.stream;

  Future<void> getDaillyReadArticles({ required String id}) async {
    try {
      DailyReadArticleResponseModel data = await api.getDailyReadArticles(id: id);
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
