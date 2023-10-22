import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/ui/Category/Category_tabs_widget.dart';
import 'package:news_app/ui/Category/Category_widget_viewModel.dart';
import 'package:news_app/ui/category_grid_view.dart';

class CategoryWidget extends StatefulWidget {
  Category category;
  CategoryWidget(this.category);

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  CategoryWidgetViewModel viewModel = CategoryWidgetViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.LoadSources(widget.category.CategoryId);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProvider(
        create: (_) => viewModel,
        child: Container(
          child: BlocBuilder<CategoryWidgetViewModel, CategoryWidgetState>(
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
                        viewModel.LoadSources(widget.category.CategoryId);
                      },
                      child: Text('Try again '))
                ],
              );
            }
            if (state is SourcesLoadedState) {
              return CategoryTabsWidget(state.sources!);
            }
            return Container();
          }),
        ));
  }
}
