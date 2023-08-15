import 'package:mothercare_mobile/core/helpers/secure_storage/storage_helper.dart';
import 'package:mothercare_mobile/core/helpers/secure_storage/storage_key_helper.dart';
import 'package:mothercare_mobile/core/resource/models/base_response.dart';
import 'package:mothercare_mobile/core/resource/repositories/repository.dart';
import 'package:mothercare_mobile/features/profile/model/user_profile_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final Repository _repository;

  ArticleBloc(this._repository) : super(ArticleState()) {
    on<DataArticleProfileEvent>(_onArticleProfile);
  }

  Future<void> _onArticleProfile(DataArticleProfileEvent event, Emitter<ArticleState> emit) async {
    try {
      emit(const ArticleState.noValue());
      final data = await _repository.doGetProfile();
      if (data.response?.data != null) {
        await storage.write(StorageKey.deviceToken, data.response?.data?.item?.deviceToken ?? "");
        await storage.write(StorageKey.role, data.response?.data?.item?.roles?.first.name ?? "");
        await storage.write(StorageKey.rolePermission, "${data.response?.data?.item?.permissions}");
        if (data.response?.data?.item?.noKk != null && data.response?.data?.item?.noKk != "") {
          await storage.write(StorageKey.noKk, data.response?.data?.item?.noKk ?? "");
        }
        emit(state.copyWith(isLoading: false, userProfileResponse: data));
      } else {
        emit(state.copyWith(isLoading: false, errorMessage: data.errorMessage));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}
