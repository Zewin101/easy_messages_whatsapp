import 'package:easy_whats/main.dart';
import 'package:easy_whats/provider/provider_massage.dart';
import 'package:easy_whats/provider/provider_setting.dart';
import 'package:easy_whats/provider/provider_whatsapp.dart';
import 'package:easy_whats/shared/componant/widget_ElevatedButton.dart';
import 'package:easy_whats/shared/componant/widget_TextFormFiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../styles/colors.dart';

class WhatsappScreen extends StatelessWidget {
  static const String routeName = "home";

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
                SizedBox(height: 5,),
                My_TextFormFiled(
                    // enable: false,
                    length: 500,
                    controller: MessageController,
                    hintText: '',
                    icon: Icons.whatsapp,
                    maxLines: 10),
                const SizedBox(
                  height: 15,
                ),
                My_TextFormFiled(
                  TxtDecoration: false,
                  length: 13,
                  controller: numberController,
                  hintText: 'ادخل الرقم',
                  icon: Icons.phone_in_talk_outlined,
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
                      sendWhatsapp();
                    },
                    title: 'Whatsapp',
                    icon: Icons.whatsapp),
              ],
            ),
          ),
        ),
      ),
    );
  }

  sendWhatsapp() async {
    if (formKey.currentState!.validate()) {
      await provider.launchUrlWhatsapp(
          numPhone: numberController.text,
          messageWhats: MessageController.text);

      if (providerMassage.allMassage.isEmpty ||
          providerMassage.allMassage.length == 0) {
        providerMassage.insertDatabase(
            title: titleController.text, massage: MessageController.text);
        providerMassage.id=0;
      } else if(providerMassage.allMassage.length > 0) {
        providerMassage.updateDatabase(
            title: titleController.text,
            massage: MessageController.text,
            id: providerMassage.id + 1);
        providerMassage.messageApp = MessageController.text;
        providerMassage.titleMessageApp = titleController.text;
        // sharedPreferences.setString('MasterMessage',MessageController.text);
        // sharedPreferences.setString('MasterTitle',titleController.text);
      }
    }
  }
}


///    'title': sharedPreferences.getString('MasterTitle') ?? ' الرئيسية',
///    'massage': sharedPreferences.getString('MasterMessage') ??
