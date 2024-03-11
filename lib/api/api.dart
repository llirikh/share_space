import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

export 'models/article.dart';
import 'models/article.dart';

class News {
  List<Article> articles = [];
  int statusCode = 200;

  static const int _limit = 20;
  int _start = 0;

  String _modifyArticleContent(String articleContent) {
    String resultArticleContent = articleContent;

    var random = Random();
    const int startLimit = 15;
    const int additionLimit = 20;

    int limit = startLimit + random.nextInt(additionLimit);
    for (int i = 0; i < limit; ++i) {
      resultArticleContent += random.nextInt(100) % 4 == 0
          ? '\n\n' : resultArticleContent[resultArticleContent.length - 1] == '.'
          ? ' ' : '. ';
      resultArticleContent += articleContent;
    }

    return resultArticleContent;
  }

  String _modifyArticleNewsSite(String articleNewsSite) {
    String resultArticleNewSite = articleNewsSite;

    int pos = resultArticleNewSite.indexOf('.');
    resultArticleNewSite = (pos != -1)
        ? resultArticleNewSite.substring(0, pos) : resultArticleNewSite;

    return resultArticleNewSite;
  }

  void _updateStart() {
    _start += _limit;
  }

  void _updateStatusCode(int statusCode) {
    this.statusCode = statusCode;
  }

  Future<void> getNewsBatch() async {
    var url = Uri(
        scheme: "https",
        host: "api.spaceflightnewsapi.net",
        path: "/v3/articles",
        queryParameters: {"_limit": "$_limit", "_start": "$_start"}
    );

    var response = await http.get(url, headers: {"Content-Type": "application/json"});
    _updateStatusCode(response.statusCode);

    if (response.statusCode == 200) {
      var newsList = jsonDecode(response.body) as List;
      for (var element in newsList) {
        Article article = Article(
          id: element["id"],
          title: element["title"],
          url: element["url"],
          imageUrl: element["imageUrl"],
          newsSite: _modifyArticleNewsSite(element["newsSite"]),
          content: _modifyArticleContent(element["summary"]),
          publishedData: element["publishedAt"]
        );

        articles.add(article);
      }

      _updateStart();
    }
  }
}
