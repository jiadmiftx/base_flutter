part of 'article_bloc.dart';

abstract class ArticleEvent extends Equatable {
  const ArticleEvent();

  @override
  List<Object?> get props => <Object>[];
}

class DataArticleProfileEvent extends ArticleEvent {
  const DataArticleProfileEvent();

  @override
  List<Object> get props => <Object>[];
}
