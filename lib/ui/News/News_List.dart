import 'package:flutter/material.dart';
import 'package:news_app/Core/Api/api_manager.dart';
import 'package:news_app/Core/model/NewsResponce.dart';
import 'package:news_app/Core/model/Source.dart';
import 'package:news_app/ui/News/News_item.dart';

class NewsList extends StatelessWidget {
  Source source;
  NewsList(this.source);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<NewsResponce>(
        future: ApiManager.getNews(source.id ?? ''),
        builder: (buildcontext, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error loading data${snapshot.error.toString()}'),
            );
          }
          if (snapshot.data?.status == 'error') {
            return Center(
              child: Text('Server Error ${snapshot.data?.message}'),
            );
          }
          var news = snapshot.data?.articles;
          return ListView.builder(
              itemCount: news!.length,
              itemBuilder: (_, index) {
                return NewsItem(news[index]);
              });
        },
      ),
    );
  }
}
