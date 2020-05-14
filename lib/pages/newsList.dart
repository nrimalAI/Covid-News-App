import 'package:covid_news/viewModels/newsArticleListViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewsList extends StatefulWidget {
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .populateTopHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<NewsArticleListViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Latest News")),
      body: ListView.builder(
          itemCount: viewModel.articles.length,
          itemBuilder: (context, index) {
            final article = viewModel.articles[index];
            return ListTile(
              leading: Container(
                  width: 100,
                  height: 100,
                  child: article.imageUrl == null
                      ? Image.asset("images/corona.jpg")
                      : Image.network(article.imageUrl)),
              title: Text(article.title),
            );
          }),
    );
  }
}
