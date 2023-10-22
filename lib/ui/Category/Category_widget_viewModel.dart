import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Core/Api/api_manager.dart';
import 'package:news_app/Core/model/Source.dart';

class CategoryWidgetViewModel extends Cubit<CategoryWidgetState> {
  CategoryWidgetViewModel() : super(LoadingState());
  void LoadSources(String categoryId) async {
    try {
      var response = await ApiManager.getSources(categoryId);
      if (response.status == 'error') {
        emit(ErrorState(response.message));
      } else {
        emit(SourcesLoadedState(response.sources));
      }
    } catch (e) {
      emit(ErrorState('Error getting News Sources'));
    }
  }
}

abstract class CategoryWidgetState {}

class LoadingState extends CategoryWidgetState {}

class SourcesLoadedState extends CategoryWidgetState {
  List<Source>? sources;
  SourcesLoadedState(this.sources);
}

class ErrorState extends CategoryWidgetState {
  String? errormessage;

  ErrorState(this.errormessage);
}
