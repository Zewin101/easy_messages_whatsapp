import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_whats/provider/provider_whatsapp.dart';
import 'package:easy_whats/screens/setting/addMassage.dart';
import 'package:easy_whats/shared/widget/widgets_CardDetails.dart';

import 'package:easy_whats/styles/colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../provider/provider_massage.dart';

class Setting_Screen extends StatelessWidget {
  Setting_Screen({Key? key}) : super(key: key);
  static const String routeName = "setting";

  @override
  Widget build(BuildContext context) {
    var numberPhone = TextEditingController();
    var provider = Provider.of<MyProvider>(context);
    var sendMassage = Provider.of<WhatsappProvider>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
        ),
        onPressed: () {
          Navigator.pushNamed(context, AddMassage_Screen.routeName);
        },
      ),
      body: provider.allMassage.isEmpty
          ? const Center(child: Text("لا يوجد رسائل محفوظة "))
          : ListView.builder(
              itemCount: provider.allMassage.length,
              itemBuilder: (context, index) {
                return CardDetails(
                  massage: provider.allMassage[index]['massage'],
                  title: provider.allMassage[index]['title'],
                  onTap: () {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.info,
                      animType: AnimType.rightSlide,
                      title: 'تعليمات',
                      desc:
                          'لارسال الرسالة الي رقم اضغط ارسال لجعل الرسالة الرسالة الرئيسية اضغط الرئيسية',
                      btnCancelOnPress: () {
                        provider.massageMaster[0]['title'] = provider.allMassage[index]['title'];
                        provider.massageMaster[0]['massage'] = provider.allMassage[index]['massage'];
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
                              content: TextFormField(
                                controller: numberPhone,
                                decoration: InputDecoration(
                                  hintText: 'رقم الجوال',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: MASTERCOLOR),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: MASTERCOLOR),
                                  ),
                                ),
                              ),
                              actions: [
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: MASTERCOLOR),
                                      onPressed: () async {
                                        await sendMassage.launchUrlWhatsapp(
                                            numPhone: numberPhone.text,
                                            messageWhats: provider
                                                .allMassage[index]['massage']);
                                      },
                                      child: Text('go')),
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
