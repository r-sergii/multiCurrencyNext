import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
// import 'package:flutter_meedu/ui.dart';
// import 'package:flutter_meedu/meedu.dart';
import '../../cross/multiplatform/multiplatform.dart';
import '../../cross/multiplatform/platform.dart';
import '../../routes.dart';
import '/screens/currency/currency.util.trend.dart';
// import '/screens/currency/currency.controller.dart';
import 'currency.dialog.dart';
import 'currency.ui.controller.dart';
import '/core/store.dart';
import '/services/translator/translator.controller.dart';
import './top.tile.widget.dart';

const widthSetting = 550; // 850; //830;
const widthAbout = 630; // 930; //910;

// final currencyProvider = SimpleProvider<CurrencyController>(
//   (ref) {
//     /// YOUR CODE HERE
//     return CurrencyController();
//   },
// );

class CurrencyPage extends StatelessWidget {
  static const String route = '/currency';
  const CurrencyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [CurrentCurrency]);
    VxState.watch(context, on: [CurrentIndex]);

    final theme = Theme.of(context);
    var screenSize = MediaQuery.of(context).size;
    final MyStore store = VxState.store as MyStore;
    final TranslatorController translator = store.translatorController;
    final CurrencyUIController controller = store.currencyUiController;
    // final CurrencyController controllerRates = store.currencyController;
    Platform platform = getPlatform();

    final bottomBar = Column(children: [
      SizedBox(
        height: 168, //170,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: Column(children: [
            // AppBar(
            //   backgroundColor: theme.backgroundColor,
            //   title: Text(
            //     translator.currency,
            //     style: TextStyle(color: theme.primaryColor),
            //   ),
            //   elevation: 0.0,
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    // child: Text(
                    //   translator.currency,
                    //   style: TextStyle(color: theme.primaryColor, fontSize: 20.0),
                    // ),
                    child: Row(
                      children: [
                        Image.asset('images/icon.png', height: 60, width: 60),
                        const SizedBox(width: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              // translator.currency,
                              "multiCurrencyNext",
                              style: TextStyle(color: theme.primaryColor, fontSize: 10.0),
                            ),
                            Text(
                              // controller.tickers[controller.currentCurrency],
                              controller.currentCurrency,
                              style: TextStyle(color: theme.primaryColor, fontSize: 32.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: screenSize.width / 40),
                  if (screenSize.width > widthSetting)
                    TopTileWidget(
                      leading: Icons.settings,
                      title: translator.settings,
                      onTap: () {
                        // Navigator.pushNamed(context, Routes.settings);
                        store.navigator.routeManager.push(Uri.parse(Routes.settings));
                      },
                      // controller: controller.isHoveringSettings,
                    ),
                  SizedBox(width: screenSize.width / 20),
                  if (screenSize.width > widthAbout)
                    TopTileWidget(
                      leading: Icons.info,
                      title: translator.about,
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const CurrencyAboutDialog();
                            });
                      },
                      // controller: controller.isHoveringAbout,
                    ),
                  SizedBox(width: screenSize.width / 20),
                  // Switch(value: true, onChanged: (value) {}),
                  if (screenSize.width < widthSetting)
                    IconButton(
                      icon: Icon(
                        Icons.settings,
                        color: theme.primaryColor,
                      ),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      color: Colors.white,
                      onPressed: () {
                        store.navigator.routeManager.push(Uri.parse(Routes.settings));
                      },
                    ),
                  if (screenSize.width < widthAbout)
                    IconButton(
                      icon: Icon(
                        Icons.info,
                        color: theme.primaryColor,
                      ),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      color: Colors.white,
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const CurrencyAboutDialog();
                            });
                      },
                    ),
                  (platform == Platform.android)
                      ? IconButton(
                          icon: Icon(
                            Icons.exit_to_app,
                            color: theme.primaryColor,
                          ),
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          color: Colors.white,
                          onPressed: () {
                            SystemNavigator.pop();
                          },
                        )
                      : const SizedBox.shrink(),
                  SizedBox(width: screenSize.width / 40),
                ],
              ),
            ),
            // const Divider(
            //   color: Colors.black45,
            // ),
            SizedBox(
              height: 96,
              width: screenSize.width,
              child: ListView.builder(
                shrinkWrap: true,
                // primary: true,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: controller.icons.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                      onTap: () {
                        // CurrentCurrency(controller.currentCurrency);
                        CurrentCurrency(controller.tickers[index]);
                        CurrentIndex(index);
                      },
                      child: controller.icons[index]);
                },
              ),
            ),
          ]),
        ),
      )
    ]);

    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: theme.primaryTextTheme.headline2!.color,
        //   title: Text(translator.currency),
        // ),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(170.0), //170.0
          child: bottomBar,
        ),

        // body: ListView.builder(
        //   shrinkWrap: true,
        //   // primary: true,
        //   physics: const ClampingScrollPhysics(),
        //   scrollDirection: Axis.vertical,
        //   itemCount: controller.icons.length,
        //   itemBuilder: (BuildContext context, int index) {
        //     // return InkWell(
        //     //     onTap: () {
        //     //       CurrentCurrency(controller.currentCurrency);
        //     //     },
        //     //     child: controller.icons[index]);
        //     return CurrencyTickerWidget(
        //       baseCurrencyImage: controller.icons[controller.currentIndex],
        //       quotedCurrencyImage: controller.icons[index],
        //       baseCurrencyTicker: controller.tickers[controller.currentIndex],
        //       quotedCurrencyTicker: controller.tickers[index],
        //       nowPrice: 1.0001,
        //       prevPrice: 1.0001,
        //     );
        //   },
        // ),
        // body: Consumer(builder: (_, ref, __) {
        //   final controllerRates = ref.watch(currencyProvider);
        //   return FutureBuilder<void>(
        body: FutureBuilder<void>(
          // future: controllerRates.read(), //'mclocklite'),
          future: controller.fullRates(), //'mclocklite'),
          builder: (
            BuildContext context,
            AsyncSnapshot<void> snapshot,
          ) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                // return Text(controller.rates.length.toString());
                return ListView.builder(
                  shrinkWrap: true,
                  // primary: true,
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: controller.rates.length,
                  itemBuilder: (BuildContext context, int index) {
                    // return InkWell(
                    //     onTap: () {
                    //       CurrentCurrency(controller.currentCurrency);
                    //     },
                    //     child: controller.icons[index]);
                    return CurrencyTickerWidget(
                      baseCurrencyImage: controller.icons[controller.currentIndex],
                      quotedCurrencyImage: controller.iconsVar[index],
                      baseCurrencyTicker: controller.tickers[controller.currentIndex],
                      quotedCurrencyTicker: controller.tickersVar[index],
                      nowPrice: controller.rates[index].close,
                      prevPrice: controller.rates[index].open,
                      time: controller.rates[index].datetime,
                    );
                  },
                );
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              default:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(bottom: 16),
                        alignment: Alignment.center,
                        child: const Text(
                          'No access to the Internet. Make thr connection and try again.',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                );
            }
          },
        ),
        // }),
      ),
    );
  }
}

