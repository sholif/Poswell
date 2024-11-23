import 'package:poswell_app/features/chose_course/data/rx_get_course/api.dart';
import 'package:poswell_app/features/chose_course/model/course_type_model.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../networks/rx_base.dart';

final class GetCourseTypeRx extends RxResponseInt<GetCourseType> {
  final api = GetCourseTypeApi.instance;

  GetCourseTypeRx({required super.empty, required super.dataFetcher});

  ValueStream get getCourse => dataFetcher.stream;

  Future<GetCourseType> getCourseType() async {
    try {
      final data = await api.getCourseType();

      return handleSuccessWithReturn(data);
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }
}
