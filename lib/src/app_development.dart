// ignore_for_file: cascade_invocations

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

// ignore: depend_on_referenced_packages
import 'package:logger/logger.dart';
import 'package:prueba_tecnica/src/common/theme/theme.dart';
import 'package:prueba_tecnica/src/feature/splash/splash_screen.dart';

class AppDevelopment extends StatefulWidget {
  const AppDevelopment({super.key});

  @override
  State<AppDevelopment> createState() => _AppDevelopmentState();
}

class _AppDevelopmentState extends State<AppDevelopment> {
  @override
  void initState() {
    // color de los status bar
    // SystemChrome.setSystemUIOverlayStyle(
    //   const SystemUiOverlayStyle(
    //     statusBarColor: Colors.black,
    //     statusBarIconBrightness: Brightness.light,
    //     statusBarBrightness: Brightness.light,
    //   ),
    // );
    if (!kReleaseMode) {
      final logger = Logger();
      logger.d('App started');
      // logger.i('Token: ${LocalStorage.token}');
      // logger.i('Token fcm: ${LocalStorage.tokenFcm}');
    }
    // configurar idioma
    // if (LocalStorage.lenguage != null) {
    //   changeLocale(context, LocalStorage.lenguage);
    // } else {
    //   LocalStorage.setLenguage = Language.es.name;
    // }
    FlutterNativeSplash.remove();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dev Catbreeds',
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      home: const SplashScreen(),
      theme: lightThemeData,
      // mantener escala de fuente
      builder: (context, child) {
        return MediaQuery(
          data:
              MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
          child: child!,
        );
      },
      localizationsDelegates: const [
        // GlobalMaterialLocalizations.delegate,
        // GlobalCupertinoLocalizations.delegate,
        // GlobalWidgetsLocalizations.delegate,
      ],
      // supportedLocales: localizationDelegate.supportedLocales,
      // locale: localizationDelegate.currentLocale,
    );
  }
}
