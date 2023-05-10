import 'package:easy_whats/styles/colors.dart';
import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier {
  /// colors system
  List<Color> colorSystem = [
    MASTERCOLOR,
    MASTERCOLORTOW,
    MASTERCOLORTHREE,
  ];
  int colorNumber = 0;

  void systemColorChange(int color) {
    colorNumber = color;
    notifyListeners();
  }

  /// icons for AppBar

  List<Widget> icons = [
    IconButton( onPressed: (){},icon: Icon(Icons.whatsapp)),
    IconButton( onPressed: (){},icon: Icon(Icons.message)),
    IconButton( onPressed: (){},icon: Icon(Icons.email)),
    IconButton( onPressed: (){},icon: Icon(Icons.settings)),

  ];
}
