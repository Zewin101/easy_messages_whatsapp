import 'package:easy_whats/generated/assets.dart';
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
                          icon: Icon(Icons.settings),
                          label: 'المحفوظات',
                          backgroundColor:
                              setting.colorSystem[setting.colorNumber]),
                    ]),
                body: providerMassage.screen[providerMassage.currentIndex],
                drawer: Drawer(
                  backgroundColor: setting.colorSystem[setting.colorNumber],
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Scaffold(
                    appBar: AppBar(
                      backgroundColor: setting.colorSystem[setting.colorNumber],
                      centerTitle: true,
                      title: Text(
                        'easy message',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                        ),
                      ),
                    ),
                    backgroundColor: setting.colorSystem[setting.colorNumber],
                    body: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: setting.colorSystem[
                                              setting.colorNumber] ==
                                          setting.colorSystem[0]
                                      ? Colors.cyanAccent
                                      : setting
                                          .colorSystem[setting.colorNumber],
                                ),
                                child: CircleAvatar(
                                  child: Text('1'),
                                  backgroundColor: MASTERCOLOR,
                                ),
                              ),
                              onTap: () {
                                setting.systemColorChange(0);
                                sharedPreferences.setInt('colorSystemIndex', 0);
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: setting.colorSystem[
                                              setting.colorNumber] ==
                                          setting.colorSystem[1]
                                      ? Colors.cyanAccent
                                      : setting
                                          .colorSystem[setting.colorNumber],
                                ),
                                child: CircleAvatar(
                                  child: Text('2'),
                                  backgroundColor: MASTERCOLORTOW,
                                ),
                              ),
                              onTap: () {
                                setting.systemColorChange(1);
                                sharedPreferences.setInt('colorSystemIndex', 1);
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: setting.colorSystem[
                                              setting.colorNumber] ==
                                          setting.colorSystem[2]
                                      ? Colors.cyanAccent
                                      : setting
                                          .colorSystem[setting.colorNumber],
                                ),
                                child: CircleAvatar(
                                  child: Text('3'),
                                  backgroundColor: MASTERCOLORTHREE,
                                ),
                              ),
                              onTap: () {
                                setting.systemColorChange(2);
                                sharedPreferences.setInt('colorSystemIndex', 2);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}
