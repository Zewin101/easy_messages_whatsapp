import 'package:easy_whats/provider/provider_setting.dart';
import 'package:easy_whats/shared/componant/widget_Bottome.dart';
import 'package:easy_whats/shared/componant/widget_bottomSheet.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/provider_massage.dart';

class Setting_Screen extends StatelessWidget {
  const Setting_Screen({Key? key}) : super(key: key);
  static const String routeName = "Setting_Screen";

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MessageProvider>(context);
    var setting = Provider.of<SettingProvider>(context);
    return
      Column(
        children: [
          Widget_MyButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor:
                            setting.colorSystem[setting.colorNumber],
                        content: DefaultShowDialog(),
                        title: Text(
                          'اختر اللون',
                          style: Theme.of(context).textTheme.subtitle2,
                          textAlign: TextAlign.end,
                        ),
                      );
                    });
              },
              title: 'تغير اللغة'),
          Widget_MyButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor:
                            setting.colorSystem[setting.colorNumber],
                        content: DefaultShowDialog(),
                        title: Text(
                          'اختر اللون',
                          style: Theme.of(context).textTheme.subtitle2,
                          textAlign: TextAlign.end,
                        ),
                      );
                    });
              },
              title: 'اعدادت الرسائل'),
          Widget_MyButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor:
                            setting.colorSystem[setting.colorNumber],
                        content: DefaultShowDialog(),
                        title: Text(
                          'اختر اللون',
                          style: Theme.of(context).textTheme.subtitle2,
                          textAlign: TextAlign.end,
                        ),
                      );
                    });
              },
              title: 'اعدادات الالوان '),
          Widget_MyButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor:
                            setting.colorSystem[setting.colorNumber],
                        content: DefaultShowDialog(),
                        title: Text(
                          'اختر اللون',
                          style: Theme.of(context).textTheme.subtitle2,
                          textAlign: TextAlign.end,
                        ),
                      );
                    });
              },
              title: 'تغير اللغة'),
          Widget_MyButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor:
                            setting.colorSystem[setting.colorNumber],
                        content: DefaultShowDialog(),
                        title: Text(
                          'اختر اللون',
                          style: Theme.of(context).textTheme.subtitle2,
                          textAlign: TextAlign.end,
                        ),
                      );
                    });
              },
              title: 'تغير اللغة'),
        ],

    );
  }
}
