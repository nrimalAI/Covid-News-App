import 'package:covid_news/services/webService.dart';
import 'package:covid_news/viewModels/newsArticleViewModel.dart';
import 'package:covid_news/models/newsArticle.dart';
import 'package:flutter/cupertino.dart';

class NewsArticleListViewModel extends ChangeNotifier {

  List<NewsArticleViewModel> articles = List<NewsArticleViewModel>();


  void populateTopHeadlines() async {
    List<NewsArticle> newsArticles = await Webservice().fetchBestHeadlines();
    this.articles = newsArticles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();
    notifyListeners();
  }
}
