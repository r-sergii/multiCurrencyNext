import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
// import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import '/core/store.dart';
import '/routes.dart';
// import 'package:url_strategy/url_strategy.dart';
import 'package:velocity_x/velocity_x.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import '/utils/theme_data.dart';
// import '/screens/home/home.page.dart';
// // import '/screens/calendars/calendars.page.dart';
// import '/screens/settings/settings.page.dart';
// import '/screens/clocks/clocks.page.dart';
// import '/screens/cities/cities.page.dart';

// import 'screens/home/home.page.dart';
// import '/utils/routes.dart';
import 'app.dart';
import 'config.dart';
import 'services/theme/theme.controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // setPathUrlStrategy();
  // SharedPreferences.setMockInitialValues({});
  Vx.setPathUrlStrategy();
  HttpOverrides.global = MyHttpOverrides();
  await initServices();
  runApp(
    VxState(
      store: MyStore(),
      // child: EasyDynamicThemeWidget(
      child: const MyApp(),
      // ),
    ),
  );
}

Future initServices() async {
  await App.init(Config());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyStore store = VxState.store as MyStore;
    final ThemeController theme = store.themeController;

    var vxNavigator = VxNavigator(routes: getRoutes());
    // {
    //   MyRoutes.home: (_, __) => MaterialPage(child: HomePage()),
    //   MyRoutes.settings: (_, __) => const MaterialPage(child: SettingsPage()),
    //   MyRoutes.cities: (_, __) => const MaterialPage(child: CitiesPage()),
    //   MyRoutes.clocks: (_, __) => const MaterialPage(child: ClocksPage()),
    //   // MyRoutes.homeRoute: (_, __) => const MaterialPage(child: HomePage()),
    //   // MyRoutes.settingsRoute: (_, __) => const MaterialPage(child: SettingsPage()),
    //   // MyRoutes.puzzleRoute: (_, __) => const MaterialPage(child: PuzzlePage()),
    // });
    (VxState.store as MyStore).navigator = vxNavigator;

    return ValueListenableBuilder<ThemeMode>(
        valueListenable: theme.notifier,
        builder: (_, mode, __) {
          return MaterialApp.router(
            title: 'multCurrencyNext',
            themeMode: theme.notifier.value,
            theme: lightThemeData,
            darkTheme: darkThemeData,
            debugShowCheckedModeBanner: false,
            // themeMode: EasyDynamicTheme.of(context).themeMode,
            scrollBehavior: MyCustomScrollBehavior(),
            // home: HomePage(),
            // initialRoute: '/',
            // routes: getRoutes(),
            routeInformationParser: VxInformationParser(),
            routerDelegate: vxNavigator,
          );
        });
  }
}
