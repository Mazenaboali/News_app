import 'package:flutter/material.dart';
import 'package:news_app/Base/Base_state.dart';
import 'package:news_app/ui/Category/Category_tabs_widget.dart';
import 'package:news_app/ui/Category/Category_widget_navigator.dart';
import 'package:news_app/ui/Category/category_widget_viewmodel.dart';
import 'package:news_app/ui/category_grid_view.dart';
import 'package:provider/provider.dart';

class CategoryWidget extends StatefulWidget {
  Category category;
  CategoryWidget(this.category);
  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();

}


class _CategoryWidgetState extends BaseState<CategoryWidget,CategoryWidgetViewModel>implements CategoryWidgetNavigator {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewmodel.LoadSources(widget.category.CategoryId);

  }
  @override
  Widget build(BuildContext context) {


    // TODO: implement build
    return ChangeNotifierProvider(
      create: (_)=>viewmodel,
        child: Container(
          child: Consumer<CategoryWidgetViewModel>(
              builder:(buildContext,viewmodel,__){
                if(viewmodel.errormessage!=null)
                  {
                    return Column(
                      children: [
                        Text(viewmodel.errormessage!),
                        ElevatedButton(onPressed: (){}, child:
                            Text('Try again ')
                        )
                      ],
                    );
                  }
                else if(viewmodel.sources==null)
                  {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                return CategoryTabsWidget(viewmodel.sources!);
          }

                ),
        )
    );
  }

  @override
  CategoryWidgetViewModel initviewmodel() {
    return CategoryWidgetViewModel();
  }
}
