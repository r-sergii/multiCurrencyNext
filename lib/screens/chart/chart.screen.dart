import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../core/store.dart';
import '/routes.dart';
import '/k_chart/chart_style.dart';
import '/k_chart/chart_translations.dart';
import '/k_chart/flutter_k_chart.dart';
import '/k_chart/k_chart_widget.dart';

// import 'package:http/http.dart' as http;
import 'package:flutter_svg/flutter_svg.dart';
//import '../service/candle_service.dart';
//import '../service/candles.dart';
import 'chart.provider.dart';
import 'chart.type.dart';

class ThemeColors extends ChartColors {
  ThemeColors(BuildContext context) {
    final theme = Theme.of(context);
    bgColor = [theme.backgroundColor, theme.backgroundColor];
    lineFillInsideColor = theme.backgroundColor;

    defaultTextColor = theme.primaryColor;
    nowPriceTextColor = theme.primaryColor;
    volColor = theme.secondaryHeaderColor;
    macdColor = theme.secondaryHeaderColor;

    selectFillColor = theme.primaryColor;
    gridColor = theme.cardColor;

    infoWindowNormalColor = theme.primaryColor;
    infoWindowTitleColor = theme.primaryColor;

    hCrossColor = theme.primaryColor;
    vCrossColor = theme.primaryColor;
    crossTextColor = theme.primaryColor;

    maxColor = theme.primaryColor;
    minColor = theme.primaryColor;
  }
}

class ChartScreen extends StatefulWidget {
  static const String route = '/chart';

  const ChartScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  ChartScreenState createState() => ChartScreenState();
}

class ChartScreenState extends State<ChartScreen> {
  List<KLineEntity>? datas;
  bool showLoading = true;
  MainState _mainState = MainState.MA;
  bool _volHidden = true; //false;
  SecondaryState _secondaryState = SecondaryState.MACD;
  // bool isLine = false; //true;
  Bar isLine = Bar.line;
  bool isChinese = true;
  bool _hideGrid = false;
  bool _showNowPrice = true;
  // List<DepthEntity>? _bids, _asks;
  bool isChangeUI = false;
  bool _isTrendLine = false;
  bool _priceLeft = true;

  VerticalTextAlignment _verticalTextAlignment = VerticalTextAlignment.left;
  ChartStyle chartStyle = ChartStyle();
  ChartColors chartColors = ChartColors();

  String titlePeriod = "D1";

  @override
  void initState() {
    super.initState();
    getData(periodType.d1);
  }

  final ReadChartData readChartData = ReadChartData();

  void getData(periodType period) {
    showLoading = true;
    final Future<String> future = readChartData.getChartData(widget.title, period);
    future.then((String result) {
      _solveChatData(result);
    }).catchError((_) {
      showLoading = false;
      setState(() {});
      print('### datas error $_');
    });
  }

  void _solveChatData(String result) {
    final Map parseJson = json.decode(result) as Map<dynamic, dynamic>;
    final list = parseJson['data'] as List<dynamic>;
    datas = list
        .map((item) => KLineEntity.fromJson(item as Map<String, dynamic>))
        .toList()
        .reversed
        .toList()
        .cast<KLineEntity>();
    DataUtil.calculate(datas!);
    showLoading = false;
    setState(() {});
  }

  // Future<List<Candle>> fetchCandles(String ticker) async {
  //   final uri = Uri.parse("http://localhost:5000/read_mn?ticker=" + ticker);
  //   final res = await http.get(uri);
  //   return (jsonDecode(res.body) as List<dynamic>)
  //       .map((e) => Candle.fromJson(e))
  //       .toList()
  //       .reversed
  //       .toList();
  // }

  // Future<List<Candle>> fetchCandlesW1(String ticker) async {
  //   final uri = Uri.parse("http://localhost:5000/read_w1?ticker=" + ticker);
  //   final res = await http.get(uri);
  //   return (jsonDecode(res.body) as List<dynamic>)
  //       .map((e) => Candle.fromJson(e))
  //       .toList()
  //       .reversed
  //       .toList();
  // }

  // Future<List<Candle>> fetchCandlesD1(String ticker) async {
  //   final uri = Uri.parse("http://localhost:5000/read_d1?ticker=" + ticker);
  //   final res = await http.get(uri);
  //   return (jsonDecode(res.body) as List<dynamic>)
  //       .map((e) => Candle.fromJson(e))
  //       .toList()
  //       .reversed
  //       .toList();
  // }

