import 'package:easy_whats/provider/provider_setting.dart';
import 'package:easy_whats/styles/colors.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';


import '../../provider/provider_massage.dart';
import '../../provider/provider_whatsapp.dart';

class HomeLayout extends StatelessWidget {
  static const String routeName = "HomeLayout";

  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    var setting = Provider.of<SettingProvider>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          setting.icons[provider.currentIndex],
        ],
        title:  Text(provider.title[provider.currentIndex]),
        backgroundColor:setting.colorSystem[setting.colorNumber] ,
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            provider.changeCurrentIndex(value);
          },
          currentIndex: provider.currentIndex,
          items:  [
            BottomNavigationBarItem(
                icon: Icon(Icons.whatsapp),
                label: 'واتس اب',
                backgroundColor: setting.colorSystem[setting.colorNumber]),
            BottomNavigationBarItem(
                icon: Icon(Icons.sms),
                label: 'الرسائل',
                backgroundColor: setting.colorSystem[setting.colorNumber]),
            BottomNavigationBarItem(
                icon: Icon(Icons.attach_email),
                label: 'الايميل',
                backgroundColor:setting.colorSystem[setting.colorNumber]),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'المحفوظات',
                backgroundColor: setting.colorSystem[setting.colorNumber]),
          ]),
      body: provider.screen[provider.currentIndex],
    );
  }
}
