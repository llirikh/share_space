import 'package:news/models/models.dart';

import '../../api/base_api/base_api.dart';

abstract interface class BaseArticleCollection {
  List<Article> get articles;
  int get statusCode;

  BaseApi get api;

  Future<void> addArticles();

  Future<Article> getArticle({
    required int id
  });
}