import 'package:covid_news/pages/newsList.dart';
import 'package:covid_news/viewModels/newsArticleListViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "COVID News",
        home: ChangeNotifierProvider(
          builder: (context) => NewsArticleListViewModel(),
          child: NewsList()
        )
    );
  }
}
