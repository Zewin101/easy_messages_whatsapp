

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/provider_setting.dart';
import '../../styles/colors.dart';

class My_ElevatedButton extends StatelessWidget {
  void Function() onPressed;
  String title;
  IconData? icon;

  My_ElevatedButton({required this.onPressed, required this.title,required this.icon});

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
        height: MediaQuery.of(context).size.height*0.06,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: setting.colorSystem[setting.colorNumber],
            ),
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text(title,style: Theme.of(context).textTheme.headline1,textAlign: TextAlign.center,)),
                Icon(icon,size: 20),
                SizedBox(width: 5,),
              ],
            )),
      ),
    );
  }
}





