import 'package:flutter/material.dart';
import 'package:news_app/Core/Api/api_manager.dart';
import 'package:news_app/Core/model/SourcesResponce.dart';
import 'package:news_app/ui/Category/Category_tabs_widget.dart';
import 'package:news_app/ui/category_grid_view.dart';

class CategoryWidget extends StatelessWidget {
  Category category;
  CategoryWidget(this.category);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: FutureBuilder<SourcesResponce>(
        future: ApiManager.getSources(category.CategoryId),
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
          var sources = snapshot.data?.sources;
          return CategoryTabsWidget(sources!);
        },
      ),
    );
  }
}
