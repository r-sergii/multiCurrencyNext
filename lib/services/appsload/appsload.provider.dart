import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../config.dart';
import 'appsload.model.dart';

class AppsLoadProvider {
  final host = '${Config().baseUrl}/api/appsload'; //"script.google.com";

  Future<List<AppsLoadModel>> getItems(String lang) async {
    // print(host);
    // print(path);
    // final URL = Uri.http(host, path); //, data);
    var uri = Uri.parse(host); //'http://192.168.0.104:3040/api/element');
    // print(URL);
    return await http.get(uri).then((response) {
      debugPrint(response.body.toString());
      var jsonElementItemModel = convert.jsonDecode(response.body) as List;
      // print(jsonElementItemModel);
      return jsonElementItemModel.map((json) => AppsLoadModel.fromJson(json)).toList();
    });
  }

  Future<void> insertItem(AppsLoadModel value) async {
    Map<String, dynamic>? params = {
      // 'id': value.id,
      'application': value.application,
      'platform': value.platform,
      'email': value.email,
      'uid': value.uid,
      'device': value.device,
      'locale': value.locale,
      'datetime': value.datetime.toString(),
    };
    var uri = Uri.parse(host);
    debugPrint(params.toString());
    final result = await http.post(uri, body: params).then((response) {
      debugPrint(response.body.toString());
      // var jsonElementItemModel = convert.jsonDecode(response.body) as List;
      // // print(jsonElementItemModel);
      // return jsonElementItemModel.map((json) => AppsLoadModel.fromJson(json)).toList();
      return response.body;
    });
    debugPrint(result);

    // return await response(() => post<Map>('/', params), (data) {});
  }

  // Future<AppsloadModel> getItem(int id, String lang) async {
  //   return response(() => get('/item/$id/lang/$lang'), (data) => AppsloadModel.fromJson(data));
  // }
}
