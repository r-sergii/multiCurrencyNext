import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '/core/store.dart';
import '/screens/currency/currency.controller.dart';
import '/screens/currency/currency.model.dart';

class CurrencyUIController extends ChangeNotifier {
  final List<Widget> icons = [
    Image.asset('images/f_usd.png', height: 96, width: 96), //96?96
    Image.asset('images/f_eur.png', height: 96, width: 96), //96?96
    Image.asset('images/f_gbp.png', height: 96, width: 96), //96?96
    Image.asset('images/f_jpy.png', height: 96, width: 96), //96?96
    Image.asset('images/f_chf.png', height: 96, width: 96), //96?96
    Image.asset('images/f_cad.png', height: 96, width: 96), //96?96
    Image.asset('images/f_aud.png', height: 96, width: 96), //96?96
    Image.asset('images/f_nzd.png', height: 96, width: 96),
  ];
  List<Widget> iconsVar = [];
  final List<String> tickers = ["USD", "EUR", "GBP", "JPY", "CHF", "CAD", "AUD", "NZD"];
  List<String> tickersVar = [];

  List<CurrencyModel> rates = [];

  Future<void> fullRates() async {
    final MyStore store = VxState.store as MyStore;

    final CurrencyController controller = store.currencyController;
    if (controller.rates.isEmpty) {
      await controller.read();
    }
    iconsVar.clear();
    tickersVar.clear();
    rates.clear();
    for (int i = 0; i < tickers.length; i++) {
      if (tickers[i] != currentCurrency) {
        tickersVar.add(tickers[i]);
        iconsVar.add(icons[i]);
      }
    }
    for (int i = 0; i < controller.rates.length; i++) {
      if (controller.rates[i].quotes.substring(0, 3) == currentCurrency) {
        rates.add(controller.rates[i]);
        // print(controller.rates[i].quotes.substring(0, 3));
        // print(controller.rates[i].quotes.substring(4, 7));
        // print(currentCurrency);
        // print(tickers[currentIndex]);
        // print(controller.rates[i].close);
        // print("///");
      }
    }
  }

  String _currentCurrency = "USD";
  String get currentCurrency {
    return _currentCurrency;
  }

  set currentCurrency(String val) {
    _currentCurrency = val;
    notifyListeners();
  }

  int _currentIndex = 0;
  int get currentIndex {
    return _currentIndex;
  }

  set currentIndex(int val) {
    _currentIndex = val;
    notifyListeners();
  }
}
