import 'package:flutter/material.dart';
// import 'package:flutter_meedu/meedu.dart';
import 'currency.provider.dart';
import 'currency.model.dart';
import 'currency.util.trend.dart';

class CurrencyController extends ChangeNotifier {
// class CurrencyController extends SimpleNotifier {

  List<CurrencyModel> rates = [];

  @override
  void dispose() {    
    rates.clear();
    super.dispose();
  }

  Future<void> read() async {
    rates.clear();
    rates.addAll(await CurrencyProvider().getList());
    full();
    // notifyListeners();
  }

  String sEURUSD = "1.2000";
  late CurrencyTrend tEURUSD;
  String get eurusd {
    return sEURUSD;
  }

  set eurusd(String val) {
    sEURUSD = val;
  }

  String sGBPUSD = "1.3000";
  late CurrencyTrend tGBPUSD;
  String get gbpusd {
    return sGBPUSD;
  }

  set gbpusd(String val) {
    sGBPUSD = val;
  }

  String sUSDCHF = "1.0000";
  late CurrencyTrend tUSDCHF;
  String get usdchf {
    return sUSDCHF;
  }

  set usdchf(String val) {
    sUSDCHF = val;
  }

  String sUSDJPY = "1.0000";
  late CurrencyTrend tUSDJPY;
  String get usdjpy {
    return sUSDJPY;
  }

  set usdjpy(String val) {
    sUSDJPY = val;
  }

  String sEURGBP = "1.0000";
  late CurrencyTrend tEURGBP;
  String get eurgbp {
    return sEURGBP;
  }

  set eurgbp(String val) {
    sEURGBP = val;
  }

  String sEURCHF = "1.0000";
  late CurrencyTrend tEURCHF;
  String get eurchf {
    return sEURCHF;
  }

  set eurchf(String val) {
    sEURCHF = val;
  }

  String sEURJPY = "1.0000";
  late CurrencyTrend tEURJPY;
  String get eurjpy {
    return sEURJPY;
  }

  set eurjpy(String val) {
    sEURJPY = val;
  }

  String sGBPCHF = "1.0000";
  late CurrencyTrend tGBPCHF;
  String get gbpchf {
    return sGBPCHF;
  }

  set gbpchf(String val) {
    sGBPCHF = val;
  }

  String sGBPJPY = "1.0000";
  late CurrencyTrend tGBPJPY;
  String get gbpjpy {
    return sGBPJPY;
  }

  set gbpjpy(String val) {
    sGBPJPY = val;
  }

  String sCHFJPY = "1.0000";
  late CurrencyTrend tCHFJPY;
  String get chfjpy {
    return sCHFJPY;
  }

  set chfjpy(String val) {
    sCHFJPY = val;
  }

  String sUSDCAD = "1.0000";
  late CurrencyTrend tUSDCAD;
  String get usdcad {
    return sUSDCAD;
  }

  set usdcad(String val) {
    sUSDCAD = val;
  }

  String sEURCAD = "1.0000";
  late CurrencyTrend tEURCAD;
  String get eurcad {
    return sEURCAD;
  }

  set eurcad(String val) {
    sEURCAD = val;
  }

  String sAUDUSD = "1.0000";
  late CurrencyTrend tAUDUSD;
  String get audusd {
    return sAUDUSD;
  }

  set audusd(String val) {
    sAUDUSD = val;
  }

  String sAUDJPY = "1.0000";
  late CurrencyTrend tAUDJPY;
  String get audjpy {
    return sAUDJPY;
  }

  set audjpy(String val) {
    sAUDJPY = val;
  }

  String sNZDUSD = "1.0000";
  late CurrencyTrend tNZDUSD;
  String get nzdusd {
    return sNZDUSD;
  }

  set nzdusd(String val) {
    sNZDUSD = val;
  }

  String sNZDJPY = "1.0000";
  late CurrencyTrend tNZDJPY;
  String get nzdjpy {
    return sNZDJPY;
  }

  set nzdjpy(String val) {
    sNZDJPY = val;
  }

  String sEURAUD = "1.0000";
  late CurrencyTrend tEURAUD;
  String get euraud {
    return sEURAUD;
  }

  set euraud(String val) {
    sEURAUD = val;
  }

