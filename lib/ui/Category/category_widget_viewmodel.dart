import 'package:news_app/Base/Base_view_model.dart';
import 'package:news_app/Core/Api/api_manager.dart';
import 'package:news_app/Core/model/Source.dart';
import 'package:news_app/ui/Category/Category_widget_navigator.dart';

class CategoryWidgetViewModel extends BaseViewModel<CategoryWidgetNavigator> {
  List<Source>? sources = null;
  String? errormessage = null;
  void LoadSources(String categoryId) async {

    //reinitialize to return loading state
    errormessage = null;
    sources = null;
    notifyListeners();
    try {
      var response = await ApiManager.getSources(categoryId);
      if (response.status == 'error') {
        errormessage = response.message;
      } else {
        sources = response.sources;
      }
    } catch (e) {
      errormessage = 'Error getting News Sources';
    }
    notifyListeners();
  }
}
