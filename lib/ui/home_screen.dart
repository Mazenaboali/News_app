import 'package:flutter/material.dart';
import 'package:news_app/ui/Category/Category_widget.dart';

import 'package:news_app/ui/Settings_Tab.dart';

import 'package:news_app/ui/category_grid_view.dart';

class homeScreen extends StatefulWidget {
  static const routeName = "homeScreen";

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  List<Category> category = [
    Category(
        CategoryImage: 'assets/images/sports.png',
        CategoryId: 'Sports',
        CategoryTitle: 'Sports',
        CatgoryBackground: Color(0xFFC91C22)),
    Category(
        CategoryImage: 'assets/images/Politics.png',
        CategoryId: 'general',
        CategoryTitle: 'General',
        CatgoryBackground: Color(0xFF003E90)),
    Category(
        CategoryImage: 'assets/images/health.png',
        CategoryId: 'Health',
        CategoryTitle: 'Health',
        CatgoryBackground: Color(0xFFED1E79)),
    Category(
        CategoryImage: 'assets/images/bussines.png',
        CategoryId: 'Business',
        CategoryTitle: 'Business',
        CatgoryBackground: Color(0xFFCF7E48)),
    Category(
        CategoryImage: 'assets/images/environment.png',
        CategoryId: 'technology',
        CategoryTitle: 'Technology',
        CatgoryBackground: Color(0xFF4882CF)),
    Category(
        CategoryImage: 'assets/images/science.png',
        CategoryId: 'Science',
        CategoryTitle: 'Science',
        CatgoryBackground: Color(0xFFF2D352)),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        color: Colors.white,
        child: Image.asset(
          'assets/images/pattern.png',
          fit: BoxFit.fill,
        ),
        height: double.infinity,
        width: double.infinity,
      ),
      Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            elevation: 0,
            title: Text(
                onTapSettings==true?'Settings':
                selectedCategory == null
                    ? 'News App'
                    : selectedCategory!.CategoryTitle,
                style: TextStyle(fontSize: 22)),
            centerTitle: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))),
          ),
          drawer: Drawer(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(40),
                  color: Colors.green,
                  height: 110,
                  width: double.infinity,
                  child: Text(
                    'News App!',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        onTapSettings=false;
                        selectedCategory = null;
                        Navigator.pop(context);

                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.menu,
                          size: 30,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Categories',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      selectedCategory=null;
                      onTapSettings = true;
                      Navigator.pop(context);
                      setState(() {

                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.settings,
                          size: 30,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Settings',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          body:
          onTapSettings == true
              ? SettingsTab()
              : selectedCategory == null
                  ? Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pick your category \n of interest',
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                            Expanded(
                              child: GridView.builder(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 6 / 7,
                                        mainAxisSpacing: 8,
                                        crossAxisSpacing: 8),
                                itemBuilder: (context, index) =>
                                    CategoryGridView(
                                  category: category[index],
                                  index: index,
                                  OnCLickItem: onClick,
                                ),
                                itemCount: 6,
                              ),
                            ),
                          ]),
                    )
                  : CategoryWidget(selectedCategory!)),
    ]);
  }
  Category? selectedCategory = null;
  bool onTapSettings = false;
  void onClick(Category category) {
    setState(() {
      selectedCategory = category;
    });
  }
}
