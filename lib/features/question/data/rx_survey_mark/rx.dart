import 'package:poswell_app/features/question/data/rx_survey_mark/api.dart';
import 'package:poswell_app/features/question/model/survey_mark_model.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../networks/rx_base.dart';

final class GetSurveyMarkRx extends RxResponseInt<SurveyMarkModel> {
  final api = GetServeyMarkApi.instance;

  GetSurveyMarkRx({required super.empty, required super.dataFetcher});

  ValueStream get getsurveyMark => dataFetcher.stream;

  Future<SurveyMarkModel> getSurveyMark(int id) async {
    try {
      final data = await api.getSurveyMark(id);

      return handleSuccessWithReturn(data);
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }
}
