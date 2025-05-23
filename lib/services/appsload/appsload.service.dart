// import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:velocity_x/velocity_x.dart';
// import '../../core/store.dart';
import '/cross/multiplatform/multiplatform.dart';
import '/cross/multiplatform/platform.dart';
// import '../translator/translator.controller.dart';
import '/services/translator/translator.service.dart';
import 'package:platform_device_id/platform_device_id.dart';
// //comment out for building for Android - begin
import 'package:device_info_plus/device_info_plus.dart';
// //comment out for building for Android - end
import 'appsload.model.dart';
import 'appsload.provider.dart';

class AppsLoadService extends ChangeNotifier {
  late AppsLoadModel loadModel;

  getDeviceId() async {
    String? deviceId;
    try {
      deviceId = await PlatformDeviceId.getDeviceId;
    } on PlatformException {
      deviceId = 'Failed to get deviceId.';
    }
    return deviceId;
  }

  getLinuxDeviceId() async {
    String? deviceId;
    //comment out for building for Android - begin
    try {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      final LinuxDeviceInfo linuxInfo = await deviceInfo.linuxInfo;
      deviceId = linuxInfo.machineId;
    } on PlatformException {
      deviceId = 'Failed to get platform version.';
    }
    //comment out for building for Android - end
    return deviceId;
  }

  Future<void> writeLoadApp(LocaleService localeService) async {
    // final MyStore store = VxState.store as MyStore;
    // final UserService userService = store.userService;
    // final LocaleService localeService = store.localeService;
    String? deviceId;
    // if (Platform.isLinux == true) {
    //   // //comment out for building for Android - begin
    //   // try {
    //   //   DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    //   //   final LinuxDeviceInfo linuxInfo = await deviceInfo.linuxInfo;
    //   //   deviceId = linuxInfo.machineId;
    //   // } on PlatformException {
    //   //   deviceId = 'Failed to get platform version.';
    //   // }
    //   // //comment out for building for Android - end
    // } else {
    //   try {
    //     deviceId = await PlatformDeviceId.getDeviceId;
    //   } on PlatformException {
    //     deviceId = 'Failed to get deviceId.';
    //   }
    // }
    String platform;
    final platformOs = getPlatform();
    if (platformOs == Platform.web) {
      platform = 'web';
      deviceId = await getDeviceId();
     } else if (platformOs == Platform.android) {
      platform = 'android';
      deviceId = await getDeviceId();
    } else //GetPlatform.isDesktop
    {
      if (platformOs == Platform.windows) {
        platform = 'windows';
        deviceId = await getDeviceId();
      } else if (platformOs == Platform.linux) {
        platform = 'linux';
        deviceId = await getLinuxDeviceId();
      } else {
        platform = 'macos';
        deviceId = await getDeviceId();
      }
    }

    loadModel = AppsLoadModel(
      application: 'mCurrencyNext',
      platform: platform,
      email: '',
      uid: '',
      device: deviceId!,
      locale: localeService.locale.value,
      datetime: dateToUnix(
        DateTime.now(),
      ),
    );
    debugPrint(loadModel.application);
    debugPrint(loadModel.platform);
    debugPrint(loadModel.email);
    debugPrint(loadModel.uid);
    debugPrint(loadModel.device);
    debugPrint(loadModel.locale);
    debugPrint(loadModel.datetime.toString());
//    await AppsLoadProvider().insertItem(loadModel);//!!!!!!!!!!
  }

  // Future<void> writeWebLoadApp(String email) async {
  //   // String? deviceId;
  //   // try {
  //   //   deviceId = await PlatformDeviceId.getDeviceId;
  //   // } on PlatformException {
  //   //   deviceId = 'Failed to get deviceId.';
  //   // }
  //   // print(deviceId!);
  //   print(email);
  //   final model = AppsLoadModel(
  //       application: 'mEAdditives',
  //       platform: 'web',
  //       email: email,
  //       uid: '',
  //       device: '',
  //       datetime: dateToUnix(DateTime.now()));
  //   await AppsLoadProvider().insertItem(model);
  // }

  // Future<void> writeAndroidLoadApp() async {
  //   String? deviceId;
  //   try {
  //     deviceId = await PlatformDeviceId.getDeviceId;
  //   } on PlatformException {
  //     deviceId = 'Failed to get deviceId.';
  //   }
  //   print(deviceId!);
  //   final model = AppsLoadModel(
  //       application: 'mEAdditives',
  //       platform: 'android',
  //       email: '',
  //       uid: '',
  //       device: deviceId,
  //       datetime: dateToUnix(DateTime.now()));
  //   await AppsLoadProvider().insertItem(model);
  // }

  // Future<void> writeWindowsLoadApp() async {
  //   String? deviceId;
  //   try {
  //     deviceId = await PlatformDeviceId.getDeviceId;
  //   } on PlatformException {
  //     deviceId = 'Failed to get deviceId.';
  //   }
  //   print(deviceId!);
  //   final model = AppsLoadModel(
  //       application: 'mEAdditives',
  //       platform: 'windows',
  //       email: '',
  //       uid: '',
  //       device: deviceId,
  //       datetime: dateToUnix(DateTime.now()));
  //   await AppsLoadProvider().insertItem(model);
  // }

  // Future<void> writeLinuxLoadApp() async {
  //   String? deviceId;
  //   try {
  //     deviceId = await PlatformDeviceId.getDeviceId;
  //   } on PlatformException {
  //     deviceId = 'Failed to get deviceId.';
  //   }
  //   print(deviceId!);
  //   final model = AppsLoadModel(
  //       application: 'mEAdditives',
  //       platform: 'linux',
  //       email: '',
  //       uid: '',
  //       device: deviceId,
  //       datetime: dateToUnix(DateTime.now()));
  //   await AppsLoadProvider().insertItem(model);
  // }

  // Future<void> writeMacOSLoadApp() async {
  //   String? deviceId;
  //   try {
  //     deviceId = await PlatformDeviceId.getDeviceId;
  //   } on PlatformException {
  //     deviceId = 'Failed to get deviceId.';
  //   }
  //   print(deviceId!);
  //   final model = AppsLoadModel(
  //       application: 'mEAdditives',
  //       platform: 'macos',
  //       email: '',
  //       uid: '',
  //       device: deviceId,
  //       datetime: dateToUnix(DateTime.now()));
  //   await AppsLoadProvider().insertItem(model);
  // }

  int dateToUnix(DateTime date) {
    return date.microsecondsSinceEpoch ~/ 1000000;
    // return int.parse('${(date.microsecondsSinceEpoch / 1000 / 1000)}');
  }
}
