import 'package:flutter/material.dart';
import './translator.model.dart';

class TranslatorController extends ChangeNotifier {
  String currency = "CURRENCY";
  String settings = "SETTINGS";
  String about = "ABOUT";
  String exit = "EXIT";
  String version = "Version";
  String colorthemes = "COLOR THEMES";
  String switcherthemes = "THEME SWITCHER";
  String language = "LANGUAGE";
  String confirm = "CONFIRM";
  String cancel = "CANCEL";
  String privacyPolicy = "PRIVACY POLICY";
  String noConnect = "NO CONNECT";
  String noAccess = "NO ACCESS TO THE INTERNET. MAKE THE CONNECTION AND TRY AGAIN.";
  String license = "LICENSE";

  writeStorage() {}

  readStorage() {}

  reload(TranslatorController recreate) {
    currency = recreate.currency;
    settings = recreate.settings;
    about = recreate.about;
    exit = recreate.exit;
    colorthemes = recreate.colorthemes;
    switcherthemes = recreate.switcherthemes;
    language = recreate.language;
    confirm = recreate.confirm;
    cancel = recreate.cancel;
    version = recreate.version;
    privacyPolicy = recreate.privacyPolicy;
    noConnect = recreate.noConnect;
    noAccess = recreate.noAccess;
    license = recreate.license;
  }

  upload(List<ResultTranslatorModel> result) {
    for (int i = 0; i < result.length; i++) {
      switch (result[i].original) {
        case "CURRENCY":
          currency = result[i].translation;
          break;
        case "SETTINGS":
          settings = result[i].translation;
          break;
        case "ABOUT":
          about = result[i].translation;
          break;
        case "EXIT":
          exit = result[i].translation;
          break;
        case "COLOR THEMES":
          colorthemes = result[i].translation;
          break;
        case "THEME SWITCHER":
          switcherthemes = result[i].translation;
          break;
        case "LANGUAGE":
          language = result[i].translation;
          break;
        case "CONFIRM":
          confirm = result[i].translation;
          break;
        case "CANCEL":
          cancel = result[i].translation;
          break;
        case "Version":
          version = result[i].translation;
          break;
        case "PRIVACY POLICY":
          privacyPolicy = result[i].translation;
          break;
        case "NO CONNECT":
          noConnect = result[i].translation;
          break;
        case "NO ACCESS TO THE INTERNET. MAKE THE CONNECTION AND TRY AGAIN.":
          noAccess = result[i].translation;
          break;
        case "LICENSE":
          license = result[i].translation;
          break;
        default:
          break;
      }
    }
  }
}
