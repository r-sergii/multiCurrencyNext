import 'package:flutter/material.dart';

import './settings.model.dart';

class SettingsController extends ChangeNotifier {
  bool isExpanded = false;
  // List<ClockItemModel> list = [];

  Future<void> read() async {
    // final MyStore store = VxState.store as MyStore;

    // final ClockService clockService = store.clockService;
    // // if (clockService.getCountItems() == 0) {
    // //   await clockService.loadItems();
    // // }

    // list.clear();
    // list.addAll(clockService.listClockItemModel);
  }

  readStorage() {
    // list.forEach((element) {
    //   element.isShow.value = App.prefs.getBool(element.zone) ?? true;
    // });
  }

  writeStorage() {
    // list.forEach((element) {
    //   App.prefs.setBool(element.zone, element.isShow.value);
    //   debugPrint(element.zone);
    //   debugPrint(element.isShow.value.toString());
    // });
  }

  int _selectedValueTheme = 0;
  int get selectedValueTheme {
    return _selectedValueTheme;
  }

  set selectedValueTheme(int val) {
    _selectedValueTheme = val;
    // notifyListeners();
  }

  int _selectedValueLang = 0;
  int get selectedValueLang {
    return _selectedValueLang;
  }

  set selectedValueLang(int val) {
    _selectedValueLang = val;
    // notifyListeners();
  }

  final List<ItemColorTheme> listItemColorTheme = [
    ItemColorTheme(0, "Light", Colors.white),
    ItemColorTheme(1, "Dark", Colors.black),
    // ItemColorTheme(2, "Blue", Colors.blue),
  ];

  final List<ItemLanguage> listItemLanguage = [
    ItemLanguage(0, "English language", "EN"),
    ItemLanguage(1, "Afrikaanse taal", "AF"),
    ItemLanguage(2, "Azərbaycan dili", "AZ"),
    ItemLanguage(3, "Bosanski jezik", "BS"),
    ItemLanguage(4, "Čeština Jazyk", "CS"),
    ItemLanguage(5, "Cymraeg iaith", "CU"), //Валийский
    ItemLanguage(6, "Dansk sprog", "DA"), //Датский
    ItemLanguage(7, "Deutsch sprache", "DE"),
    ItemLanguage(8, "Español idioma", "ES"),
    ItemLanguage(9, "Eesti keel", "ET"), //Эстонский
    ItemLanguage(10, "Français langue", "FR"),
    ItemLanguage(11, "Gaeilge teanga", "GA"), //Ирландский
    ItemLanguage(12, "Albannach (Ghàidhlig) cànain", "GD"), //Шотландский
    ItemLanguage(13, "Suomen kieli", "FI"),
    ItemLanguage(14, "Hrvatski Jezik", "HR"),
    ItemLanguage(15, "Magyar nyelv", "HU"),
    ItemLanguage(16, "Italiano Lingua", "IT"),
    ItemLanguage(17, "Lëtzebuergesch sprooch", "LB"), //Люксембург
    ItemLanguage(18, "Lietuvių kalba", "LT"),
    ItemLanguage(19, "Latviski valodu", "LV"),
    ItemLanguage(20, "Nederlands taal", "NL"),
    ItemLanguage(21, "Norsk språk", "NO"),
    ItemLanguage(22, "Polski Język", "PL"),
    ItemLanguage(23, "Português Língua", "PT"),
    ItemLanguage(24, "Română limba", "RO"),
    ItemLanguage(25, "Slovenský Jazyk", "SK"), //Словацкий
    ItemLanguage(26, "Slovenščina Jezik", "SL"), //Словенский
    ItemLanguage(27, "Shqiptare gjuh", "SQ"), //Албанский
    ItemLanguage(28, "Svenska språket", "SV"),
    ItemLanguage(29, "Türk Dili", "TR"),

    ItemLanguage(30, "Български език", "BG"),
    ItemLanguage(31, "Македонски јазик", "MK"),
    ItemLanguage(32, "Українська мова", "UK"),

    ItemLanguage(33, "ελληνική γλώσσα", "EL"), //Греческий

    ItemLanguage(34, "اللغة العربية", "AR"), //Арабский
    ItemLanguage(35, "زبان فارسی", "FA"), //Персидский
    ItemLanguage(36, "שפה עברית", "HE"), //Иврит
    ItemLanguage(37, "हिन्दी भाषा", "HI"), //Хинди
    ItemLanguage(38, "日本 言語", "JA"), //Японский
    ItemLanguage(39, "ქართული ენა", "KA"), //Грузинский
    ItemLanguage(40, "한국인 언어", "KO"), //Корейский
    ItemLanguage(41, "ไทย ภาษา", "TH"), //Тайский

    ItemLanguage(42, "Tiếng Việt ngôn ngữ ", "VI"), //Вьетнамский
    ItemLanguage(43, "中国人 语", "ZH"), //Китайский

    ItemLanguage(44, "Русский язык", "RU"), //50
  ];
}
