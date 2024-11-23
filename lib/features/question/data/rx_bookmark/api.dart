import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:poswell_app/networks/exception_handler/data_source.dart';
import '/networks/endpoints.dart';
import '../../../../../networks/dio/dio.dart';

final class PostServeyApi {
  static final PostServeyApi _singleton = PostServeyApi._internal();
  PostServeyApi._internal();
  static PostServeyApi get instance => _singleton;
  Future<Map> postSurvey({
    required int id,
    required List<dynamic> survey,

    
  }) async {
    try {
      Map data = {
        "answers": survey,
     
      };

      Response response = await postHttp(Endpoints.postsurvey(id), data);
      if (response.statusCode == 200) {
        Map data = json.decode(json.encode(response.data));
        return data;
      } else {
        Map data = json.decode(json.encode(response.data));
        return data;
        // throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      // SignUpResponse _signUpRes = SignUpResponse.fromJson(error);
      throw ErrorHandler.handle(error).failure;
    }
  }
}
