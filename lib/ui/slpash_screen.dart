import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/ui/home_screen.dart';

class SplashScreen extends StatelessWidget
{
  static const routeName="SplashScreen";
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
     Navigator.of(context).pushReplacementNamed(homeScreen.routeName);
    });
    // TODO: implement build
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          color: Colors.white,
          child: Image.asset('assets/images/pattern.png',fit: BoxFit.fill,),
          height: double.infinity,
          width: double.infinity,
        ),
        Image.asset('assets/images/logo.png'),
      ],
    );
  }
}