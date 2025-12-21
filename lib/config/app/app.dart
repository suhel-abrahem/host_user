import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/language_constant.dart';
import '../../core/dependencies_injection.dart';
import '../../generated/locale_keys.g.dart';
import '../route/routes_manager.dart';
import '../theme/app_theme.dart';
import 'app_preferences.dart';

class HostaUser extends StatelessWidget {
  const HostaUser({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: false,
      ensureScreenSize: true,
      builder: (context, child) {
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
        return ThemeProvider(
          initTheme: (getItInstance<AppPreferences>().getAppTheme() ?? false)
              ? darkTheme()
              : lightTheme(),
          child: MaterialApp.router(
            key: ValueKey(lastPath),
            debugShowCheckedModeBanner: false,
            title: LocaleKeys.app_name.tr(),
            themeMode: (getItInstance<AppPreferences>().getAppTheme() ?? false)
                ? ThemeMode.dark
                : ThemeMode.light,
            theme: (getItInstance<AppPreferences>().getAppTheme() ?? false)
                ? darkTheme()
                : lightTheme(),

            supportedLocales: LanguageConstant.supportedLocales,
            routerConfig: goRouter,
            locale: context.locale,
            localizationsDelegates: context.localizationDelegates,
          ),
        );
      },
    );
  }
}
