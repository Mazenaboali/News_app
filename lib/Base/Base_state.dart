import 'package:flutter/material.dart';
import 'package:news_app/Base/Base_navigator.dart';
import 'package:news_app/Base/Base_view_model.dart';
import 'package:news_app/DialogUtils.dart';
abstract class BaseState<T extends StatefulWidget, vm extends BaseViewModel>
    extends State<T> implements BaseNavigator {
  late vm viewmodel;
  vm initviewmodel();

  @override
  void initState() {
    super.initState();
    viewmodel = initviewmodel();
    viewmodel.navigator = this;
  }

  @override
  void HideDialog() {
    dialogUtils.hideDialog(context);
  }

  @override
  void ShowMessage(String title,
      {String? posaction,
      String? negaction,
      VoidCallback? actionpos,
      VoidCallback? actionneg,
      bool isDismisible = false}) {
    dialogUtils.showMessage(context, title);
  }

  @override
  void ShowProgressDialog(String Message, {bool isDismisble = false}) {
    dialogUtils.ShowProgressDialog(context, Message);
  }
}
