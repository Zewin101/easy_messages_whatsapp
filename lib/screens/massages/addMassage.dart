
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/provider_massage.dart';
import '../../provider/provider_setting.dart';

class AddMassage_Screen extends StatefulWidget {

  static const String routeName = "AddMassage_Screen";

  @override
  State<AddMassage_Screen> createState() => _AddMassage_ScreenState();
}

class _AddMassage_ScreenState extends State<AddMassage_Screen> {
  var titleController = TextEditingController();
  var massageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MessageProvider>(context);
    var setting = Provider.of<SettingProvider>(context);
    var formkey=GlobalKey<FormState>();
    return  Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  autofocus: true,
                  maxLength: 30,
                  textDirection: TextDirection.rtl,
                  controller: titleController,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    labelText: "         عنوان الرسالة",
                    labelStyle: Theme.of(context).textTheme.subtitle1,
                    prefixIcon: Icon(Icons.text_snippet_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:  BorderSide(
                        color: setting.colorSystem[setting.colorNumber],
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:  BorderSide(
                        color: setting.colorSystem[setting.colorNumber],
                        width: 2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  maxLength: 1000,
                  textDirection: TextDirection.rtl,

                  controller: massageController,
                  maxLines: 10,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    labelText: "          نص الرسالة",
                    prefixIcon: Icon(Icons.text_snippet_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:  BorderSide(
                        color: setting.colorSystem[setting.colorNumber],
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:  BorderSide(
                        color: setting.colorSystem[setting.colorNumber],
                        width: 2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: setting.colorSystem[setting.colorNumber]),
                    onPressed: () {

                      provider.insertDatabase(
                          title: titleController.text,
                          massage: massageController.text);
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Save",
                      style: Theme.of(context).textTheme.headline1,
                    )),
              ],
            ),
          ),
        ),
    );


  }
}
