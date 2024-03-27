import 'dart:convert';
import 'dart:math';

import 'package:news/models/models.dart';

import '../../../api/base_api/base_api.dart';
import '../../base_article_collection/base_article_collection.dart';

class ArticleCollection implements BaseArticleCollection {
  @override
  BaseApi api;
  @override
  List<Article> articles = [];
  @override
  int statusCode = 200;

  final int _limit = 20;
  int _offset = 0;
  
  ArticleCollection(this.api);
  
  @override
  Future<void> addArticles() async {
    var response = await api.getArticles(
        limit: _limit,
        offset: _offset
    );
    statusCode = response.statusCode;
    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body) as Map<String, dynamic>;
      var newsList = responseBody["results"] as List;
      for (var element in newsList) {
        Article article = Article(
            id: element["id"],
            title: element["title"],
            url: element["url"],
            imageUrl: element["image_url"],
            newsSite: _modifyArticleNewsSite(element["news_site"]),
            content: _modifyArticleContent(element["summary"]),
            publishedData: element["published_at"]
        );

        articles.add(article);
      }

      _offset += _limit;
    }
  }

  @override
  Future<Article> getArticle({required int id}) async {
    // TODO: implement getArticle
    throw UnimplementedError();
  }


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
  
}