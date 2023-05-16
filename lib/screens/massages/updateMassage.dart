import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_whats/shared/componant/widget_ElevatedButton.dart';
import 'package:easy_whats/shared/componant/widget_TextFormFiled.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/provider_massage.dart';

import '../../../styles/colors.dart';
import '../../provider/provider_setting.dart';

class UpdateMassage_Screen extends StatefulWidget {
  int index;

  UpdateMassage_Screen({Key? key, required this.index}) : super(key: key);
  static const String routeName = "UpdateMassage_Screen";

  @override
  State<UpdateMassage_Screen> createState() => _UpdateMassage_ScreenState();
}

class _UpdateMassage_ScreenState extends State<UpdateMassage_Screen> {
  var titleController = TextEditingController();
  var massageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var providerMessage = Provider.of<MessageProvider>(context);
    var setting = Provider.of<SettingProvider>(context);
    titleController.text = providerMessage.allMassage[widget.index]['title'];
    massageController.text =
        providerMessage.allMassage[widget.index]['massage'];
    var formkey = GlobalKey<FormState>();
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              My_TextFormFiled(
                length: 30,
                controller: titleController,
                hintText: "         عنوان الرسالة",
                TxtDecoration: true,

              ),

              const SizedBox(
                height: 5,
              ),
              My_TextFormFiled(
                length: 1000,
                controller: massageController,
                hintText: "          نص الرسالة",
                TxtDecoration: true,
              ),

              const SizedBox(
                height: 5,
              ),
              My_ElevatedButton(
                  onPressed: () async {
                    if (formkey.currentState!.validate()) {
                      await providerMessage.updateDatabase(
                          title: titleController.text,
                          massage: massageController.text,
                          id: providerMessage.allMassage[widget.index]['id']);
                      Navigator.pop(context);
                    }
                  },
                  title: "تعديل",
                  icon: Icons.edit),
            ],
          ),
        ),
      ),
    );
  }
}
