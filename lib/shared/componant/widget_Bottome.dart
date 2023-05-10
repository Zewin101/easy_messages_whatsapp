

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/provider_setting.dart';
import '../../styles/colors.dart';

class Widget_MyButton extends StatelessWidget {
  void Function() onPressed;
  String title;

  Widget_MyButton({required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    var setting = Provider.of<SettingProvider>(context);
    return  Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 8,
      ),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height*0.08,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: setting.colorSystem[setting.colorNumber],
            ),
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.arrow_back_ios,size: 20),
                Text(title,style: Theme.of(context).textTheme.headline1,),
              ],
            )),
      ),
    );
  }
}





