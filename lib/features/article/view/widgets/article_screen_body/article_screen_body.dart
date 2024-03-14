import 'package:flutter/material.dart';

import '../../../../../api/models/article.dart';
import 'article_screen_hyperlink.dart';

class ArticleScreenBody extends StatelessWidget {
  const ArticleScreenBody({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: theme.cardColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              article.content,
              style: theme.textTheme.bodyLarge,
            ),
            ArticleScreenHyperlink(
              text: "Learn more...",
              url: article.url,
              textStyle: theme.textTheme.bodyLarge?.copyWith(
                color: theme.primaryColor,
              )
            )
          ],
        ),
      ),
    );
  }
}