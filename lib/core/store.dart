import 'package:velocity_x/velocity_x.dart';
import '../screens/settings/settings.controller.dart';
import '../services/translator/translator.service.dart';
import '/services/translator/translator.controller.dart';
// import '/screens/settings/settings.controller.dart';
import '../services/theme/theme.controller.dart';
// import '/services/clocks/clock.service.dart';
import '../screens/currency/currency.ui.controller.dart';
import '../screens/currency/currency.controller.dart';

class MyStore extends VxStore {
  TranslatorController translatorController = TranslatorController();
  SettingsController settingsController = SettingsController();
  LocaleService localeService = LocaleService();
  ThemeController themeController = ThemeController();
  CurrencyController currencyController = CurrencyController();
  CurrencyUIController currencyUiController = CurrencyUIController();
  late VxNavigator navigator;

  MyStore() {
    // clockService.loadItems();
    themeController.init();
    // localeController.init();
    // citiesController.init(clockService);
  }
}

class CurrentCurrency extends VxMutation<MyStore> {
  final String value;
  CurrentCurrency(this.value);
  @override
  perform() => store!.currencyUiController.currentCurrency = value;
}

class CurrentIndex extends VxMutation<MyStore> {
  final int value;
  CurrentIndex(this.value);
  @override
  perform() => store!.currencyUiController.currentIndex = value;
}

class SelectedValueTheme extends VxMutation<MyStore> {
  final int value;
  SelectedValueTheme(this.value);
  @override
  perform() => store!.settingsController.selectedValueTheme = value;
}

class SelectedValueLang extends VxMutation<MyStore> {
  final int value;
  SelectedValueLang(this.value);
  @override
  perform() => store!.settingsController.selectedValueLang = value;
}