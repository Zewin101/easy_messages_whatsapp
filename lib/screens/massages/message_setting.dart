import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_whats/main.dart';
import 'package:easy_whats/provider/provider_whatsapp.dart';
import 'package:easy_whats/shared/componant/widget_ElevatedButton.dart';
import 'package:easy_whats/shared/componant/widget_TextFormFiled.dart';

import 'package:easy_whats/shared/componant/widgets_CardDetails.dart';
import 'package:easy_whats/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/provider_massage.dart';
import '../../provider/provider_setting.dart';
import '../../shared/componant/widget_bottomSheet.dart';
import 'addMassage.dart';

class MessageScreen extends StatelessWidget {
  MessageScreen({Key? key}) : super(key: key);
  static const String routeName = "MessageScreen";

  @override
  Widget build(BuildContext context) {
    var numberPhone = TextEditingController();
    var provider = Provider.of<MessageProvider>(context);
    var sendMassage = Provider.of<WhatsappProvider>(context);
    var setting = Provider.of<SettingProvider>(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: setting.colorSystem[setting.colorNumber],
        child: const Icon(
          Icons.add,
        ),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: AddMassage_Screen(),
                  title: Text(
                    'رسالة جديدة',
                    style: Theme.of(context).textTheme.subtitle1,
                    textAlign: TextAlign.center,
                  ),
                );
              });
        },
      ),
      body: provider.allMassage.isEmpty
          ? Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "لا يوجد رسائل محفوظة ",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Icon(Icons.sledding)
                ],
              ),
            )
          : ListView.builder(
              itemCount: provider.allMassage.length,
              itemBuilder: (context, index) {
                return CardDetails(
                  DELETE: (context) => provider.deleteRowInDatabase(
                      id: provider.allMassage[index]['id']),
                  EDIT: (context) => provider.updateDatabase(
                      title: 'title',
                      massage: 'massage',
                      id: provider.allMassage[index]['id']),
                  massage: provider.allMassage[index]['massage'],
                  title: provider.allMassage[index]['title'],
                  onTap: () {
                    AwesomeDialog(
                      context: context,
                      title: 'تعليمات',
                      desc:
                          'لارسال الرسالة الي رقم اضغط ارسال لجعل الرسالة الرسالة الرئيسية اضغط الرئيسية',
                      btnCancelOnPress: () {

                   provider.changeMessageInAllApp(index);
                      },
                      btnOkOnPress: () async {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                'تريد ارسال رسالة \n${provider.allMassage[index]['title']}',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              content: My_TextFormFiled(
                                  length: 13,
                                  controller: numberPhone,
                                  hintText: 'رقم الجوال'),
                              actions: [
                                SizedBox(
                                  width: double.infinity,
                                  child: My_ElevatedButton(
                                      onPressed: () async {
                                        await sendMassage.launchUrlWhatsapp(
                                            numPhone: numberPhone.text,
                                            messageWhats: provider
                                                .allMassage[index]['massage']);
                                      },
                                      title: 'send',
                                      icon: Icons.send),
                                )
                              ],
                            );
                          },
                        );
                      },
                      btnCancelText: 'الرئيسية',
                      btnOkText: 'ارسال',
                    ).show();
                  },
                );
              },
            ),
    );
  }
}

/// https://wsend.co/558568986
// provider.massageMaster[0]['title'] =
// provider.allMassage[index]['title'];
// provider.massageMaster[0]['massage'] =
// provider.allMassage[index]['massage'];