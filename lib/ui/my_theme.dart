import 'package:flutter/material.dart';

class MyTheme
{
  static final lightTheme=ThemeData(
    primaryColor: Colors.green,
    textTheme: TextTheme(
      headline6: TextStyle(
        fontSize:22 ,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      )
    )
  );
}