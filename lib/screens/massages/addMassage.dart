import 'package:easy_whats/shared/componant/widget_ElevatedButton.dart';
import 'package:easy_whats/shared/componant/widget_TextFormFiled.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/provider_massage.dart';
import '../../provider/provider_setting.dart';

class AddMassage_Screen extends StatelessWidget {
  static const String routeName = "AddMassage_Screen";

  var titleController = TextEditingController();
  var massageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MessageProvider>(context);
    var setting = Provider.of<SettingProvider>(context);
    var formkey = GlobalKey<FormState>();
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 16, right: 16, bottom: 10),
      child: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color:setting.colorSystem[setting.colorNumber] ,
                ),
                height: 45,

                child: Text(
                  "اضافة رسالة جديدة",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              My_TextFormFiled(
                length: 30,
                controller: titleController,
                hintText: "         عنوان الرسالة",
              ),
              const SizedBox(
                height: 5,
              ),
              My_TextFormFiled(
                length: 1000,
                controller: massageController,
                hintText: "          نص الرسالة",
                maxLines: 10,
              ),
              const SizedBox(
                height: 5,
              ),
              My_ElevatedButton(
                  onPressed: () {
                    provider.insertDatabase(
                        title: titleController.text,
                        massage: massageController.text);
                    Navigator.pop(context);
                  },
                  title: "Save",
                  icon: Icons.save),
            ],
          ),
        ),
      ),
    );
  }
}
