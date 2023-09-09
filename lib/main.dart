import 'package:flutter/material.dart';
import 'package:news_app/ui/home_screen.dart';
import 'package:news_app/ui/my_theme.dart';
import 'package:news_app/ui/slpash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: MyTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName:(context) => SplashScreen(),
        homeScreen.routeName:(context) => homeScreen(),
      },
    );
  }
}
