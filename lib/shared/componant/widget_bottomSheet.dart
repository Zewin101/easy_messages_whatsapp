import 'package:easy_whats/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../../provider/provider_setting.dart';

class DefaultShowDialog extends StatelessWidget {
  const DefaultShowDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var setting = Provider.of<SettingProvider>(context);
    return Card(
      elevation: 5,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: CircleAvatar(
                backgroundColor: MASTERCOLOR,
              ),
              onTap: () {
                setting.systemColorChange(0);
                sharedPreferences.setInt('colorSystemIndex', 0);
                Navigator.pop(context);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: CircleAvatar(
                backgroundColor: MASTERCOLORTOW,
              ),
              onTap: () {
                setting.systemColorChange(1);
                sharedPreferences.setInt('colorSystemIndex', 1);
                Navigator.pop(context);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: CircleAvatar(
                backgroundColor: MASTERCOLORTHREE,
              ),
              onTap: () {
                setting.systemColorChange(2);
                sharedPreferences.setInt('colorSystemIndex', 2);
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
