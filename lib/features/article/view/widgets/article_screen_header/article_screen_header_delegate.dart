import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ArticleScreenHeaderDelegate extends SliverPersistentHeaderDelegate {
  final String title;
  final String imageUrl;
  final String newsSite;
  @override
  final double maxExtent;
  @override
  final double minExtent;

  const ArticleScreenHeaderDelegate({
    required this.title,
    required this.newsSite,
    required this.imageUrl,
    required this.maxExtent,
    required this.minExtent,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    ThemeData theme = Theme.of(context);
    final topPadding = MediaQuery.of(context).padding.top;

    const animationDuration = Duration(milliseconds: 200);
    final showNewsSiteDate = shrinkOffset < 200;
    final calcForTitleAnimation = (maxExtent - shrinkOffset - topPadding - 56 - 100) / 100;
    final titleAnimationValue = calcForTitleAnimation > 1.0
        ? 1.0 : calcForTitleAnimation < 0.0
        ? 0.0 : calcForTitleAnimation;

    return Stack(
      fit: StackFit.expand,
      children: [
        CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          placeholder: (context, url) {
            return Container(
              color: theme.hintColor.withOpacity(0.1));
          },
          errorWidget: (BuildContext context, String error,  url) {
            return Container(
              color: theme.hintColor.withOpacity(0.1));
          },
        ),
        Positioned(
            top: 25,
            left: 0,
            child: BackButton(
              onPressed: () {
                AutoRouter.of(context).maybePop();
              },
              color: Colors.white.withOpacity(0.8),
            )
        ),
        Positioned(
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                stops: const [
                  0.01,
                  1.0
                ],
                colors: [
                  Colors.black.withOpacity(1),
                  Colors.transparent
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter
              )
            ),
            child: AnimatedOpacity(
              opacity: titleAnimationValue,
              duration: animationDuration,
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedContainer(
                      duration: animationDuration,
                      height: showNewsSiteDate ? 50 : 0
                    ),
                    AnimatedSwitcher(
                      duration: animationDuration,
                      child: showNewsSiteDate ? Chip(
                        side: const BorderSide(
                          width: 0,
                          color: Colors.transparent,
                          style: BorderStyle.none
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)
                        ),
                        shadowColor: Colors.transparent,
                        labelPadding: const EdgeInsets.symmetric(horizontal: 2),
                        labelStyle: const TextStyle(color: Colors.white, height: 1),
                        label: Text(newsSite),
                        backgroundColor: theme.primaryColor.withOpacity(1),
                      ) : const SizedBox.shrink()
                    ),
                    AnimatedContainer(
                      duration: animationDuration,
                      height: showNewsSiteDate ? 10 : 0
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 20,
                      child: Text(
                        title,
                        style: theme.textTheme.headlineMedium?.copyWith(color: Colors.white),
                      ),
                    ),
                    AnimatedContainer(
                      duration: animationDuration,
                      height: showNewsSiteDate ? 10 : 0
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;

  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration =>
      OverScrollHeaderStretchConfiguration();
}
