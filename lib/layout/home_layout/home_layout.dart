import 'package:whatsappservices/styles/colors.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';


import '../../provider/provider_massage.dart';

class HomeLayout extends StatelessWidget {
  static const String routeName = "HomeLayout";

  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title:  Text(provider.title[provider.currentIndex]),
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            provider.changeCurrentIndex(value);
          },
          currentIndex: provider.currentIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.category_outlined),
                label: 'الاقسام',
                backgroundColor: MASTERCOLOR),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'الاعدادت',
                backgroundColor: MASTERCOLOR),
          ]),
      body: provider.screen[provider.currentIndex],
    );
  }
}
