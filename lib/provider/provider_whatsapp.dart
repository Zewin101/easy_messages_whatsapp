

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:url_launcher/url_launcher.dart';

class WhatsappProvider extends ChangeNotifier{

  Future<void> launchUrlWhatsapp({required numPhone, String? messageWhats}) async {

    var androidUrl = "whatsapp://send?phone=$numPhone&text=$messageWhats";
    var iosUrl = "https://wa.me/$numPhone?text=${Uri.parse('$messageWhats')}";
    var desktopUrl="https://wa.me/$numPhone/?text=${Uri.parse('$messageWhats')}&type=$numPhone&app_absent=1";
    var webUrl="https://web.whatsapp.com/send?phone=$numPhone&text=$messageWhats";

    try {
      if (Platform.isIOS) {
        await launchUrl(Uri.parse(iosUrl));
      }
      else if(Platform.isAndroid)
      {
        await launchUrl(Uri.parse(androidUrl));
      }
      else if(Platform.isWindows){
        await launchUrl(Uri.parse(desktopUrl));
      }
      else{
        await launchUrl(Uri.parse(webUrl));
      }
    } on Exception {
      EasyLoading.showError('WhatsApp is not installed.');
    }
    notifyListeners();
  }
}