import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/news_model.dart';

class Services {
  Future<NewsModel> fetchNews() async {
    final url =
        "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=e07033cdb6d54aa6bc21490cf0106bf2";
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return NewsModel.fromJson(result);
    } else {
      return NewsModel();
    }
  }
}
