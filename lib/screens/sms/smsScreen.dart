import 'package:easy_whats/shared/componant/widget_ElevatedButton.dart';
import 'package:easy_whats/shared/componant/widget_TextFormFiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../provider/provider_massage.dart';
import '../../provider/provider_setting.dart';
import '../../provider/provider_whatsapp.dart';
import '../../styles/colors.dart';

class sms_screen extends StatelessWidget {
  sms_screen({Key? key}) : super(key: key);
  static const String routeName = 'sms_screen';
  var numberController = TextEditingController();
  var backMessageController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var controller = TextEditingController();
  var providerMassage;
  var provider;
  var setting;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<WhatsappProvider>(context);
    providerMassage = Provider.of<MessageProvider>(context);
    setting = Provider.of<SettingProvider>(context);
    backMessageController.text = providerMassage.messageApp;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                My_TextFormFiled(
                    length: 500,
                    controller: backMessageController,
                    hintText: '',
                    maxLines: 10),
                const SizedBox(
                  height: 15,
                ),
                My_TextFormFiled(
                  TxtDecoration: false,
                  length: 13,
                  icon: Icons.phone_in_talk_outlined,
                  controller: numberController,
                  hintText: 'ادخل الرقم',
                  validator: (value) {
                    if (value?.trim() == '' || value!.isEmpty) {
                      return 'لم تقم بكتابة الرقم ';
                    }
                    if (numberController.text.length < 10) {
                      return 'الرقم غير صحيح';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                ),
                My_ElevatedButton(
                    onPressed: () async {
                      await sendMessage();
                    },
                    title: "SMS",
                    icon: Icons.sms),
              ],
            ),
          ),
        ),
      ),
    );
  }

  sendMessage() async {
    if (formKey.currentState!.validate()) {
      await provider.launchUrlSms(
          numPhone: numberController.text,
          messageSms: providerMassage.massageMaster[0]['massage']);
    }
  }
}