  String sEURNZD = "1.0000";
  late CurrencyTrend tEURNZD;
  String get eurnzd {
    return sEURNZD;
  }

  set eurnzd(String val) {
    sEURNZD = val;
  }

  String sGBPCAD = "1.0000";
  late CurrencyTrend tGBPCAD;
  String get gbpcad {
    return sGBPCAD;
  }

  set gbpcad(String val) {
    sGBPCAD = val;
  }

  String sGBPAUD = "1.0000";
  late CurrencyTrend tGBPAUD;
  String get gbpaud {
    return sGBPAUD;
  }

  set gbpaud(String val) {
    sGBPAUD = val;
  }

  String sGBPNZD = "1.0000";
  late CurrencyTrend tGBPNZD;
  String get gbpnzd {
    return sGBPNZD;
  }

  set gbpnzd(String val) {
    sGBPNZD = val;
  }

  String sAUDCHF = "1.0000";
  late CurrencyTrend tAUDCHF;
  String get audchf {
    return sAUDCHF;
  }

  set audchf(String val) {
    sAUDCHF = val;
  }

  String sAUDCAD = "1.0000";
  late CurrencyTrend tAUDCAD;
  String get audcad {
    return sAUDCAD;
  }

  set audcad(String val) {
    sAUDCAD = val;
  }

  String sAUDNZD = "1.0000";
  late CurrencyTrend tAUDNZD;
  String get audnzd {
    return sAUDNZD;
  }

  set audnzd(String val) {
    sAUDNZD = val;
  }

  String sNZDCHF = "1.0000";
  late CurrencyTrend tNZDCHF;
  String get nzdchf {
    return sNZDCHF;
  }

  set nzdchf(String val) {
    sNZDCHF = val;
  }

  String sNZDCAD = "1.0000";
  late CurrencyTrend tNZDCAD;
  String get nzdcad {
    return sNZDCAD;
  }

  set nzdcad(String val) {
    sNZDCAD = val;
  }

  String sCADCHF = "1.0000";
  late CurrencyTrend tCADCHF;
  String get cadchf {
    return sCADCHF;
  }

  set cadchf(String val) {
    sCADCHF = val;
  }

  String sCADJPY = "1.0000";
  late CurrencyTrend tCADJPY;
  String get cadjpy {
    return sCADJPY;
  }

  set cadjpy(String val) {
    sCADJPY = val;
  }

  String sUSDEUR = "1.0000";
  late CurrencyTrend tUSDEUR;
  String get usdeur {
    return sUSDEUR;
  }

  set usdeur(String val) {
    sUSDEUR = val;
  }

  String sUSDGBP = "1.0000";
  late CurrencyTrend tUSDGBP;
  String get usdgbp {
    return sUSDGBP;
  }

  set usdgbp(String val) {
    sUSDGBP = val;
  }

  String sUSDAUD = "1.0000";
  late CurrencyTrend tUSDAUD;
  String get usdaud {
    return sUSDAUD;
  }

  set usdaud(String val) {
    sUSDAUD = val;
  }

  String sUSDNZD = "1.0000";
  late CurrencyTrend tUSDNZD;
  String get usdnzd {
    return sUSDNZD;
  }

  set usdnzd(String val) {
    sUSDNZD = val;
  }

  String sGBPEUR = "1.0000";
  late CurrencyTrend tGBPEUR;
  String get gbpeur {
    return sGBPEUR;
  }

  set gbpeur(String val) {
    sGBPEUR = val;
  }

  String sJPYUSD = "1.0000";
  late CurrencyTrend tJPYUSD;
  String get jpyusd {
    return sJPYUSD;
  }

  set jpyusd(String val) {
    sJPYUSD = val;
  }

  String sJPYEUR = "1.0000";
  late CurrencyTrend tJPYEUR;
  String get jpyeur {
    return sJPYEUR;
  }

  set jpyeur(String val) {
    sJPYEUR = val;
  }

  String sJPYGBP = "1.0000";
  late CurrencyTrend tJPYGBP;
  String get jpygbp {
    return sJPYGBP;
  }

  set jpygbp(String val) {
    sJPYGBP = val;
  }

  String sJPYCHF = "1.0000";
  late CurrencyTrend tJPYCHF;
  String get jpychf {
    return sJPYCHF;
  }

