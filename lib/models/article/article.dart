import 'package:timeago/timeago.dart' as timeago;

import 'package:news/models/article/timeago.dart';

class Article {
  int id;
  String title;
  String url;
  String imageUrl;
  String newsSite;
  String content;
  String publishedData;

  Article({
    required this.id,
    required this.title,
    required this.url,
    required this.imageUrl,
    required this.newsSite,
    required this.content,
    required this.publishedData
  }) {
    timeago.setLocaleMessages('en', CustomMessages());
  }

  String getTimeAgo() {
    String timeagoString = timeago.format(
      DateTime.parse(publishedData),
      locale: 'en');
    return "${timeagoString[0].toUpperCase()}${timeagoString.substring(1).toLowerCase()}";
  }

}