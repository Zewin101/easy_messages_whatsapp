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
  var MessageController = TextEditingController();
  var titleController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  late WhatsappProvider provider;
  late MessageProvider providerMassage;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<WhatsappProvider>(context);
    providerMassage = Provider.of<MessageProvider>(context);
    var setting = Provider.of<SettingProvider>(context);
    MessageController.text = providerMassage.messageApp;
    titleController.text=providerMassage.titleMessageApp;

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
                    length: 20,
                    controller: titleController,
                    hintText: 'عنوان الرسالة'),
                const SizedBox(
                  height: 5,
                ),
                My_TextFormFiled(
                    length: 500,
                    controller: MessageController,
                    hintText: '',
                    icon: Icons.sms,
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
          messageSms: MessageController.text);
      if (providerMassage.allMassage.isEmpty ||
          providerMassage.allMassage.length == 0) {
        providerMassage.insertDatabase(
            title: titleController.text, massage: MessageController.text);
      } else if(providerMassage.allMassage.length > 0) {
        providerMassage.updateDatabase(
            title: titleController.text,
            massage: MessageController.text,
            id: providerMassage.id + 1);
        providerMassage.messageApp = MessageController.text;
        providerMassage.titleMessageApp = titleController.text;
      }
    }
  }
}