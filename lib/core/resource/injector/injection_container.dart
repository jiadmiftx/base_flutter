import 'package:flutter/services.dart';
import 'package:mothercare_mobile/core/config/bloc/config_bloc.dart';
import 'package:mothercare_mobile/core/resource/network/http_service.dart';
import 'package:mothercare_mobile/features/category/bloc/category_bloc.dart';
import 'package:mothercare_mobile/features/ektp/bloc/ektp_bloc.dart';
import 'package:mothercare_mobile/features/ektp/ektp.dart';
import 'package:mothercare_mobile/features/home/bloc/home_bloc.dart';
import 'package:mothercare_mobile/features/notifikasi/bloc/notification_bloc.dart';
import 'package:mothercare_mobile/features/profile/bloc/profile_bloc.dart';
import 'package:mothercare_mobile/core/resource/network/rest_client.dart';
import 'package:mothercare_mobile/features/register/bloc/register_bloc.dart';
import 'package:mothercare_mobile/features/login/bloc/login_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.I;
final platform = MethodChannel('channel');

Future<void> init() async {
  // final Dio _dio = Dio();
  // _dio.interceptors.add(PrettyDioLogger(requestHeader: true, requestBody: true, responseBody: true, error: true, compact: true, maxWidth: 150));

  sl.registerLazySingleton<HttpService>(() => HttpService());
  sl.registerLazySingleton<RestClient>(() => RestClient(sl<HttpService>().dio));
  sl.registerLazySingleton(() => ConfigBloc());
  sl.registerLazySingleton(() => Repository(sl<RestClient>()));
  sl.registerLazySingleton(() => LoginBloc(sl<Repository>()));
  sl.registerLazySingleton(() => RegisterBloc(sl<Repository>()));
  sl.registerLazySingleton(() => HomeBloc(sl<Repository>()));
  sl.registerLazySingleton(() => CategoryBloc(sl<Repository>()));
  sl.registerLazySingleton(() => EktpBloc(sl<Repository>()));
  sl.registerLazySingleton(() => ProfileBloc(sl<Repository>()));
  sl.registerLazySingleton(() => NotificationBloc(sl<Repository>()));
}
