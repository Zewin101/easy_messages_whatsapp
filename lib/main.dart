import 'package:easy_whats/provider/provider_massage.dart';
import 'package:easy_whats/provider/provider_setting.dart';
import 'package:easy_whats/provider/provider_whatsapp.dart';
import 'package:easy_whats/screens/email/emailScreen.dart';
import 'package:easy_whats/screens/massages/addMassage.dart';
import 'package:easy_whats/screens/massages/message_setting.dart';

import 'package:easy_whats/screens/sms/smsScreen.dart';

import 'package:easy_whats/styles/myTheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'layout/home_layout/home_layout.dart';
import 'splash/splashSceern.dart';

late SharedPreferences sharedPreferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences=await SharedPreferences.getInstance();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) =>
    MessageProvider()
      ..createDatabase()),
    ChangeNotifierProvider(create: (context) => SettingProvider()),
    ChangeNotifierProvider(create: (context) => WhatsappProvider())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {



    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeLayout.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        HomeLayout.routeName: (context) => HomeLayout(),
        AddMassage_Screen.routeName: (context) => AddMassage_Screen(),
        MessageScreen.routeName: (context) => MessageScreen(),
        email_screen.routeName: (context) => email_screen(),
        sms_screen.routeName: (context) => sms_screen(),


      },
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}
