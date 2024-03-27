import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../../base_api/base_api.dart';

class ApiV3 implements BaseApi {
  final String _scheme = "https";
  final String _host = "api.spaceflightnewsapi.net";
  final String _path = "/v3/articles";

  @override
  Future<Response> getArticleInfo({required int id}) {
    // TODO: implement getArticleInfo
    throw UnimplementedError();
  }

  @override
  Future<Response> getArticles({required int limit, required int offset}) async {
    var url = Uri(
        scheme: _scheme,
        host: _host,
        path: _path,
        queryParameters: {"_limit": "$limit", "_start": "$offset"}
    );
    var response = await http.get(url, headers: {"Content-Type": "application/json"});
    return response;
  }
}