// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';
import 'package:mothercare_mobile/core/config/helpers/lang_config.dart';
import 'package:mothercare_mobile/core/preference/pref_key_helper.dart';
import 'package:mothercare_mobile/core/preference/preference_helper.dart';

part 'config_event.dart';
part 'config_state.dart';

class ConfigBloc extends Bloc<ConfigEvent, ConfigState> {
  ConfigBloc() : super(ConfigState(local: prefHelper.getAppLang ?? '')) {
    on<ChangeLanguageEvent>(_onChangeLanguage);
  }

  Future<void> _onChangeLanguage(ChangeLanguageEvent event, Emitter<ConfigState> emit) async {
    await prefInstance.setString(describeEnum(PrefsKey.appLang), event.newLocal);
    LangConfig(langValue: prefInstance.getString(describeEnum(PrefsKey.appLang)) ?? 'id');
    emit(state.copyWith(local: event.newLocal));
  }
}
