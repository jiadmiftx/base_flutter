import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mothercare_mobile/core/config/bloc/config_bloc.dart';
import 'package:mothercare_mobile/core/preference/pref_key_helper.dart';
import 'package:mothercare_mobile/core/preference/preference_helper.dart';
import 'package:mothercare_mobile/core/utils/notification/notification_service.dart';
import 'package:mothercare_mobile/features/category/bloc/category_bloc.dart';
import 'package:mothercare_mobile/features/ektp/bloc/ektp_bloc.dart';
import 'package:mothercare_mobile/features/ektp/ektp.dart';
import 'package:mothercare_mobile/features/home/bloc/home_bloc.dart';
import 'package:mothercare_mobile/features/notifikasi/bloc/notification_bloc.dart';
import 'package:mothercare_mobile/features/profile/bloc/profile_bloc.dart';
import 'package:mothercare_mobile/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:mothercare_mobile/core/flavor/flavor_config.dart';
import 'package:mothercare_mobile/features/login/bloc/login_bloc.dart';
import 'package:mothercare_mobile/features/register/bloc/register_bloc.dart';
import 'package:mothercare_mobile/core/resource/injector/injection_container.dart' as injector;
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:mothercare_mobile/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  if (message.notification != null) {
    NotificationService().showNotification(title: message.notification?.title, body: message.notification?.body);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefInstance = await SharedPreferences.getInstance();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  NotificationService().initNotification();
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  initPlatformState();
  String lang = prefInstance.getString(describeEnum(PrefsKey.appLang)) ?? 'id';
  String codeLang = lang == 'en' ? "en_US" : "id_ID";
  FlavorConfig(
    flavor: FlavorType.prod,
    color: Colors.blue,
    server: 'https://www.mothercare.co.id/rest/mothercare_website_english/V1',
    webApiServer: '',
    values: const FlavorValues(
      titleApp: "Mothercare Indonesia",
    ),
  );
  injector.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((value) => runApp(MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();

  void initFirebase() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission();

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      FirebaseMessaging.instance.getToken().then((value) async {
        log("fcm $value");
        await storage.write(StorageKey.deviceToken, "$value");
      });
      // log('User granted permission 🛎️⛔️🛎️');
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      // log('User granted provisional permission 🛎️⛔️🛎️');
    } else {
      // log('User declined or has not accepted permission 🛎️⛔️🛎️');
    }
    FirebaseMessaging.onMessage.listen((event) {
      // log('listen.. $event 🛎️⛔️🛎️');
      NotificationService().showNotification(title: event.notification?.title, body: event.notification?.body);
    });
  }

  @override
  void initState() {
    // initFirebase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ConfigBloc>(
      create: (ctx) => sl<ConfigBloc>(),
      child: KeyboardDismisser(child: BlocBuilder<ConfigBloc, ConfigState>(
        builder: (ctx, state) {
          return _main(ctx, Locale(state.local == '' ? 'id' : state.local));
        },
      )),
    );
  }

  Widget _main(BuildContext ctx, Locale locale) {
    var app = AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarBrightness: Brightness.light, statusBarIconBrightness: Brightness.dark),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        locale: locale,
        localizationsDelegates: [
          S.delegate,
          ...GlobalMaterialLocalizations.delegates,
        ],
        supportedLocales: S.delegate.supportedLocales,
        routerDelegate: _appRouter.delegate(
          navigatorObservers: () => [AutoRouteObserver()],
        ),
        routeInformationParser: _appRouter.defaultRouteParser(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'SFProText',
        ),
      ),
    );
    return MultiBlocProvider(providers: [
      BlocProvider<LoginBloc>(
        create: (BuildContext context) => sl<LoginBloc>(),
      ),
      BlocProvider<RegisterBloc>(
        create: (BuildContext context) => sl<RegisterBloc>(),
      ),
      BlocProvider<EktpBloc>(
        create: (BuildContext context) => sl<EktpBloc>(),
      ),
      BlocProvider<EktpBloc>(
        create: (BuildContext context) => sl<EktpBloc>(),
      ),
      BlocProvider<ProfileBloc>(
        create: (BuildContext context) => sl<ProfileBloc>(),
      ),
      BlocProvider<NotificationBloc>(
        create: (BuildContext context) => sl<NotificationBloc>(),
      ),
      BlocProvider<HomeBloc>(
        create: (BuildContext context) => sl<HomeBloc>(),
      ),
      BlocProvider<CategoryBloc>(
        create: (BuildContext context) => sl<CategoryBloc>(),
      ),
    ], child: app);
  }
}
