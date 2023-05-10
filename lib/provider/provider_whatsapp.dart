

import 'dart:io';

import 'package:easy_whats/styles/colors.dart';
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
  Future<void> launchUrlSms({required numPhone, String? messageSms}) async {
    var androidUrl = "sms:$numPhone?body=$messageSms";
    var iosUrl = 'sms:$numPhone&body=$messageSms';
    try {
      if (Platform.isIOS) {
        await launchUrl(Uri.parse(iosUrl));
      }
      else if(Platform.isAndroid)
      {
        await launchUrl(Uri.parse(androidUrl));
      }

    } on Exception {
      EasyLoading.showError('sms is not found.');
    }
    notifyListeners();
  }
  Future<void> launchUrlCall({required numPhone, String? messageSms}) async {
    var androidUrl = 'tel:$numPhone';
    var iosUrl = 'tel:$numPhone';
    try {
      if (Platform.isIOS) {
        await launchUrl(Uri.parse(iosUrl));
      }
      else if(Platform.isAndroid)
      {
        await launchUrl(Uri.parse(androidUrl));
      }

    } on Exception {
      EasyLoading.showError('sms is not found.');
    }
    notifyListeners();
  }
  Future<void> launchUrlEmail({required String email,required String title,required String massage}) async {
    try {
     var uri= Uri(
        scheme: 'mailto',
        path: email,
        query: 'subject=$title&body=$massage',
      );

      if (await launchUrl(uri)) {
        await launchUrl(uri);
      } else {
        throw 'Could not launch $uri';
      }

    } on Exception {
      EasyLoading.showError('sms is not found.');
    }
    notifyListeners();
  }





}