import 'dart:html';
abstract class BaseNavigator
{
  void ShowProgressDialog(String ProgressMessage,
      {bool isDismisble = false});
  void ShowMessage(String title,
      {
        String? posaction,
        String? negaction,
        VoidCallback? actionpos,
        VoidCallback? actionneg,
        bool isDismisible = false,
      }
      );
  void HideDialog();
}