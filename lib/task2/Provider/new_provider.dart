import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Model/news_model.dart';

class ApiProvider {
  Future<NewsResponse?> fetchLondonNews() async {
    try {
      final baseUrl = Uri.parse(
          'https://newsapi.org/v2/everything?q=tesla&from=2022-10-19&sortBy=publishedAt&apiKey=61b760cae6b94f47a3dd3cdb3c8c7b7b');
      final response = await http
          .get(baseUrl, headers: {'content-Type': 'application/json'});
      dynamic responseJson;
      if (response.statusCode == 200) {
        responseJson = json.decode(response.body);
        return NewsResponse.fromJson(responseJson);
      } else if (response.statusCode == 404) {
        responseJson = json.decode(response.body);
        return NewsResponse.fromJson(responseJson);
      } else {
        return null;
      }
    } catch (exception) {
      print('exception---- $exception');
      return null;
    }
  }
}
