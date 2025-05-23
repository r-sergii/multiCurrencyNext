import 'dart:core';

class CurrencyModel {
  bool isLoad = false;
  String quotes;
  String datetime;
  double open;
  double close;

  CurrencyModel(
    this.quotes,
    this.datetime,
    this.open,
    this.close,
  );

  factory CurrencyModel.empty() {
    var model = CurrencyModel('', '', 0.0, 0.0);
    model.isLoad = false;
    return model;
  }

  factory CurrencyModel.fromJson(dynamic json) {
    var model = CurrencyModel(
      json['quotes'] ?? '',
      json['datetime'] ?? '',
      json['open'] ?? 0.0,
      json['close'] ?? 0.0,
    );
    model.isLoad = true;
    return model;
  }
}