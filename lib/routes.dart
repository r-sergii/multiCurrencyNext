import 'package:flutter/material.dart';
import '/screens/currency/currency.page.dart';
// import '/screens/calendars/calendars.page.dart';
import '/screens/settings/settings.page.dart';
import '/screens/start/start.page.dart';
import '/screens/chart/chart.screen.dart';
// import '/screens/clocks/clocks.page.dart';
// import '/screens/cities/cities.page.dart';

abstract class Routes {
  static const home = '/currency';
  // static const calendars = '/calendars';
  static const settings = '/settings';
  // static const cities = '/cities';
  // static const clocks = '/clocks';
  static const start = '/start';
  static const chart = '/chart';
}

//  final List<Map<String, Widget Function(BuildContext)>> routes = [
final _routes = {
  // Routes.home: (context) => HomePage(),
  // // Routes.calendars: (context) => const CalendarsPage(),
  // Routes.settings: (context) => const SettingsPage(),
  // Routes.cities: (context) => const CitiesPage(),
  // Routes.clocks: (context) => const ClocksPage(),
  // "/": (_, __) => const MaterialPage(child: CurrencyPage()),
  "/": (_, __) => const MaterialPage(child: StartPage()),
  Routes.home: (_, __) => const MaterialPage(child: CurrencyPage()),
  // Routes.calendars: (context) => const CalendarsPage(),
  Routes.settings: (_, __) => const MaterialPage(child: SettingsPage()),
  // Routes.cities: (_, __) => const MaterialPage(child: CitiesPage()),
  // Routes.clocks: (_, __) => const MaterialPage(child: SettingsPage()),
  // Routes.chart: (uri, param) => MaterialPage(child: ChartScreen(title: param[1] != null ? param[1]! : 'EURUSD')),
  Routes.chart: (uri, param) => MaterialPage(child: ChartScreen(title: param)), // uri.pathSegments[0])),
};

getRoutes() {
  return _routes;
}
