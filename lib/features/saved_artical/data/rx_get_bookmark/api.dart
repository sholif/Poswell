import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:poswell_app/features/saved_artical/model/bookmark_model.dart';
import '../../../../networks/dio/dio.dart';
import '../../../../networks/endpoints.dart';
import '../../../../networks/exception_handler/data_source.dart';

final class GetBookmarkApi {
  static final GetBookmarkApi _singleton = GetBookmarkApi._internal();
  GetBookmarkApi._internal();

  static GetBookmarkApi get instance => _singleton;

  Future<BookmarkModel> getBookmark() async {
    try {
      Response response = await getHttp(Endpoints.getBookmark());

      if (response.statusCode == 200) {
        final data =
            BookmarkModel.fromRawJson(json.encode(response.data));
        return data;
      } else {
        // Handle non-200 status code errors
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      // Handle generic errors
      throw ErrorHandler.handle(error).failure.responseMessage;
    }
  }
}
