import 'package:poswell_app/features/question/data/rx_bookmark/api.dart';
import 'package:poswell_app/helpers/toast.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../networks/rx_base.dart';

final class PostSurveyResponseRX extends RxResponseInt {
  final api = PostServeyApi.instance;

  PostSurveyResponseRX({required super.empty, required super.dataFetcher});

  ValueStream get postsurvey => dataFetcher.stream;
  Future<void> postSurvey({
      required int id,
      required List<dynamic> survey

  }) async {
    try {
      Map data = await api.postSurvey(id: id, survey: survey);
      ToastUtil.showShortToast(data["message"]);
      return handleSuccessWithReturn(data);
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }
  

}
