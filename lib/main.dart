import 'package:easy_whats/provider/provider_massage.dart';
import 'package:easy_whats/provider/provider_setting.dart';
import 'package:easy_whats/provider/provider_whatsapp.dart';
import 'package:easy_whats/screens/email/emailScreen.dart';
import 'package:easy_whats/screens/setting/massages/addMassage.dart';
import 'package:easy_whats/screens/setting/massages/setting_massage.dart';
import 'package:easy_whats/screens/setting/setting.dart';
import 'package:easy_whats/screens/sms/smsScreen.dart';
import 'package:easy_whats/styles/myTheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'layout/home_layout/home_layout.dart';
import 'splash/splashSceern.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => MyProvider()..createDatabase()),
    ChangeNotifierProvider(create: (context) => SettingProvider()),
    ChangeNotifierProvider(create: (context) => WhatsappProvider())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeLayout.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        HomeLayout.routeName: (context) => HomeLayout(),
        AddMassage_Screen.routeName: (context) => AddMassage_Screen(),
        Massage_Setting.routeName: (context) => Massage_Setting(),
        email_screen.routeName: (context) => email_screen(),
        sms_screen.routeName: (context) => sms_screen(),
        Setting_Screen.routeName: (context) => Setting_Screen(),

      },
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}
