import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_whats/main.dart';
import 'package:easy_whats/provider/provider_whatsapp.dart';
import 'package:easy_whats/screens/massages/updateMassage.dart';
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
  static const String routeName = "MessageScreen";
  var numberPhone;
  late MessageProvider providerMessage;
  var sendMassage;
  var setting;

  @override
  Widget build(BuildContext context) {
    var numberPhone = TextEditingController();
    providerMessage = Provider.of<MessageProvider>(context);
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
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddMassage_Screen(),
                );
              });
        },
      ),
      body: providerMessage.allMassage.isEmpty
          ? Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "لا يوجد رسائل محفوظة ",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Icon(Icons.do_not_disturb_on_outlined),
                ],
              ),
            )
          : ListView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              itemCount: providerMessage.allMassage.length,
              itemBuilder: (context, index) {
                return CardDetails(
                  DELETE: (context) async {
                    await deleteData(index);
                    await providerMessage.chackAllMassage(index);
                  },
                  EDIT: (context) async {
                    await updateData(index, context);
                  },
                  massage: providerMessage.allMassage[index]['massage'],
                  title: providerMessage.allMassage[index]['title'],
                  onTap: () {
                    AwesomeDialog(
                      context: context,
                      title: 'تعليمات',
                      desc:
                          'لارسال الرسالة الي رقم اضغط ارسال لجعل الرسالة الرسالة الرئيسية اضغط الرئيسية',
                      btnCancelOnPress: () async {
                        await providerMessage.changeMessageInAllApp(index);
                        providerMessage.id = index;
                        print('index------.$index');
                        sharedPreferences.setInt('id', index);
                        print(providerMessage.messageApp);
                      },
                      btnOkOnPress: () async {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return SingleChildScrollView(
                              child: AlertDialog(
                                title: Text(
                                  'تريد ارسال رسالة \n${providerMessage.allMassage[index]['title']}\n '
                                      '${providerMessage.allMassage[index]['massage']}',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                                content: My_TextFormFiled(
                                  length: 13,
                                  controller: numberPhone,
                                  hintText: 'رقم الجوال',
                                  icon: Icons.phone_in_talk,
                                  keyboardType: TextInputType.number,
                                ),
                                actions: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: Column(
                                      children: [
                                        My_ElevatedButton(
                                            onPressed: () async {
                                              await sendMassage.launchUrlWhatsapp(
                                                  numPhone: numberPhone.text,
                                                  messageWhats: providerMessage
                                                          .allMassage[index]
                                                      ['massage']);
                                            },
                                            title: 'send whatsapp',
                                            icon: Icons.send),
                                        My_ElevatedButton(
                                            onPressed: () async {
                                              await sendMassage.launchUrlWhatsapp(
                                                  numPhone: numberPhone.text,
                                                  messageWhats: providerMessage
                                                          .allMassage[index]
                                                      ['massage']);
                                            },
                                            title: 'send sms',
                                            icon: Icons.send),
                                        My_ElevatedButton(
                                            onPressed: () async {
                                              await sendMassage.launchUrlWhatsapp(
                                                  numPhone: numberPhone.text,
                                                  messageWhats: providerMessage
                                                          .allMassage[index]
                                                      ['massage']);
                                            },
                                            title: 'send email',
                                            icon: Icons.send),
                                        My_ElevatedButton(
                                            onPressed: () async {
                                             Navigator.pop(context);
                                            },
                                            title: 'close',
                                            icon: Icons.close),
                                      ],
                                    ),
                                  )
                                ],
                              ),
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

  updateData(index, BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        print('ddddddddddddddddddddddddddd-------------->$index');
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: UpdateMassage_Screen(
            index: index,
          ),
        );
      },
      isScrollControlled: true,
    );
  }

  deleteData(int index) {
    providerMessage.deleteRowInDatabase(
        id: providerMessage.allMassage[index]['id']);
    print(index);
  }
}

/// https://wsend.co/558568986
// provider.massageMaster[0]['title'] =
// provider.allMassage[index]['title'];
// provider.massageMaster[0]['massage'] =
// provider.allMassage[index]['massage'];
