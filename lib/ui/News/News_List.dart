import 'package:flutter/material.dart';
import 'package:news_app/Base/Base_state.dart';
import 'package:news_app/Core/model/Source.dart';
import 'package:news_app/ui/News/Navigator.dart';
import 'package:news_app/ui/News/News_List_viewModel.dart';
import 'package:news_app/ui/News/News_item.dart';
import 'package:provider/provider.dart';

class NewsList extends StatefulWidget {
  Source source;
  NewsList(this.source);

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends BaseState<NewsList, NewsListViewModel>
    implements NewsListsNavigator {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewmodel.LoadNewsList(widget.source.id!);
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => viewmodel,
      child: Container(
        child:
            Consumer<NewsListViewModel>(builder: (buildContext, viewmodel, __) {
          if (viewmodel.errormessage != null) {
            return Column(
              children: [
                Text(viewmodel.errormessage!),
                ElevatedButton(onPressed: () {}, child: Text('Try again '))
              ],
            );
          } else if (viewmodel.newsList == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
              itemCount: viewmodel.newsList!.length,
              itemBuilder: (_, index) {
                return NewsItem(viewmodel.newsList![index]);
              });
        }),
      ),
    );
  }

  @override
  NewsListViewModel initviewmodel() {
    return NewsListViewModel();
  }
}
