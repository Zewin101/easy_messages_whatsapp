import 'package:auto_size_text/auto_size_text.dart';
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
              TextFormField(
                autofocus:true ,
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
                    borderSide: BorderSide(
                      color: setting.colorSystem[setting.colorNumber],
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: setting.colorSystem[setting.colorNumber],
                      width: 2,
                    ),
                  ),
                ),
                textInputAction:TextInputAction.next ,
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                maxLength: 1000,
                textInputAction:TextInputAction.next ,
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
                    borderSide: BorderSide(
                      color: setting.colorSystem[setting.colorNumber],
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
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
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          setting.colorSystem[setting.colorNumber]),
                  onPressed: () {
                  if(formkey.currentState!.validate()){
                    providerMessage.updateDatabase(
                        title: titleController.text,
                        massage: massageController.text,
                        id: widget.index);
                    Navigator.pop(context);
                  }

                  },
                  child: Text(
                    "تعديل",
                    style: Theme.of(context).textTheme.headline1,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
