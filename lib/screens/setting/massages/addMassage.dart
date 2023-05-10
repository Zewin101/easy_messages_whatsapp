import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/provider_massage.dart';

import '../../../styles/colors.dart';

class AddMassage_Screen extends StatefulWidget {
  AddMassage_Screen({Key? key}) : super(key: key);
  static const String routeName = "AddMassage_Screen";

  @override
  State<AddMassage_Screen> createState() => _AddMassage_ScreenState();
}

class _AddMassage_ScreenState extends State<AddMassage_Screen> {
  var titleController = TextEditingController();
  var massageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('رسالة جديدة'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          // key: cubit.formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  color: MASTERCOLOR,
                  elevation: 20,
                  shadowColor: MASTERCOLOR,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200,
                      height: 100,
                      child: AutoSizeText(
                        provider.allMassage.isEmpty
                            ? 'السلام عليكم ورحمة الله وبركاتة'
                            : provider.massageMaster[0]['massage'],
                        textAlign: TextAlign.right,
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  maxLength: 30,
                  textDirection: TextDirection.rtl,
                  controller: titleController,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                  decoration: InputDecoration(
                    labelText: "         عنوان الرسالة",
                    prefixIcon: Icon(Icons.text_snippet_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: MASTERCOLOR,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: MASTERCOLOR,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  maxLength: 1000,
                  textDirection: TextDirection.rtl,
                  controller: massageController,
                  maxLines: 3,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                  decoration: InputDecoration(
                    labelText: "          نص الرسالة",
                    prefixIcon: Icon(Icons.text_snippet_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: MASTERCOLOR,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: MASTERCOLOR,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: MASTERCOLOR),
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
      ),
    );
  }
}