  set jpychf(String val) {
    sJPYCHF = val;
  }

  String sJPYCAD = "1.0000";
  late CurrencyTrend tJPYCAD;
  String get jpycad {
    return sJPYCAD;
  }

  set jpycad(String val) {
    sJPYCAD = val;
  }

  String sJPYAUD = "1.0000";
  late CurrencyTrend tJPYAUD;
  String get jpyaud {
    return sJPYAUD;
  }

  set jpyaud(String val) {
    sJPYAUD = val;
  }

  String sJPYNZD = "1.0000";
  late CurrencyTrend tJPYNZD;
  String get jpynzd {
    return sJPYNZD;
  }

  set jpynzd(String val) {
    sJPYNZD = val;
  }

  String sCHFUSD = "1.0000";
  late CurrencyTrend tCHFUSD;
  String get chfusd {
    return sCHFUSD;
  }

  set chfusd(String val) {
    sCHFUSD = val;
  }

  String sCHFEUR = "1.0000";
  late CurrencyTrend tCHFEUR;
  String get chfeur {
    return sCHFEUR;
  }

  set chfeur(String val) {
    sCHFEUR = val;
  }

  String sCHFGBP = "1.0000";
  late CurrencyTrend tCHFGBP;
  String get chfgbp {
    return sCHFGBP;
  }

  set chfgbp(String val) {
    sCHFGBP = val;
  }

  String sCHFCAD = "1.0000";
  late CurrencyTrend tCHFCAD;
  String get chfcad {
    return sCHFCAD;
  }

  set chfcad(String val) {
    sCHFCAD = val;
  }

  String sCHFAUD = "1.0000";
  late CurrencyTrend tCHFAUD;
  String get chfaud {
    return sCHFAUD;
  }

  set chfaud(String val) {
    sCHFAUD = val;
  }

  String sCHFNZD = "1.0000";
  late CurrencyTrend tCHFNZD;
  String get chfnzd {
    return sCHFNZD;
  }

  set chfnzd(String val) {
    sCHFNZD = val;
  }

  String sCADUSD = "1.0000";
  late CurrencyTrend tCADUSD;
  String get cadusd {
    return sCADUSD;
  }

  set cadusd(String val) {
    sCADUSD = val;
  }

  String sCADEUR = "1.0000";
  late CurrencyTrend tCADEUR;
  String get cadeur {
    return sCADEUR;
  }

  set cadeur(String val) {
    sCADEUR = val;
  }

  String sCADGBP = "1.0000";
  late CurrencyTrend tCADGBP;
  String get cadgbp {
    return sCADGBP;
  }

  set cadgbp(String val) {
    sCADGBP = val;
  }

  String sCADAUD = "1.0000";
  late CurrencyTrend tCADAUD;
  String get cadaud {
    return sCADAUD;
  }

  set cadaud(String val) {
    sCADAUD = val;
  }

  String sCADNZD = "1.0000";
  late CurrencyTrend tCADNZD;
  String get cadnzd {
    return sCADNZD;
  }

  set cadnzd(String val) {
    sCADNZD = val;
  }

  String sAUDEUR = "1.0000";
  late CurrencyTrend tAUDEUR;
  String get audeur {
    return sAUDEUR;
  }

  set audeur(String val) {
    sAUDEUR = val;
  }

  String sAUDGBP = "1.0000";
  late CurrencyTrend tAUDGBP;
  String get audgbp {
    return sAUDGBP;
  }

  set audgbp(String val) {
    sAUDGBP = val;
  }

  String sNZDEUR = "1.0000";
  late CurrencyTrend tNZDEUR;
  String get nzdeur {
    return sNZDEUR;
  }

  set nzdeur(String val) {
    sNZDEUR = val;
  }

  String sNZDGBP = "1.0000";
  late CurrencyTrend tNZDGBP;
  String get nzdgbp {
    return sNZDGBP;
  }

  set nzdgbp(String val) {
    sNZDGBP = val;
  }

  String sNZDAUD = "1.0000";
  late CurrencyTrend tNZDAUD;
  String get nzdaud {
    return sNZDAUD;
  }

  set nzdaud(String val) {
    sNZDAUD = val;
  }

  String sDateTime = "06/02/2022";
  String get datetime {
    return sDateTime;
  }

  set datetime(String val) {
    sDateTime = val;
  }

