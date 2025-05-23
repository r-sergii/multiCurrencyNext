// import './currency.model.dart';
// import '/providers/base.provider.dart';


// class CurrencyProvider extends BaseProvider {
//   CurrencyProvider() : super() {
//     baseUrl = "${baseUrl}/currency";
//   }

//   Future<List<CurrencyModel>> getItems() async {
//     return response(() => get('/read'), fromJsonList(CurrencyModel.fromJson));
//   }

//   // Future<List<CurrencyModel>> getAppItem(String? short) async {
//   //   assert(short != null);
//   //   return response(() => get('/item/$short'), fromJsonList(CurrencyModel.fromJson));
//   // }

//   // Future<CurrencyModel> getItem(String? short) async {
//   //   assert(short != null);
//   //   return response(() => get('/item/$short'), (data) => PortofolioItemCellModel.fromJson(data));
//   // }
// }

import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import '/config.dart';
import './currency.model.dart';

class CurrencyProvider {
  // final host = '${Config().baseUrl}/api/currency/read'; //"script.google.com";
  final host = '${Config().baseUrl}/supabase/read'; //"script.google.com";

  // Future<List<ElementItemModel>> getDataList(String host, String path, Map<String, dynamic> data) async {
  Future<List<CurrencyModel>> getList() async {
    // print(host);
    // print(path);
    // final URL = Uri.http(host, path); //, data);
    var URL = Uri.parse(host);//'http://192.168.0.104:3040/api/currency/read');
    // print(URL);
    return await http.get(URL).then((response) {
      print(response.body);
      var jsonClockItemModel = convert.jsonDecode(response.body) as List;
      print(jsonClockItemModel);
      return jsonClockItemModel.map((json) => CurrencyModel.fromJson(json)).toList();
    });
  }
}