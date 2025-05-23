import 'dart:core';

class CurrencyTrend {
  final String t;
  final double dO;
  final double dC;

  CurrencyTrend(this.t, this.dO, this.dC);
  
  double open() {
    return dC;
  }

  double close() {
    return dC;
  }

  String ticker() {
    return t;
  }

  int trend() {
    // double dO = double.parse(o);
    // double dC = double.parse(c);
    if (dC > dO) {
      return 1;
    } else if (dC < dO) {
      return -1;
    } else {
      return 0;
    }
  }
}
