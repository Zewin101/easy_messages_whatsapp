import 'package:easy_whats/shared/componant/widget_Bottome.dart';
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
  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<WhatsappProvider>(context);
    var providerMassage = Provider.of<MessageProvider>(context);
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
                Widget_TextFormFiled(
                  icon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                  length: 50,
                  controller: controller,
                  hintText: 'ادخل الايميل',
                  validator: (value) {},
                ),
                const SizedBox(
                  height: 15,
                ),
                Widget_TextFormFiled(
                  length: 20,
                  icon: Icons.title,
                  controller: controller,
                  hintText: 'عنوان الرسالة     ',
                  validator: (value) {},
                ),
                const SizedBox(
                  height: 15,
                ),
                Widget_TextFormFiled(
                  icon: Icons.text_snippet_rounded,
                  maxLines: 8,
                  length: 50,
                  controller: controller,
                  hintText: 'نص الرسالة',
                  validator: (value) {},
                ),
                const SizedBox(
                  height: 15,
                ),
                Widget_MyButton(
                    onPressed: () async {
                      await provider.launchUrlEmail(
                        massage: providerMassage.massageMaster[0]['massage'],
                        title: providerMassage.massageMaster[0]['title'],
                        email: '01200361136R@GMAIL.COM',
                      );
                    },
                    title: 'ارسال'),
                // Padding(
                //   padding:
                //       const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
                //   child: Container(
                //     height: 40,
                //     child: ElevatedButton(
                //         style: ElevatedButton.styleFrom(
                //           foregroundColor: Colors.white,
                //           backgroundColor: MASTERCOLOR, // foreground
                //         ),
                //         onPressed: () async {
                //           await provider.launchUrlEmail(
                //             massage: providerMassage.massageMaster[0]
                //                 ['massage'],
                //             title: providerMassage.massageMaster[0]['title'],
                //             email: '01200361136R@GMAIL.COM',
                //           );
                //         },
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceAround,
                //           children: [
                //             const Text(
                //               "ارسال",
                //               style: TextStyle(
                //                   fontSize: 20, fontWeight: FontWeight.bold),
                //             ),
                //             Icon(Icons.send, size: 20),
                //           ],
                //         )),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
