import 'package:shared_preferences/shared_preferences.dart';

import 'config.dart';

abstract class StorageFields {
  static const sEULA = "EULA";
  static const sLOCALE = 'LOCALE';
  static const sUID = 'uid';
  static const sTHEME = "theme";
}

abstract class App {
  static const String packageName = 'multicurrencynext';
  static const String appName = 'multiCurrency Next';
  static const String nomerVersion = '2.0.0';
  static const String versionMajor = '2';
  static const String versionBuild = ''; //'01'
  // static const String version = '$versionMajor.0.0 Build-$versionBuild';
  static const String version = 'Version $versionMajor.0.0';
  static const String packageVersion = '2.0.0';
  static const String copyright = 'Copyright ©2016 - 2025';
  static const String author = 'Sergej Rudchenko';
  static const String storeAndroidName = 'Google Play';
  static const String storeWindowsName = 'Microsoft Store';
  static const String storeLinuxName = 'Snap Store';
  static const String storeWebName = 'Web link';
  static const String mailName = "Support email";

  static final Uri supportUri = Uri(
    scheme: 'mailto',
    path: 'multiApps@i.ua',
    queryParameters: {'subject': 'Feedback'},
  );
  static final Uri packageUri = Uri(
    scheme: 'https',
    host: 'pub.dev',
    path: 'packages/flex_color_scheme',
  );
  static final Uri multiAppsUri = Uri(
    scheme: 'http',
    host: 'multiapps.inf.ua',
    path: '',
  );
  static final Uri privacyPolicyUri = Uri(
    scheme: 'http',
    host: 'multiapps.inf.ua',
    path: 'privat/flutter/multicalendar/privacy_policy.htm',
  );
  static final Uri storeAndroidUri = Uri(
      scheme: 'https',
      host: 'play.google.com',
      // path: 'store/apps/details?id=ua.multiapps.meadditiveslite',
      path: 'store/apps/details',
      queryParameters: {'id': 'ua.multiapps.mcurrencynext'});
  // static final Uri storeAndroidUri = Uri.https('play.google.com', 'store/apps/details', { 'id' : 'ua.multiapps.meadditiveslite' });
  static final Uri storeWebUri = Uri(
    scheme: 'https',
    host: '',
    path: '',
  );
  static final Uri storeWindowsUri = Uri(
    scheme: 'https',
    host: 'www.microsoft.com',
    path: 'store/apps/9NBBWP1KRQGG?ocid=badge',
  );
  static final Uri storeLinuxUri = Uri(
    scheme: 'https',
    host: 'snapcraft.io',
    path: '',
  );

  static late Config config;
  static late SharedPreferences prefs; // = SharedPreferences.getInstance();

  static late bool isEULA;

  static Future<void> init(Config config) async {
    App.config = config;
    // WidgetsFlutterBinding.ensureInitialized();
//     //### comment out for building for Android - begin
// //Only for Android
//     if (Platform.isAndroid) {
//       ByteData data = await PlatformAssetBundle().load('assets/ca/lets-encrypt-r3.pem');
//       SecurityContext.defaultContext.setTrustedCertificatesBytes(data.buffer.asUint8List());
//     }
// ////////////////
//     ///### comment out for building for Android - end
    prefs = await SharedPreferences.getInstance();

    isEULA = prefs.getBool(StorageFields.sEULA) ?? false;
  }

  writeStorage() {
    prefs.setBool(StorageFields.sEULA, isEULA);
  }

  readStorage() {
    isEULA = prefs.getBool(StorageFields.sEULA) ?? false;
  }
}
