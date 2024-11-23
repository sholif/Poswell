import 'package:poswell_app/features/artical_details/data/rx_single_article/api.dart';
import 'package:poswell_app/features/artical_details/model/single_article_model.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../networks/rx_base.dart';

final class GetSingleArticleRx extends RxResponseInt<SingleArticleModel> {
  final api = GetSingleArticleApi.instance;

  GetSingleArticleRx({required super.empty, required super.dataFetcher});

  ValueStream get getArticle => dataFetcher.stream;

  Future<SingleArticleModel> getSingleArticle(int id) async {
    try {
      final data = await api.getSingleArticle(id);

      return handleSuccessWithReturn(data);
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }
}
