import 'package:poswell_app/features/recommended_plan/data/rx_recomended_course/api.dart';
import 'package:poswell_app/features/recommended_plan/model/recomended_course.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../networks/rx_base.dart';

final class GetRecomendedCourseRx extends RxResponseInt<Recomendedcourse> {
  final api = GetRecomendedCourseApi.instance;

  GetRecomendedCourseRx({required super.empty, required super.dataFetcher});

  ValueStream get getcouser => dataFetcher.stream;

  Future<Recomendedcourse> getCourse() async {
    try {
      final data = await api.getCourse();

      return handleSuccessWithReturn(data);
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }
}