class CurrencyTickerWidget extends StatelessWidget {
  final Widget baseCurrencyImage;
  final Widget quotedCurrencyImage;
  final String baseCurrencyTicker;
  final String quotedCurrencyTicker;
  final double nowPrice;
  final double prevPrice;
  final String time;
  const CurrencyTickerWidget(
      {Key? key,
      required this.baseCurrencyImage,
      required this.quotedCurrencyImage,
      required this.baseCurrencyTicker,
      required this.quotedCurrencyTicker,
      required this.prevPrice,
      required this.nowPrice,
      required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // if (baseCurrencyTicker == quotedCurrencyTicker) {
    //   return const SizedBox(
    //     width: 0,
    //     height: 0,
    //   );
    // } else {
    return GestureDetector(
      onTap: () {
        // Get.offAllNamed('${Routes.chart}/${killDivider(trend.t)}');
        final MyStore store = VxState.store as MyStore;
        // store.navigator.routeManager.push(Uri.parse('${Routes.chart}/$baseCurrencyTicker$quotedCurrencyTicker'));
        store.navigator.routeManager.push(
            Uri(path: '${Routes.chart}', queryParameters: {'ticker': '$baseCurrencyTicker$quotedCurrencyTicker'}),
            params: '$baseCurrencyTicker$quotedCurrencyTicker');
        // final navigator = Navigator.of(context);
        // navigator.pushNamed(Routes.chart, arguments: '${baseCurrencyTicker}${quotedCurrencyTicker}');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Row(
          children: [
            Column(
              children: [
                Row(
                  children: [baseCurrencyImage, quotedCurrencyImage],
                ),
                Row(
                  children: [
                    Text(baseCurrencyTicker, style: TextStyle(color: theme.indicatorColor, fontSize: 20)),
                    Text(" / ", style: TextStyle(color: theme.indicatorColor, fontSize: 20)),
                    Text(quotedCurrencyTicker, style: TextStyle(color: theme.indicatorColor, fontSize: 20))
                  ],
                )
              ],
            ),
            Column(children: [
              Row(
                children: [
                  Text(
                    nowPrice.toStringAsFixed(quotedCurrencyTicker == "JPY" ? 2 : 4),
                    style: TextStyle(color: theme.primaryColor, fontSize: 30),
                  ),
                  const SizedBox(width: 10),
                  _getTrend(context, CurrencyTrend(baseCurrencyTicker, prevPrice, nowPrice))
                  // const Icon(
                  //   Icons.arrow_upward,
                  //   color: Colors.amber,
                  // ),
                ],
              ),
              Text("${time.substring(11, 16)} GMT", style: TextStyle(color: theme.indicatorColor, fontSize: 20))
            ])
          ],
        ),
      ),
    );
    // }
  }

  Widget _getTrend(BuildContext context, CurrencyTrend candle) {
    if (candle.trend() > 0) {
      return const Icon(
        Icons.arrow_upward,
        color: Colors.green,
        size: 20.0,
      );
    } else if (candle.trend() < 0) {
      return const Icon(
        Icons.arrow_downward,
        color: Colors.red,
        size: 20.0,
      );
    } else {
      return const Icon(
        Icons.sync_alt,
        color: Colors.blue,
        size: 20.0,
      );
    }
  }
}
