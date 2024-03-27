import 'package:flutter_bloc/flutter_bloc.dart';

part 'article_list_event.dart';
part 'article_list_state.dart';

class ArticleListBLoc extends Bloc<ArticleListEvent, ArticleListState> {
  ArticleListBLoc() : super(ArticleListInitial()) {
    on<LoadArticleList>((event, emit) {
      print("Article list is loading...");
    });

  }
}