  String sDate = "";
  String get date {
    return sDate;
  }

  set date(String val) {
    sDate = val;
  }

  String sHour = "";
  String get hour {
    return sHour;
  }

  set hour(String val) {
    sHour = val;
  }

  String sMin = "";
  String get min {
    return sMin;
  }

  set min(String val) {
    sMin = val;
  }

  String sGMT = "";
  String get gmt {
    return sGMT;
  }

  set gmt(String val) {
    sGMT = val;
  }
//---------------------------------

  CurrencyTrend _getTrend(String nameQuotes, List<CurrencyModel> list) {
    for (int i = 0; i < list.length; i++) {
      if (list[i].quotes == nameQuotes) {
        return CurrencyTrend(list[i].quotes, list[i].open, list[i].close);
      }
    }
    return CurrencyTrend("EUR/USD", 1.0000, 1.0000);
  }

  // full(List<CurrencyModel> rates) {
  full() {
    tUSDEUR = _getTrend("USD/EUR", rates);
    tUSDGBP = _getTrend("USD/GBP", rates);
    tUSDJPY = _getTrend("USD/JPY", rates);
    tUSDCHF = _getTrend("USD/CHF", rates);
    tUSDCAD = _getTrend("USD/CAD", rates);
    tUSDAUD = _getTrend("USD/AUD", rates);
    tUSDNZD = _getTrend("USD/NZD", rates);

    tEURUSD = _getTrend("EUR/USD", rates);
    tEURGBP = _getTrend("EUR/GBP", rates);
    tEURJPY = _getTrend("EUR/JPY", rates);
    tEURCHF = _getTrend("EUR/CHF", rates);
    tEURCAD = _getTrend("EUR/CAD", rates);
    tEURAUD = _getTrend("EUR/AUD", rates);
    tEURNZD = _getTrend("EUR/NZD", rates);

    tGBPUSD = _getTrend("GBP/USD", rates);
    tGBPEUR = _getTrend("GBP/EUR", rates);
    tGBPJPY = _getTrend("GBP/JPY", rates);
    tGBPCHF = _getTrend("GBP/CHF", rates);
    tGBPCAD = _getTrend("GBP/CAD", rates);
    tGBPAUD = _getTrend("GBP/AUD", rates);
    tGBPNZD = _getTrend("GBP/NZD", rates);

    tJPYUSD = _getTrend("JPY/USD", rates);
    tJPYEUR = _getTrend("JPY/EUR", rates);
    tJPYGBP = _getTrend("JPY/GBP", rates);
    tJPYCHF = _getTrend("JPY/CHF", rates);
    tJPYCAD = _getTrend("JPY/CAD", rates);
    tJPYAUD = _getTrend("JPY/AUD", rates);
    tJPYNZD = _getTrend("JPY/NZD", rates);

    tCHFUSD = _getTrend("CHF/USD", rates);
    tCHFEUR = _getTrend("CHF/EUR", rates);
    tCHFGBP = _getTrend("CHF/GBP", rates);
    tCHFJPY = _getTrend("CHF/JPY", rates);
    tCHFCAD = _getTrend("CHF/CAD", rates);
    tCHFAUD = _getTrend("CHF/AUD", rates);
    tCHFNZD = _getTrend("CHF/NZD", rates);

    tCADUSD = _getTrend("CAD/USD", rates);
    tCADEUR = _getTrend("CAD/EUR", rates);
    tCADGBP = _getTrend("CAD/GBP", rates);
    tCADJPY = _getTrend("CAD/JPY", rates);
    tCADCHF = _getTrend("CAD/CHF", rates);
    tCADAUD = _getTrend("CAD/AUD", rates);
    tCADNZD = _getTrend("CAD/NZD", rates);

    tAUDUSD = _getTrend("AUD/USD", rates);
    tAUDEUR = _getTrend("AUD/EUR", rates);
    tAUDGBP = _getTrend("AUD/GBP", rates);
    tAUDJPY = _getTrend("AUD/JPY", rates);
    tAUDCHF = _getTrend("AUD/CHF", rates);
    tAUDCAD = _getTrend("AUD/CAD", rates);
    tAUDNZD = _getTrend("AUD/NZD", rates);

    tNZDUSD = _getTrend("NZD/USD", rates);
    tNZDEUR = _getTrend("NZD/EUR", rates);
    tNZDGBP = _getTrend("NZD/GBP", rates);
    tNZDJPY = _getTrend("NZD/JPY", rates);
    tNZDCHF = _getTrend("NZD/CHF", rates);
    tNZDCAD = _getTrend("NZD/CAD", rates);
    tNZDAUD = _getTrend("NZD/AUD", rates);

    eurusd = tEURUSD.dC.toString();
    gbpusd = tGBPUSD.dC.toString();
    usdchf = tUSDCHF.dC.toString();
    usdjpy = tUSDJPY.dC.toString();
    eurgbp = tEURGBP.dC.toString();
    eurchf = tEURCHF.dC.toString();
    eurjpy = tEURJPY.dC.toString();
    gbpchf = tGBPCHF.dC.toString();
    gbpjpy = tGBPJPY.dC.toString();
    chfjpy = tCHFJPY.dC.toString();
    usdcad = tUSDCAD.dC.toString();
    eurcad = tEURCAD.dC.toString();
    audusd = tAUDUSD.dC.toString();
    audjpy = tAUDJPY.dC.toString();
    nzdusd = tNZDUSD.dC.toString();
    nzdjpy = tNZDJPY.dC.toString();
    euraud = tEURAUD.dC.toString();
    eurnzd = tEURNZD.dC.toString();
    gbpcad = tGBPCAD.dC.toString();
    gbpaud = tGBPAUD.dC.toString();
    gbpnzd = tGBPNZD.dC.toString();
    audchf = tAUDCHF.dC.toString();
    audcad = tAUDCAD.dC.toString();
    audnzd = tAUDNZD.dC.toString();
    nzdchf = tNZDCHF.dC.toString();
    nzdcad = tNZDCAD.dC.toString();
    cadchf = tCADCHF.dC.toString();
    cadjpy = tCADJPY.dC.toString();

    datetime = rates[0].datetime;
    date = rates[0].datetime.substring(0, 10);
    hour = rates[0].datetime.substring(11, 13);
    min = rates[0].datetime.substring(14, 16);
    gmt = "GMT";

    usdeur = tUSDEUR.dC.toString();
    usdgbp = tUSDGBP.dC.toString();
    usdaud = tUSDAUD.dC.toString();
    usdnzd = tUSDNZD.dC.toString();

    gbpeur = tGBPEUR.dC.toString();

    jpyusd = tJPYUSD.dC.toString();
    jpyeur = tJPYEUR.dC.toString();
    jpygbp = tJPYGBP.dC.toString();
    jpychf = tJPYCHF.dC.toString();
    jpycad = tJPYCAD.dC.toString();
    jpyaud = tJPYAUD.dC.toString();
    jpynzd = tJPYNZD.dC.toString();

    chfusd = tCHFUSD.dC.toString(); //tUSDCHF.dC.toString();
    chfeur = tCHFEUR.dC.toString(); //tEURCHF.dC.toString();
    chfgbp = tCHFGBP.dC.toString(); //tGBPCHF.dC.toString();
    chfcad = tCHFCAD.dC.toString(); //tCADCHF.dC.toString();
    chfaud = tCHFAUD.dC.toString(); //tAUDCHF.dC.toString();
    chfnzd = tCHFNZD.dC.toString(); //tNZDCHF.dC.toString();

    cadusd = tCADUSD.dC.toString(); //tUSDCAD.dC.toString();
    cadeur = tCADEUR.dC.toString(); //tEURCAD.dC.toString();
    cadgbp = tCADGBP.dC.toString(); //tGBPCAD.dC.toString();
    cadaud = tCADAUD.dC.toString(); //tAUDCAD.dC.toString();
    cadnzd = tCADNZD.dC.toString(); //tNZDCAD.dC.toString();

    audeur = tAUDEUR.dC.toString(); //tEURAUD.dC.toString();
    audgbp = tAUDGBP.dC.toString(); //tGBPAUD.dC.toString();

    nzdeur = tNZDEUR.dC.toString(); //tEURNZD.dC.toString();
    nzdgbp = tNZDGBP.dC.toString(); //tGBPNZD.dC.toString();
    nzdaud = tNZDAUD.dC.toString(); //tAUDNZD.c;
  }
}
