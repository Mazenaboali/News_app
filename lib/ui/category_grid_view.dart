import 'package:flutter/material.dart';

class CategoryGridView extends StatelessWidget {
  Category category;
  int index;
  Function OnCLickItem;
  CategoryGridView(
      {required this.category, required this.index, required this.OnCLickItem});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () {
        OnCLickItem(category);
      },
      child: Container(
        padding: EdgeInsets.only(top: 12),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: category.CatgoryBackground,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(index % 2 == 0 ? 0 : 25),
              bottomLeft: Radius.circular(index % 2 == 1 ? 0 : 25),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(category.CategoryImage),
            Text(
              category.CategoryTitle,
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
    );
  }
}

class Category {
  String CategoryImage;
  String CategoryId;
  String CategoryTitle;
  Color CatgoryBackground;

  Category(
      {required this.CategoryImage,
      required this.CategoryId,
      required this.CategoryTitle,
      required this.CatgoryBackground});
}
