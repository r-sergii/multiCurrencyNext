abstract class RatesFields {
  static const quotes = 'quotes';
  static const datetime = 'datetime';
  static const close = 'close';
}

class RatesModel {
  bool isLoad = false;
  String quotes;
  String datetime;
  double close;

  RatesModel(
    this.quotes,
    this.datetime,
    this.close,
  );

  factory RatesModel.empty() {
    var model = RatesModel('', '', 0.0);
    model.isLoad = false;
    return model;
  }

  factory RatesModel.fromJson(dynamic json) {
    print(json);
    var model = RatesModel(
      json[RatesFields.quotes] ?? '',
      json[RatesFields.datetime] ?? '',
      json[RatesFields.close] ?? 0.0,
    );
    model.isLoad = true;
    return model;
  }
}
