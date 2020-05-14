//Responsible for making a network request, then giving us a JSON information/result
//Then also giving it to the newArticle, so we can get an instance
import 'dart:convert';

import 'package:covid_news/models/newsArticle.dart';
import 'package:http/http.dart' as http;

class Webservice {
  Future<List<NewsArticle>> fetchBestHeadlines() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=bb7bf8d7c5934d90b93bc79f7803feab";

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      Iterable list = result["articles"];
      return list.map((article) => NewsArticle.fromJSON(article)).toList();
    } else {
      throw Exception("Failed to get news");
    }
  }
}
