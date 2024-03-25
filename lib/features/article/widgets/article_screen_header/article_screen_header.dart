import 'package:flutter/material.dart';
import '../../../../../api/models/article.dart';
import 'article_screen_header_delegate.dart';

class ArticleScreenHeader extends StatelessWidget {
  const ArticleScreenHeader({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    final maxScreenHeight = MediaQuery.of(context).size.height;
    final topPadding = MediaQuery.of(context).padding.top;

    return SliverPersistentHeader(
        delegate: ArticleScreenHeaderDelegate(
            title: article.title,
            newsSite: article.newsSite,
            imageUrl: article.imageUrl,
            minExtent: topPadding,
            maxExtent: maxScreenHeight / 2.3
        )
    );
  }
}