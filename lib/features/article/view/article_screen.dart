import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news/features/article/view/widgets/article_screen_body/article_screen_body.dart';
import 'package:news/features/article/view/widgets/article_screen_header/article_screen_header.dart';

import '../../../api/models/article.dart';

@RoutePage()
class ArticleScreen extends StatelessWidget {
  const ArticleScreen({
    super.key,
    required this.article
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.65, 0.35],
          colors: [
            Colors.black,
            theme.cardColor,
          ],
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            ArticleScreenHeader(article: article),
            ArticleScreenBody(article: article),
          ],
        ),
      ),
    );
  }
}