import 'package:easy_whats/shared/componant/widget_ElevatedButton.dart';
import 'package:easy_whats/shared/componant/widget_TextFormFiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../provider/provider_massage.dart';
import '../../provider/provider_whatsapp.dart';
import '../../styles/colors.dart';

class email_screen extends StatelessWidget {
  email_screen({Key? key}) : super(key: key);
  static const String routeName = 'email_screen';
  var numberController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var subjectController = TextEditingController();
  var txtEmailController = TextEditingController();
  var provider;
  var providerMassage;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<WhatsappProvider>(context);
    providerMassage = Provider.of<MessageProvider>(context);
    subjectController.text = providerMassage.massageMaster[0]['title'];
    txtEmailController.text = providerMassage.massageMaster[0]['massage'];
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
                const SizedBox(
                  height: 15,
                ),
                My_TextFormFiled(
                  TxtDecoration: false,
                  icon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                  length: 50,
                  controller: emailController,
                  hintText: 'ادخل الايميل',
                  validator: (value) {
                    if (value?.trim() == '' || value!.isEmpty) {
                      return 'لم تقم بكتابة الرقم ';
                    }
                    if (numberController.text.length < 10) {
                      final bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value);
                      if (!emailValid) {
                        return 'تأكد من كتابة الايميل بطريقة صحيحة';
                      }
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                My_TextFormFiled(
                  length: 20,
                  icon: Icons.title,
                  controller: subjectController,
                  hintText: 'عنوان الرسالة     ',
                  validator: (value) {
                    if (value?.trim() == '' || value!.isEmpty) {
                      return 'لم تقم بكتابة عنوان الرسالة ';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                My_TextFormFiled(
                  icon: Icons.text_snippet_rounded,
                  maxLines: 8,
                  length: 50,
                  controller: txtEmailController,
                  hintText: 'نص الرسالة',
                  validator: (value) {
                    if (value?.trim() == '' || value!.isEmpty) {
                      return 'لم تقم بكتابة نص الرسالة ';
                    }

                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                My_ElevatedButton(
                    icon: Icons.send,
                    onPressed: () async {
                      await sendEmail();
                    },
                    title: 'Send'),
              ],
            ),
          ),
        ),
      ),
    );
  }

   sendEmail() async {
    if (formKey.currentState!.validate()) {
      await provider.launchUrlEmail(
          massage: txtEmailController.text,
          title: subjectController.text,
          email: emailController.text);
    }
  }
}
