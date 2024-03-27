import 'package:http/http.dart';

abstract interface class BaseApi {
  Future<Response> getArticles ({
    required int limit,
    required int offset
  });

  Future<Response> getArticleInfo ({
    required int id
  });
}