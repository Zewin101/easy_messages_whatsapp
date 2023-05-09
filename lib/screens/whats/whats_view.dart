import 'package:easy_whats/provider/provider_massage.dart';
import 'package:easy_whats/provider/provider_whatsapp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../styles/colors.dart';

class WhatsappScreen extends StatelessWidget {
  static const String routeName = "home";

  var numberController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<WhatsappProvider>(context);
    var providerMassage = Provider.of<MyProvider>(context);
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
                TextFormField(
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(13),
                  ],
                  controller: numberController,
                  decoration: InputDecoration(
                    hintText: "                ادخل الرقم ",
                    hintStyle: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        color: MASTERCOLOR),
                    prefixIcon: Icon(Icons.phone),
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Container(
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: MASTERCOLOR, // foreground
                        ),
                        onPressed: () async {
                          await provider.launchUrlWhatsapp(
                              numPhone: numberController.text,
                              messageWhats: providerMassage.massageMaster[0]
                                  ['massage']);
                        },
                        child: const Text(
                          "Whatsapp",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Container(
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: MASTERCOLOR, // foreground
                        ),
                        onPressed: () {},
                        child: const Text(
                          "SMS",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Container(
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: MASTERCOLOR, // foreground
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Call",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
