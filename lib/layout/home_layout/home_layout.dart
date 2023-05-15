import 'package:easy_whats/generated/assets.dart';
import 'package:easy_whats/layout/home_layout/drawer_screen.dart';
import 'package:easy_whats/provider/provider_setting.dart';
import 'package:easy_whats/styles/colors.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../main.dart';
import '../../provider/provider_massage.dart';
import '../../provider/provider_whatsapp.dart';

class HomeLayout extends StatelessWidget {
  static const String routeName = "HomeLayout";

  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    var providerMassage = Provider.of<MessageProvider>(context);
    var setting = Provider.of<SettingProvider>(context);
    bool d = sharedPreferences.getBool('drawer') ?? false;
    return Stack(
            children: [
              Image.asset(
                Assets.imageBack1,
                fit: BoxFit.fill,
                width: double.infinity,
                height: double.infinity,
              ),
              Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  actions: [
                    setting.icons[providerMassage.currentIndex],
                  ],
                  title:
                      Text(providerMassage.title[providerMassage.currentIndex]),
                  backgroundColor: setting.colorSystem[setting.colorNumber],
                ),
                bottomNavigationBar: BottomNavigationBar(
                    onTap: (value) {
                      providerMassage.changeCurrentIndex(value);
                    },
                    backgroundColor: setting.colorSystem[setting.colorNumber],
                    currentIndex: providerMassage.currentIndex,
                    items: [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.whatsapp),
                          label: 'واتس اب',
                          backgroundColor:
                              setting.colorSystem[setting.colorNumber]),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.sms),
                          label: 'الرسائل',
                          backgroundColor:
                              setting.colorSystem[setting.colorNumber]),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.attach_email),
                          label: 'الايميل',
                          backgroundColor:
                              setting.colorSystem[setting.colorNumber]),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.save_as),
                          label: 'المحفوظات',
                          backgroundColor:
                              setting.colorSystem[setting.colorNumber]),
                    ]),
                body: providerMassage.screen[providerMassage.currentIndex],
                drawer: Drawer_Screen(),
              ),
            ],
          );
  }
}
