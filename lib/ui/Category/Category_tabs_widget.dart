import 'package:flutter/material.dart';
import 'package:news_app/Core/model/Source.dart';
import 'package:news_app/ui/Category/Category_tab_item.dart';
import 'package:news_app/ui/News/News_List.dart';

class CategoryTabsWidget extends StatefulWidget {
  List<Source> sources = [];
  CategoryTabsWidget(this.sources);

  @override
  State<CategoryTabsWidget> createState() => _CategoryTabsWidgetState();
}

class _CategoryTabsWidgetState extends State<CategoryTabsWidget> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: DefaultTabController(
        length: widget.sources.length,
        child: Column(
          children: [
            TabBar(
              onTap: (index) {
                selectedindex = index;
                setState(() {});
              },
              tabs: widget.sources
                  .map((source) => SourceTap(
                      source, widget.sources.indexOf(source) == selectedindex))
                  .toList(),
              isScrollable: true,
              indicatorColor: Colors.transparent,
            ),
            Expanded(child: NewsList(widget.sources[selectedindex])),
          ],
        ),
      ),
    );
  }
}
