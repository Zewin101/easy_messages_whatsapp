
import 'package:easy_whats/provider/provider_setting.dart';
import 'package:easy_whats/shared/componant/widget_Bottome.dart';
import 'package:easy_whats/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/provider_massage.dart';
import '../../provider/provider_whatsapp.dart';

class Setting_Screen extends StatelessWidget {
  const Setting_Screen({Key? key}) : super(key: key);
  static const String routeName = "Setting_Screen";
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    var setting = Provider.of<SettingProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Widget_MyButton(onPressed: (){}, title: 'تغير اللغة'),
          Widget_MyButton(onPressed: (){}, title: 'اعدادت الرسائل'),
          Widget_MyButton(onPressed: (){
            setting.systemColorChange(2);
          }, title: 'اعدادات الالوان '),
          Widget_MyButton(onPressed: (){}, title: 'تغير اللغة'),
          Widget_MyButton(onPressed: (){}, title: 'تغير اللغة'),

        ],
      ),

    );
  }
}
