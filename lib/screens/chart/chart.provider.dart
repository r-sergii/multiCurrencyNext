// import 'dart:convert';
// import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../app.dart';
import 'chart.type.dart';

class ReadChartData {
  Future<String> getChartData(String ticker, periodType period) async {
    // final String baseUrl = '${App.config.baseUrl}/api';
    final String baseUrl = '${App.config.baseUrl}';
    late String url;
    late String result;
    switch (period) {
      case periodType.h1:
        // url = "http://localhost:5000/candle_h1?ticker=" + ticker;
        // url = "http://localhost:3040/api/currency/candle_h1/" + ticker;
        // url = "$baseUrl/currency/candle_h1/$ticker";
        url = "$baseUrl/supabase/candle_h1/$ticker";
        break;
      case periodType.h4:
        // url = "http://localhost:5000/candle_h4?ticker=" + ticker;
        //  url = "http://localhost:3040/api/currency/candle_h4/" + ticker;
        //  url = "$baseUrl/currency/candle_h4/$ticker";
        url = "$baseUrl/supabase/candle_h4/$ticker";
        break;
      case periodType.d1:
        // url = "http://localhost:5000/candle_d1?ticker=" + ticker;
        // url = "http://localhost:3040/api/currency/candle_d1/" + ticker;
        // url = "$baseUrl/currency/candle_d1/$ticker";
        url = "$baseUrl/supabase/candle_d1/$ticker";
        break;
      case periodType.w1:
        // url = "http://localhost:5000/candle_w1?ticker=" + ticker;
        // url = "http://localhost:3040/api/currency/candle_w1/" + ticker;
        // url = "$baseUrl/currency/candle_w1/$ticker";
        url = "$baseUrl/supabase/candle_w1/$ticker";
        break;
      case periodType.mn:
        // url = "http://localhost:5000/candle_mn?ticker=" + ticker;
        // url = "http://localhost:3040/api/currency/candle_mn/" + ticker;
        // url = "$baseUrl/currency/candle_mn/$ticker";
        url = "$baseUrl/supabase/candle_mn/$ticker";
        break;
      default:
        // url = "http://localhost:5000/candle_d1?ticker=" + ticker;
        // url = "http://localhost:3040/api/currency/candle_d1/" + ticker;
        // url = "$baseUrl/currency/candle_d1/$ticker";
        url = "$baseUrl/supabase/candle_d1/$ticker";
        break;
    }
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      result = response.body;
    } else {
      print('Failed getting IP address');
    }
    return result;
  }
}
