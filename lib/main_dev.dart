import 'package:flutter/foundation.dart';
import 'package:mothercare_mobile/core/preference/pref_key_helper.dart';
import 'package:mothercare_mobile/core/preference/preference_helper.dart';
import 'package:mothercare_mobile/core/utils/notification/notification_service.dart';
import 'package:mothercare_mobile/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:mothercare_mobile/core/core.dart';
import 'package:mothercare_mobile/core/flavor/flavor_config.dart';
import 'package:mothercare_mobile/core/resource/injector/injection_container.dart' as injector;
import 'package:mothercare_mobile/main.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  if (message.notification != null) {
    NotificationService().showNotification(title: message.notification?.title, body: message.notification?.body);
  }
  print("Handling a background message: ${message.messageId}");
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
    flavor: FlavorType.staging,
    color: Colors.red,
    server: 'https://www.mothercare.co.id/rest/mothercare_website_english/V1',
    webApiServer: '',
    values: const FlavorValues(
      titleApp: "Bakso Staging",
    ),
  );
  injector.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((value) => runApp(MyApp()));
}
