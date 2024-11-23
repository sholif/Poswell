import 'package:poswell_app/features/question/data/rx_survey/api.dart';
import 'package:poswell_app/features/question/model/survey_model.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../networks/rx_base.dart';

final class GetSurveyRx extends RxResponseInt<SurveyModel> {
  final api = GetServeyApi.instance;

  GetSurveyRx({required super.empty, required super.dataFetcher});

  ValueStream get getsurvey => dataFetcher.stream;

  Future<SurveyModel> getSurvey(int id) async {
    try {
      final data = await api.getSurvey(id);

      return handleSuccessWithReturn(data);
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }
}
