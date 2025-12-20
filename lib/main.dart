import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hosta_user/firebase_options.dart';

import 'config/app/app.dart';
import 'config/app/app_preferences.dart';
import 'core/constants/language_constant.dart';
import 'core/dependencies_injection.dart';
import 'core/resource/firebase_common_services/firebase_messageing_service.dart';
import 'core/util/helper/helper.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  

  
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  
  await initDependencies();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness:
          (getItInstance<AppPreferences>().getAppTheme() ?? false)
          ? Brightness.dark
          : Brightness.light,
      statusBarIconBrightness:
          (getItInstance<AppPreferences>().getAppTheme() ?? false)
          ? Brightness.dark
          : Brightness.light,
    ),
  );
  WidgetsBinding.instance.addPostFrameCallback((_) {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  
  getItInstance<FirebaseMessagingService>().notificationPermission();
  getItInstance<FirebaseMessagingService>().getDeviceToken();
});
  print('user info: ${getItInstance<AppPreferences>().getUserInfo()}');
  runApp(
    EasyLocalization(
      supportedLocales: LanguageConstant.supportedLocales,
      path: LanguageConstant.path,
      saveLocale: true,
      startLocale: Helper.getLocaleByCode(
        getItInstance<AppPreferences>().getLanguage() ?? LanguageConstant.en,
      ),
      fallbackLocale: LanguageConstant.arLoacle,
      child: HostaUser(),
    ),
  );
}
