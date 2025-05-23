import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../core/store.dart';
import '../../cross/multiplatform/multiplatform.dart';
import '../../cross/multiplatform/platform.dart';
import '../../routes.dart';
import '../../services/appsload/appsload.service.dart';
import '/services/translator/translator.service.dart';
import 'start.dialog.dart';
import 'start.model.dart';
import 'start.provider.dart';

class StartController extends SimpleNotifier {
  final ValueNotifier<bool> isNet = ValueNotifier(false);
  final ValueNotifier<bool> isBackend = ValueNotifier(false);
  final ValueNotifier<bool> isGraph = ValueNotifier(false);

  Future<void> init(BuildContext context) async {
    final MyStore store = VxState.store as MyStore;

    final LocaleService localeService = store.localeService;
    final AppsLoadService appsLoadService = store.appsLoadService;

    final navigator = Navigator.of(context);

    Timer(const Duration(seconds: 1), () async {
      isNet.value = await _isInternet();
      if (isNet.value) {
        final RatesModel model = await getItem();
        DateTime parsedDate = DateTime.parse(model.datetime);
        DateTime serverTime = alignDateTime(parsedDate, const Duration(hours: 1));
        DateTime currentTime = alignDateTime(DateTime.now(), const Duration(hours: 1));
        debugPrint(serverTime.toString());
        debugPrint(currentTime.toString());
        await appsLoadService.writeLoadApp(localeService);
        if (serverTime == currentTime) {
          isBackend.value = true;
          store.navigator.routeManager.push(Uri.parse(Routes.home));
          // navigator.pushNamed(Routes.home);
          // Navigator.pushNamed(context, Routes.home);
        } else {
          StartProvider().updateRates().then((value) {
            isGraph.value = true;
            store.navigator.routeManager.push(Uri.parse(Routes.home));
            // navigator.pushNamed(Routes.home);
            // Navigator.pushNamed(context, Routes.home);
          });
        }
      } else {
        navigator.push<void>(PageRouteBuilder(
          pageBuilder: (_, __, ___) => const DialogScreen(dialog: NoConnectDialogShowcase()),
          opaque: false,
          fullscreenDialog: true,
        ));
      }
    });
  }

  Future<RatesModel> getItem() async {
    return await StartProvider().getItem();
  }

  Future<bool> _isInternet() async {
    final platform = getPlatform();
    // for Web - block
    if (platform == Platform.web) {
      return true;
    }
    //////////////////////////
    else {
      if (platform == Platform.android) {
        // for Android -block
        bool result = await InternetConnectionChecker().hasConnection;
        if (result == true) {
          debugPrint('YAY! Free cute dog pics!');
        } else {
          debugPrint('No internet :( Reason:');
          // print(InternetConnectionChecker().lastTryResults);
        }
        return result;
        // end block
      } else {
        //Desktop
        return true;
      }
    }
  }

  DateTime alignDateTime(DateTime dt, Duration alignment, [bool roundUp = false]) {
    assert(alignment >= Duration.zero);
    if (alignment == Duration.zero) return dt;
    final correction = Duration(
        days: 0,
        hours: alignment.inDays > 0
            ? dt.hour
            : alignment.inHours > 0
                ? dt.hour % alignment.inHours
                : 0,
        minutes: alignment.inHours > 0
            ? dt.minute
            : alignment.inMinutes > 0
                ? dt.minute % alignment.inMinutes
                : 0,
        seconds: alignment.inMinutes > 0
            ? dt.second
            : alignment.inSeconds > 0
                ? dt.second % alignment.inSeconds
                : 0,
        milliseconds: alignment.inSeconds > 0
            ? dt.millisecond
            : alignment.inMilliseconds > 0
                ? dt.millisecond % alignment.inMilliseconds
                : 0,
        microseconds: alignment.inMilliseconds > 0 ? dt.microsecond : 0);
    if (correction == Duration.zero) return dt;
    final corrected = dt.subtract(correction);
    final result = roundUp ? corrected.add(alignment) : corrected;
    return result;
  }
}