  @override
  Widget build(BuildContext context) {
    print(widget.title);
    final theme = Theme.of(context);
    final MyStore store = VxState.store as MyStore;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.backgroundColor,
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.back,
            color: theme.primaryColor,
          ), //Colors.blue),
          onPressed: () {
            // final navigator = Navigator.of(context);
            // navigator.pushNamed(Routes.home);
            // // Get.offAllNamed(Routes.currency);
            store.navigator.routeManager.push(Uri.parse(Routes.home));
          },
        ),
        title: Text('${widget.title} : ${titlePeriod}',
            style: TextStyle(color: theme.primaryColor, fontWeight: FontWeight.w700)),
        elevation: 0.0,
        actions: [
          PopupMenuButton(
            color: theme.dialogBackgroundColor,
            icon: Icon(
              Icons.candlestick_chart_outlined,
              color: theme.primaryColor,
            ),
            // SvgPicture.asset("images/stats-chart-outline.svg", color: theme.primaryColor, semanticsLabel: 'Chart'),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 0,
                child: IconButton(
                  icon: SvgPicture.asset("images/analytics-outline.svg", color: Colors.red, semanticsLabel: 'OHLC'),
                  onPressed: () {
                    setState(() {
                      isLine = Bar.line;
                    });
                  },
                ),
              ),
              PopupMenuItem(
                value: 1,
                child: Icon(
                  Icons.candlestick_chart_outlined,
                  color: theme.primaryColor,
                ),
              ),
              PopupMenuItem(
                value: 2,
                child: IconButton(
                  icon: SvgPicture.asset("images/ohlc.svg", color: theme.primaryColor, semanticsLabel: 'OHLC'),
                  onPressed: () {
                    setState(() {
                      isLine = Bar.ohlc;
                    });
                  },
                ),
              ),
              PopupMenuItem(
                value: 3,
                child: IconButton(
                  icon: SvgPicture.asset("images/stats-chart-outline.svg",
                      color: theme.primaryColor, semanticsLabel: 'HiLo'),
                  onPressed: () {
                    setState(() {
                      isLine = Bar.hilo;
                    });
                  },
                ),
              ),
            ],
            onSelected: (result) {
              switch (result) {
                case 0:
                  setState(() {
                    isLine = Bar.line;
                  });
                  break;
                case 1:
                  setState(() {
                    isLine = Bar.candle;
                  });
                  break;
                case 2:
                  setState(() {
                    isLine = Bar.ohlc;
                  });
                  break;
                case 3:
                  setState(() {
                    isLine = Bar.hilo;
                  });
                  break;
              }
            },
          ),
          PopupMenuButton(
            color: theme.dialogBackgroundColor,
            icon: SvgPicture.asset("images/analytics-outline.svg",
                color: theme.primaryColor, semanticsLabel: 'Trend'),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 1,
                child: Icon(
                  Icons.close,
                  color: Colors.red,
                ),
              ),
              PopupMenuItem(
                value: 2,
                child: Text('MA', style: TextStyle(color: theme.primaryColor, fontWeight: FontWeight.w700)),
              ),
              PopupMenuItem(
                value: 3,
                child: Text('BOLL', style: TextStyle(color: theme.primaryColor, fontWeight: FontWeight.w700)),
              ),
            ],
            onSelected: (result) {
              switch (result) {
                case 1:
                  setState(() {
                    _mainState = MainState.NONE;
                  });
                  break;
                case 2:
                  setState(() {
                    _mainState = MainState.MA;
                  });
                  break;
                case 3:
                  setState(() {
                    _mainState = MainState.BOLL;
                  });
                  break;
              }
            },
          ),
          PopupMenuButton(
            color: theme.dialogBackgroundColor,
            icon: SvgPicture.asset("images/pulse-outline.svg",
                color: theme.primaryColor, semanticsLabel: 'Oscilator'),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 1,
                child: Icon(
                  Icons.close,
                  color: Colors.red,
                ),
              ),
              PopupMenuItem(
                value: 2,
                child: Text('RSI', style: TextStyle(color: theme.primaryColor, fontWeight: FontWeight.w700)),
              ),
              PopupMenuItem(
                value: 3,
                child: Text('KDJ', style: TextStyle(color: theme.primaryColor, fontWeight: FontWeight.w700)),
              ),
              PopupMenuItem(
                value: 4,
                child: Text('MACD', style: TextStyle(color: theme.primaryColor, fontWeight: FontWeight.w700)),
              ),
              PopupMenuItem(
                value: 5,
                child: Text('CCI', style: TextStyle(color: theme.primaryColor, fontWeight: FontWeight.w700)),
              ),
              PopupMenuItem(
                value: 6,
                child: Text('WR', style: TextStyle(color: theme.primaryColor, fontWeight: FontWeight.w700)),
              ),
            ],
            onSelected: (result) {
              switch (result) {
                case 1:
                  setState(() {
                    _secondaryState = SecondaryState.NONE;
                  });
                  break;
                case 2:
                  setState(() {
                    _secondaryState = SecondaryState.RSI;
                  });
                  break;
                case 3:
                  setState(() {
                    _secondaryState = SecondaryState.KDJ;
                  });
                  break;
                case 4:
                  setState(() {
                    _secondaryState = SecondaryState.MACD;
                  });
                  break;
                case 5:
                  setState(() {
                    _secondaryState = SecondaryState.CCI;
                  });
                  break;
                case 6:
                  setState(() {
                    _secondaryState = SecondaryState.WR;
                  });
                  break;
              }
            },
          ),
          PopupMenuButton(
              color: theme.dialogBackgroundColor,
              icon: Icon(
                Icons.more_time,
                color: theme.primaryColor,
              ),
              itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 1,
                      child: Text("H1", style: TextStyle(color: theme.primaryColor, fontWeight: FontWeight.w700)),
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: Text("H4", style: TextStyle(color: theme.primaryColor, fontWeight: FontWeight.w700)),
                    ),
                    PopupMenuItem(
                      value: 3,
                      child: Text("D1", style: TextStyle(color: theme.primaryColor, fontWeight: FontWeight.w700)),
                    ),
                    PopupMenuItem(
                      value: 4,
                      child: Text("W1", style: TextStyle(color: theme.primaryColor, fontWeight: FontWeight.w700)),
                    ),
                    PopupMenuItem(
                      value: 5,
                      child: Text("MN", style: TextStyle(color: theme.primaryColor, fontWeight: FontWeight.w700)),
                    ),
                  ],
              onSelected: (result) async {
                switch (result) {
                  case 1:
                    titlePeriod = "H1";
                    setState(() {
                      getData(periodType.h1);
                    });
                    break;
                  case 2:
                    titlePeriod = "H4";
                    setState(() {
                      getData(periodType.h4);
                    });
                    break;
                  case 3:
                    titlePeriod = "D1";
                    setState(() {
                      getData(periodType.d1);
                    });
                    break;
                  case 4:
                    titlePeriod = "W1";
                    setState(() {
                      getData(periodType.w1);
                    });
                    break;
                  case 5:
                    titlePeriod = "MN";
                    setState(() {
                      getData(periodType.mn);
                    });
                    break;
                }
              }),
          PopupMenuButton(
              color: theme.dialogBackgroundColor,
              icon: Icon(
                Icons.settings,
                color: theme.primaryColor,
              ),
              itemBuilder: (context) => [
                    CheckedPopupMenuItem(
                      checked: !_hideGrid,
                      value: 0,
                      child: Text("GRID", style: TextStyle(color: theme.primaryColor, fontWeight: FontWeight.w700)),
                    ),
                    CheckedPopupMenuItem(
                      checked: _showNowPrice,
                      value: 1,
                      child: Text("NOW", style: TextStyle(color: theme.primaryColor, fontWeight: FontWeight.w700)),
                    ),
                    CheckedPopupMenuItem(
                      checked: _priceLeft,
                      value: 2,
                      child: Text("PRICE", style: TextStyle(color: theme.primaryColor, fontWeight: FontWeight.w700)),
                    ),
                  ],
              onSelected: (result) async {
                switch (result) {
                  case 0:
                    setState(() {
                      _hideGrid = !_hideGrid;
                    });
                    break;
                  case 1:
                    setState(() {
                      _showNowPrice = !_showNowPrice;
                    });
                    break;
                  case 2:
                    setState(() {
                      _priceLeft = !_priceLeft;
                      if (_priceLeft) {
                        _verticalTextAlignment = VerticalTextAlignment.left;
                      } else {
                        _verticalTextAlignment = VerticalTextAlignment.right;
                      }
                    });
                    break;
                  default:
                    break;
                }
              })
        ],
      ),
      body: _bodyChart(showLoading),
      // body: Center(
      //         child: KChartWidget(
      //           datas,
      //           chartStyle,
      //           ThemeColors(context), //chartColors,
      //           isLine: isLine,
      //           onSecondaryTap: () {
      //             print('Secondary Tap');
      //           },
      //           isTrendLine: _isTrendLine,
      //           mainState: _mainState,
      //           volHidden: _volHidden,
      //           secondaryState: _secondaryState,
      //           fixedLength: 2,
      //           timeFormat: TimeFormat.YEAR_MONTH_DAY,
      //           translations: kChartTranslations,
      //           showNowPrice: _showNowPrice,
      //           //`isChinese` is Deprecated, Use `translations` instead.
      //           isChinese: isChinese,
      //           hideGrid: _hideGrid,
      //           isTapShowInfoDialog: false,
      //           verticalTextAlignment: _verticalTextAlignment,
      //           maDayList: [1, 100, 1000],
      //         ),
      //      ),
    );
  }

  _bodyChart(bool showLoading) {
    if (showLoading == true) {
      return const Center(child: CircularProgressIndicator());
    }
    return Center(
      child: KChartWidget(
        datas,
        chartStyle,
        ThemeColors(context), //chartColors,
        isLine: isLine,
        onSecondaryTap: () {
          print('Secondary Tap');
        },
        isTrendLine: _isTrendLine,
        mainState: _mainState,
        volHidden: _volHidden,
        secondaryState: _secondaryState,
        fixedLength: 2,
        timeFormat: TimeFormat.YEAR_MONTH_DAY,
        translations: kChartTranslations,
        showNowPrice: _showNowPrice,
        //`isChinese` is Deprecated, Use `translations` instead.
        isChinese: isChinese,
        hideGrid: _hideGrid,
        isTapShowInfoDialog: false,
        verticalTextAlignment: _verticalTextAlignment,
        maDayList: [1, 100, 1000],
      ),
    );
  }
}
