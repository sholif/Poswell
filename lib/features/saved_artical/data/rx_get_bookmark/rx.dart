import 'package:poswell_app/features/saved_artical/data/rx_get_bookmark/api.dart';
import 'package:poswell_app/features/saved_artical/model/bookmark_model.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../networks/rx_base.dart';

final class GetBookMarkResponseRx extends RxResponseInt<BookmarkModel> {
  final api = GetBookmarkApi.instance;

  GetBookMarkResponseRx({required super.empty, required super.dataFetcher});

  ValueStream get getCategoryData => dataFetcher.stream;

  Future<BookmarkModel> getBookmark() async {
    try {
      final data = await api.getBookmark();

      return handleSuccessWithReturn(data);
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }
}
