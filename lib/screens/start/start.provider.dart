import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

import '../../config.dart';
import 'start.model.dart';

class StartProvider {
  // final host = '${Config().baseUrl}/api/currency/read'; //"script.google.com";
  final host = '${Config().baseUrl}/supabase/last'; //"script.google.com";

  Future<RatesModel> getItem() async {
    // print(host);
    // print(path);
    // final URL = Uri.http(host, path); //, data);
    var URL = Uri.parse(host); //'http://192.168.0.104:3040/api/currency/read');
    // print(URL);
    return await http.get(URL).then((response) {
      print(response.body);
      var jsonRatesItemModel = convert.jsonDecode(response.body);
      print(jsonRatesItemModel);
      return RatesModel.fromJson(jsonRatesItemModel);
    });
  }

  Future<void> updateRates() async {
    final host = '${Config().baseUrl}/supabase/update';
    var URL = Uri.parse(host);
    http.get(URL);
  }
}
