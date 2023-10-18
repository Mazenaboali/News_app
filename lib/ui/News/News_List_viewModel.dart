import 'package:news_app/Base/Base_view_model.dart';
import 'package:news_app/Core/Api/api_manager.dart';
import 'package:news_app/Core/model/News.dart';
import 'package:news_app/ui/News/Navigator.dart';

class NewsListViewModel extends BaseViewModel<NewsListsNavigator> {
  List<News>? newsList = null;
  String? errormessage = null;
  void LoadNewsList(String SourceId) async {
    //reinitialize to return loading state
    errormessage = null;
    newsList = null;
    notifyListeners();
    try {
      var response = await ApiManager.getNews(SourceId);
      if (response.status == 'error') {
        errormessage = response.message;
      } else {
        newsList = response.articles;
      }
    } catch (e) {
      errormessage = 'Error getting News Sources';
    }
    notifyListeners();
  }
}
