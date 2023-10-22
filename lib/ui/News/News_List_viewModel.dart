import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Core/Api/api_manager.dart';
import 'package:news_app/Core/model/NewsResponce.dart';

class NewsListViewModel extends Cubit<NewsListState> {
  NewsListViewModel() : super(LoadingState());
  void LoadNews(String sourceId) async {
    try {
      var response = await ApiManager.getNews(sourceId);
      if (response.status == 'error') {
        emit(ErrorState(response.message));
      } else {
        emit(NewsLoadedState(response.articles));
      }
    } catch (e) {
      emit(ErrorState('Error getting News Sources'));
    }
  }
}

abstract class NewsListState {}

class LoadingState extends NewsListState {}

class NewsLoadedState extends NewsListState {
  List<News>? newsList;
  NewsLoadedState(this.newsList);
}

class ErrorState extends NewsListState {
  String? errormessage;
  ErrorState(this.errormessage);
}
