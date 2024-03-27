import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:news/repository/article_collection/article_collection.dart';
import 'package:news/features/article_list/widgets/widgets.dart';

@RoutePage()
class ArticleListScreen extends StatefulWidget {
  const ArticleListScreen({
    super.key,
    required this.controller,
  });

  final ScrollController controller;

  @override
  State<ArticleListScreen> createState() => _ArticleListScreenState();
}

class _ArticleListScreenState extends State<ArticleListScreen> {
  final _articleCollection = GetIt.instance<BaseArticleCollection>();
  bool _isFirstLoading = true;
  bool _loading = true;

  @override
  void initState() {
    _loading = true;
    _isFirstLoading = true;
    super.initState();
    _getNews();
    widget.controller.addListener(_getNews);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_getNews);
    super.dispose();
  }

  void scrollToBegin() {
    widget.controller.animateTo(
        widget.controller.position.minScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut
    );
  }


  Future<void> _getNews() async {
    if (_isFirstLoading) {
      await _articleCollection.addArticles();
      setState(() {
        _loading = false;
        _isFirstLoading = false;
      });
    } else {
      if (!_loading && widget.controller.position.pixels >= widget.controller.position.maxScrollExtent) {
        setState(() {
          _loading = true;
        });
        await _articleCollection.addArticles();
        if (_articleCollection.statusCode == 200) {
          setState(() {
            _loading = false;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomScrollView(
      controller: widget.controller,
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          pinned: false,
          snap: true,
          floating: true,
          forceElevated: true,
          elevation: 0,
          shadowColor: theme.shadowColor.withOpacity(0.2),
          surfaceTintColor: Colors.transparent,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Share",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 26,
                      letterSpacing: 0.8
                    ),
                  ),
                  Text(
                    "Space",
                    style: TextStyle(
                      color: theme.primaryColor,
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.8
                    ),
                  )
                ],
              ),
            ),
          ),
          // bottom: const PreferredSize(
          //   preferredSize: Size.fromHeight(70),
          //   child: SearchButton(),
          // )
        ),
        const SliverToBoxAdapter(
            child: SizedBox(
          height: 12,
        )),
        SliverList.builder(
          itemCount: _articleCollection.articles.length,
          itemBuilder: (context, index) {
            //print("INDEX $index");
            //print(_articles);
            return ArticleListCard(
              article: _articleCollection.articles[index],
            );
          },
        )
    ]
    );
  }
}