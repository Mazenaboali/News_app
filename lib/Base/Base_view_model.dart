import 'package:flutter/material.dart';
import 'package:news_app/Base/Base_navigator.dart';

class BaseViewModel<N extends BaseNavigator> extends ChangeNotifier
{
   N? navigator;

}