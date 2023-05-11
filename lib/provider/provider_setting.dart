import 'package:easy_whats/main.dart';
import 'package:easy_whats/styles/colors.dart';
import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier {
  /// colors system
  List<Color> colorSystem = [
    MASTERCOLOR,
    MASTERCOLORTOW,
    MASTERCOLORTHREE,
  ];


  int colorNumber= sharedPreferences.getInt('colorSystemIndex') ?? 0;


   systemColorChange(int color) {
     colorNumber = color;
    notifyListeners();
  }

  /// Action for AppBar

  List<Widget> icons = [
    IconButton( onPressed: (){},icon: Icon(Icons.whatsapp)),
    IconButton( onPressed: (){},icon: Icon(Icons.message)),
    IconButton( onPressed: (){},icon: Icon(Icons.email)),
    IconButton( onPressed: (){},icon: Icon(Icons.save_as)),
    IconButton( onPressed: (){},icon: Icon(Icons.settings)),

  ];
}
