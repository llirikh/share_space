import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news/features/articles_list/view/widgets/article_list_card.dart';

import '../../../../api/api.dart';

@RoutePage()
class SearchScreen extends StatefulWidget {
  const SearchScreen({
    super.key,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late News _news;
  bool _isFirstLoading = true;
  bool _loading = true;
  late ScrollController _controller;

  @override
  void initState() {
    _loading = true;
    _isFirstLoading = true;
    super.initState();
    _news = News();
    _getNews();
    _controller = ScrollController()..addListener(_getNews);
  }

  @override
  void dispose() {
    _controller.removeListener(_getNews);
    super.dispose();
  }

  _getNews() async {
    if (_isFirstLoading) {
      await _news.getNewsBatch();
      setState(() {
        _loading = false;
        _isFirstLoading = false;
      });
    } else {
      if (!_loading && _controller.position.pixels >= _controller.position.maxScrollExtent) {
        setState(() {
          _loading = true;
        });
        await _news.getNewsBatch();
        if (_news.statusCode == 200) {
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
      controller: _controller,
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
          itemCount: _news.articles.length,
          itemBuilder: (context, index) {
            //print("INDEX $index");
            //print(_articles);
            return ArticleListCard(
              article: _news.articles[index],
            );
          },
        )
    ]
    );
  }
}