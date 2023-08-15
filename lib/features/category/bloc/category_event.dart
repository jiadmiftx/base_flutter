part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object?> get props => <Object>[];
}

class DataCategoryEvent extends CategoryEvent {
  const DataCategoryEvent();

  @override
  List<Object> get props => <Object>[];
}
