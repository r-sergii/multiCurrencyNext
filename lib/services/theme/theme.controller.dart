import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends ChangeNotifier {
  final ValueNotifier<ThemeMode> notifier = ValueNotifier(ThemeMode.light);

  void change(int i) {
    // final mode = notifier.value;
    // notifier.value = mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    if (i == 0) {
      notifier.value = ThemeMode.light;
    } else {
      notifier.value = ThemeMode.dark;
    }
  }

  void init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool themeMode = prefs.getBool("theme") ?? true;
    if (themeMode) {
      notifier.value = ThemeMode.light;
    } else {
      notifier.value = ThemeMode.dark;
    }
  }

  void save() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (notifier.value == ThemeMode.light) {
      await prefs.setBool("theme", true);
    } else {
      await prefs.setBool("theme", false);
    }
  }
}

//https://stackoverflow.com/questions/67794181/how-to-change-theme-in-flutter

// import 'package:flutter/material.dart';

// //---This to switch theme from Switch button----
// class ThemeProvider extends ChangeNotifier {
//   //-----Store the theme of our app--
//   ThemeMode themeMode = ThemeMode.dark;

//   //----If theme mode is equal to dark then we return True----
//   //-----isDarkMode--is the field we will use in our switch---
//   bool get isDarkMode => themeMode == ThemeMode.dark;

//   //---implement ToggleTheme function----
//   void toggleTheme(bool isOn) {
//     themeMode = isOn ? ThemeMode.dark : ThemeMode.light;

//     //---notify material app to update UI----
//     notifyListeners();
//   }
// }

// //---------------Themes settings here-----------
// class MyThemes {

//   //-------------DARK THEME SETTINGS----
//   static final darkTheme = ThemeData(
//     scaffoldBackgroundColor: Colors.black45,
//     // colorScheme:  ColorScheme.dark(),

//   );


//   //-------------light THEME SETTINGS----
//   static final lightTheme = ThemeData(
//     scaffoldBackgroundColor: Colors.white,
//     //colorScheme:  ColorScheme.light(),
//   );

// }