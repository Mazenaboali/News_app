import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Core/model/Source.dart';
import 'package:news_app/ui/News/News_List_viewModel.dart';
import 'package:news_app/ui/News/News_item.dart';

class NewsList extends StatefulWidget {
  Source source;
  NewsList(this.source);
  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  NewsListViewModel viewModel = NewsListViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.LoadNews(widget.source.id!);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<NewsListViewModel, NewsListState>(
        bloc: viewModel,
          builder: (context, state) {
        // return widget here based on BlocA's state
        if (state is LoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ErrorState) {
          return Column(
            children: [
              Text(state.errormessage!),
              ElevatedButton(
                  onPressed: () {
                    viewModel.LoadNews(widget.source.id!);
                  },
                  child: Text('Try again '))
            ],
          );
        }
        if (state is NewsLoadedState) {
          ListView.builder(
              itemCount: state.newsList!.length??0,
              itemBuilder: (_, index) {
                return NewsItem(state.newsList![index]);
              });
        }
        return Container(child: Text('asss5ssss'),);
      }),
    );
  }
}
