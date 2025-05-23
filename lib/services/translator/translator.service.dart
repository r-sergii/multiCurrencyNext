import 'package:flutter/material.dart';

import '../../screens/settings/settings.controller.dart';
import '../../screens/settings/settings.model.dart';
import '/app.dart';
import './translator.provider.dart';
import './translator.controller.dart';
import './translator.model.dart';

class TranslatorService {
  // final _getStorage = GetStorage();

  final host = "script.google.com";
  final path = "/macros/s/AKfycbyEI2pnxLJF489Kp5-qvCdDN8PhvN_Hv08mzplb9IXkoqVjFqSO13u1Q8OYl0CjBHZi/exec";

  Future<List<ResultTranslatorModel>> change(String lang) async {
    TranslatorController controler = TranslatorController();

    Map<String, dynamic> data = {};
    data['lang'] = lang;
    data['words'] = '${controler.currency};${controler.settings};${controler.about};${controler.exit};'
        '${controler.colorthemes};${controler.language};${controler.confirm};${controler.cancel};'
        '${controler.version};${controler.switcherthemes};';
    // '${controler.about};${controler.validemail};${controler.messageEmpty}';
    // data['words'] = controler.home +
    //     ';' +
    //     controler.portfolio +
    //     ';' +
    //     controler.settings +
    //     ';' +
    //     controler.about +
    //     ';' +
    //     controler.colorthemes +
    //     ';' +
    //     controler.language +
    //     ';' +
    //     controler.confirm +
    //     ';' +
    //     controler.cancel;
    print(data);
    List<ResultTranslatorModel> result = await TranslatorProvider().getDataList(host, path, data);
    for (int i = 0; i < result.length; i++) {
      print(result[i].original);
      print(result[i].translation);
    }
    return result;
  }
}

class LocaleService extends ChangeNotifier {
  final ValueNotifier<String> locale = ValueNotifier("EN");

  LocaleService() {
    final first = App.prefs.getString('LOCALE') ?? 'en';
    // is error!!!
    // final MyStore store = VxState.store as MyStore;
    // final SettingsController settingsController = store.settingsController;
    // end block
    final SettingsController settingsController = SettingsController();
    final code = settingsController.listItemLanguage.firstWhere(
      (element) => element.short == first.toUpperCase(),
      orElse: () => ItemLanguage(0, "English language", "EN"),
    );
    locale.value = code.short ?? 'EN';
    currentLocale = createLocale(locale.value.toLowerCase());
  }

  Locale createLocale(String code) {
    final lang = code.split('_');
    debugPrint(code);
    App.prefs.setString('LOCALE', code);
    return Locale(lang[0]);
  }

  late Locale _currentLocale;
  Locale get currentLocale => _currentLocale;
  set currentLocale(Locale locale) {
    _currentLocale = locale;
    App.prefs.setString('LOCALE', _currentLocale.languageCode);
  }

  read() {
    locale.value = App.prefs.getString('LOCALE') ?? 'en';
  }

  write() {
    App.prefs.setString('LOCALE', locale.value);
  }

  void set(String value) {
    locale.value = value;
    currentLocale = createLocale(value);
  }

  String get() {
    return locale.value;
  }
}
