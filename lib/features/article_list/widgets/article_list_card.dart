import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../router/router.dart';
import '../../../models/article/article.dart';

class ArticleListCard extends StatelessWidget {
  final Article article;

  const ArticleListCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12).copyWith(bottom: 12),
      //margin: const EdgeInsets.symmetric(horizontal: 13).copyWith(bottom: 12)
      child: Ink(
          width: double.infinity,
          height: 180,
          //,
          //padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: theme.shadowColor.withOpacity(0.1),
                  blurRadius: 7,
                )
              ]),
          child: InkWell(
            onTap: () {
              article.getTimeAgo();
              AutoRouter.of(context).push(ArticleRoute(article: article));
            },
            customBorder:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    margin: const EdgeInsets.all(12),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: article.imageUrl,
                      width: 155,
                      height: 155,
                      fit: BoxFit.cover,
                      placeholder: (context, url) {
                        return Container(
                            color: theme.hintColor.withOpacity(0.1));
                      },
                      errorWidget: (BuildContext context, String error,  url) {
                        return Container(
                            color: theme.hintColor.withOpacity(0.1));
                      },
                      fadeInDuration: const Duration(milliseconds: 250),
                      fadeOutDuration: const Duration(milliseconds: 250),
                    )),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(top: 10, left: 5, right: 18, bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(article.newsSite,
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: theme.primaryColor.withOpacity(0.8),
                                  fontWeight: FontWeight.w400,
                                )
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              article.title,
                              textAlign: TextAlign.left,
                              maxLines: 4,
                              style: const TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.w500,
                                height: 1.2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          article.getTimeAgo(),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: theme.hintColor.withOpacity(0.4),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}