import 'package:mothercare_mobile/core/resource/models/base_response.dart';
import 'package:mothercare_mobile/core/resource/repositories/repository.dart';
import 'package:mothercare_mobile/features/category/model/categroy_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final Repository _repository;

  CategoryBloc(this._repository) : super(CategoryState()) {
    on<DataCategoryEvent>(_onGetCategory);
  }

  Future<void> _onGetCategory(DataCategoryEvent event, Emitter<CategoryState> emit) async {
    try {
      emit(const CategoryState.noValue());
      final data = await _repository.doGetCategory(storeCode: "mothercare_website");
      if (data.response?.records != null) {
        emit(state.copyWith(isLoading: false, categoryResponse: data));
      } else {
        emit(state.copyWith(isLoading: false, errorMessage: data.errorMessage));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}
