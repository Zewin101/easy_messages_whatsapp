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

  List<String> splashScreen = [
    'assets/image/back1.png',
    'assets/image/back2.png',
    'assets/image/back3.png'
  ];

  List<Color> cardColor = [
    MASTERCARD1,
    MASTERCARD2,
    MASTERCARD3,
  ];

  Future allTimeFalseBottomSheet() async {
    isBottomSheetShow = false;
    notifyListeners();
  }

  bool isBottomSheetShow = false;

  iconBottomSheetChange() async {
    isBottomSheetShow = !isBottomSheetShow;
    print(isBottomSheetShow);
    notifyListeners();
  }

  bool drawer1 = sharedPreferences.getBool('drawer1') ?? false;
  bool drawer2 = sharedPreferences.getBool('drawer2') ?? false;
  bool drawer3 = sharedPreferences.getBool('drawer3') ?? false;

  int colorNumber = sharedPreferences.getInt('colorSystemIndex') ?? 0;

  systemColorChange(int color) {
    colorNumber = color;
    notifyListeners();
  }

  /// Action for AppBar

  List<Widget> icons = [
    IconButton(onPressed: () {}, icon: Icon(Icons.whatsapp)),
    IconButton(onPressed: () {}, icon: Icon(Icons.message)),
    IconButton(onPressed: () {}, icon: Icon(Icons.email)),
    IconButton(onPressed: () {}, icon: Icon(Icons.save_as)),
  ];
}
