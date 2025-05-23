import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

import 'translator.model.dart';

class TranslatorProvider {
  Future<List<ResultTranslatorModel>> getDataList(String host, String path, Map<String, dynamic> data) async {
    final URL = Uri.https(host, path, data);
    print(URL);
    return await http.get(URL).then((response) {
      print(response.body);
      var jsonResultTranslatorModel = convert.jsonDecode(response.body) as List;
      print(jsonResultTranslatorModel);
      return jsonResultTranslatorModel.map((json) => ResultTranslatorModel.fromJson(json)).toList();
    });
  }
}
