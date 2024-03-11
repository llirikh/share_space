import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news/features/article/view/widgets/article_screen_header_delegate.dart';
import 'package:news/features/article/view/widgets/article_screen_hyperlink.dart';

import '../../../api/models/article.dart';

@RoutePage()
class ArticleScreen extends StatelessWidget {
  final Article article;

  const ArticleScreen({
    super.key,
    required this.article
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final topPadding = MediaQuery.of(context).padding.top;
    final maxScreenHeight = MediaQuery.of(context).size.height;

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
          //scrollBehavior: CupertinoScrollBehavior(),
          slivers: [
            SliverPersistentHeader(
              delegate: ArticleScreenHeaderDelegate(
                title: article.title,
                newsSite: article.newsSite,
                imageUrl: article.imageUrl,
                minExtent: topPadding,
                maxExtent: maxScreenHeight / 2.3
              )
            ),
            SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: theme.cardColor,
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: theme.shadowColor.withOpacity(0.1),
                  //     blurRadius: 7,
                  //   )
                  // ]
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.content,
                      style: theme.textTheme.bodyLarge,
                    ),
                    ArticleScreenHyperlink(
                      content: "Learn more...",
                      url: article.url,
                      textStyle: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.primaryColor,
                        // decoration: TextDecoration.underline,
                        // decorationColor: theme.primaryColor
                      )
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}