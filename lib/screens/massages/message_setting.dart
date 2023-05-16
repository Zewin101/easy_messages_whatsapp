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

class MessageScreen extends StatefulWidget {
  static const String routeName = "MessageScreen";

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  var numberPhone;

  late MessageProvider providerMessage;

  var sendMassage;

  var setting;

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  bool isBottomSheetShow = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var numberPhone = TextEditingController();
    providerMessage = Provider.of<MessageProvider>(context);
    var sendMassage = Provider.of<WhatsappProvider>(context);
    var setting = Provider.of<SettingProvider>(context);
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.transparent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: isBottomSheetShow
            ?setting.cardColor[setting.colorNumber]
            : setting.colorSystem[setting.colorNumber],
        child: isBottomSheetShow
            ? Icon(Icons.edit)
            : Icon(
                Icons.add,
              ),
        onPressed: () {
          if (isBottomSheetShow) {
            isBottomSheetShow = false;
            print(isBottomSheetShow);
            Navigator.pop(context);
            setState(() {});
          } else {
            isBottomSheetShow = true;
            print(isBottomSheetShow);
            scaffoldKey.currentState!
                .showBottomSheet(
                  (context) {
                    return Container(
                        color: Colors.transparent, child: AddMassage_Screen());
                  },
                  elevation: 30,
                )
                .closed
                .then((value) {
                  print('vvvv $value');
                  isBottomSheetShow = false;
                  setState(() {});
                });
            setState(() {});
          }
          ;
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
              itemCount: providerMessage.allMassage.length,
              itemBuilder: (context, index) {
                return CardDetails(
                  DELETE: (context) async {
                    showDialog(
                        context: context,
                        builder: (context) => Container(
                              child: AlertDialog(
                                backgroundColor: setting
                                    .colorSystem[setting.colorNumber]
                                    .withOpacity(0.2),
                                alignment: Alignment.center,
                                title: Text(
                                  'هل تريد حذف الرسالة',
                                  textAlign: TextAlign.center,
                                ),
                                actions: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.green,
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text('لا')),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.red,
                                            ),
                                            onPressed: () async {
                                              await deleteData(index);
                                              await providerMessage.chackAllMassage(index);
                                              Navigator.pop(context);
                                            },
                                            child: Text('نعم')),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ));
                  },
                  EDIT: (context) async {
                    if (setting.isBottomSheetShow) {
                      Navigator.pop(context);
                    } else {
                      setting.iconBottomSheetChange();
                      scaffoldKey.currentState!
                          .showBottomSheet((context) {
                            return Container(
                                color: Colors.transparent,
                                child: UpdateMassage_Screen(
                                  index: index,
                                ));
                          })
                          .closed
                          .then((value) {
                            setting.iconBottomSheetChange();
                          });
                    }
                    ;
                  },
                  massage: providerMessage.allMassage[index]['massage'],
                  title: providerMessage.allMassage[index]['title'],
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => Container(
                              child: AlertDialog(
                                backgroundColor: setting
                                    .colorSystem[setting.colorNumber]
                                    .withOpacity(0.2),
                                alignment: Alignment.center,
                                title: Text(
                                  'لارسال الرسالة الي رقم اضغط ارسال لجعل الرسالة الرسالة الرئيسية اضغط الرئيسية',
                                  style: Theme.of(context).textTheme.subtitle2,
                                  textAlign: TextAlign.center,
                                ),
                                actions: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.green,
                                            ),
                                            onPressed: () async {
                                              await providerMessage
                                                  .changeMessageInAllApp(index);
                                              providerMessage.id = index;
                                              print('index------.$index');
                                              sharedPreferences.setInt(
                                                  'id', index);
                                              print(providerMessage.messageApp);
                                              Navigator.pop(context);
                                            },
                                            child: Text('الرئيسية')),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.blue,
                                            ),
                                            onPressed: () async {
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return SingleChildScrollView(
                                                    child: AlertDialog(
                                                      title: Text(
                                                        'تريد ارسال رسالة \n${providerMessage.allMassage[index]['title']}\n '
                                                        '${providerMessage.allMassage[index]['massage']}',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .subtitle1,
                                                      ),
                                                      content: Form(
                                                        key: formKey,
                                                        child: My_TextFormFiled(
                                                          validator: (value) {
                                                            if (value!
                                                                    .isEmpty ||
                                                                value == '') {
                                                              return 'اكتب رقم الجوال';
                                                            }
                                                            return null;
                                                          },
                                                          length: 13,
                                                          controller:
                                                              numberPhone,
                                                          hintText:
                                                              'رقم الجوال   |  الايميل',
                                                          keyboardType:
                                                              TextInputType
                                                                  .emailAddress,
                                                        ),
                                                      ),
                                                      actions: [
                                                        SizedBox(
                                                          width:
                                                              double.infinity,
                                                          child: Column(
                                                            children: [
                                                              My_ElevatedButton(
                                                                  onPressed:
                                                                      () async {
                                                                    if (formKey
                                                                        .currentState!
                                                                        .validate()) {
                                                                      await sendMassage.launchUrlWhatsapp(
                                                                          numPhone: numberPhone
                                                                              .text,
                                                                          messageWhats:
                                                                              providerMessage.allMassage[index]['massage']);
                                                                    }
                                                                  },
                                                                  title:
                                                                      'send whatsapp',
                                                                  icon: Icons
                                                                      .send),
                                                              My_ElevatedButton(
                                                                  onPressed:
                                                                      () async {
                                                                    if (formKey
                                                                        .currentState!
                                                                        .validate()) {
                                                                      await sendMassage.launchUrlSms(
                                                                          numPhone: numberPhone
                                                                              .text,
                                                                          messageSms:
                                                                              providerMessage.allMassage[index]['massage']);
                                                                    }
                                                                  },
                                                                  title:
                                                                      'send sms',
                                                                  icon: Icons
                                                                      .send),
                                                              My_ElevatedButton(
                                                                  onPressed:
                                                                      () async {
                                                                    if (formKey
                                                                        .currentState!
                                                                        .validate()) {
                                                                      await sendMassage.launchUrlEmail(
                                                                          email: numberPhone
                                                                              .text,
                                                                          title: providerMessage.allMassage[index]
                                                                              [
                                                                              'title'],
                                                                          massage:
                                                                              providerMessage.allMassage[index]['massage']);
                                                                    }
                                                                  },
                                                                  title:
                                                                      'send email',
                                                                  icon: Icons
                                                                      .send),
                                                              My_ElevatedButton(
                                                                  onPressed:
                                                                      () async {
                                                                    Navigator.pop(
                                                                        context);
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  title:
                                                                      'close',
                                                                  icon: Icons
                                                                      .close),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                },
                                                 
                                              );
                                            },
                                            child: Text('ارسال')),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ));
                  },
                );
              },
            ),
    );
  }

  deleteData(int index) async {
    await providerMessage.deleteRowInDatabase(
        id: providerMessage.allMassage[index]['id']);
    print(index);
  }
}
