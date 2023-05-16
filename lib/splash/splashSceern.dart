// import 'dart:async';
// import 'package:easy_whats/generated/assets.dart';
// import 'package:flutter/material.dart';
// import '../layout/home_layout/home_layout.dart';
//
// class SplashScreen extends StatefulWidget {
//
//   static const String routeName = 'SplashScreen';
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   Widget build(BuildContext context) {
//     Timer(
//        Duration(seconds: 3),
//        () => Navigator.pushReplacementNamed(context, HomeLayout.routeName),
//     );
//
//     return Scaffold(
//       body: Column(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Expanded(
//             child: Center(
//               child: Container(
//                 color: Colors.white,
//                 child: const Center(
//                   child: Image(
//                     image: AssetImage(Assets.imageBack1),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Text('MOHAMMED ZEWIN',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
//         ],
//       ), //<- place where the image appears
//     );
//   }
// }

import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:easy_whats/generated/assets.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../layout/home_layout/home_layout.dart';
import '../provider/provider_setting.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);
  static const String routeName = 'splash';

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    var setting = Provider.of<SettingProvider>(context);
    return EasySplashScreen(
      logo: Image.asset(setting.splashScreen[setting.colorNumber]),
      title: Text(
        "easy message pro",
        style: TextStyle(
          fontSize: 30,


        ),
      ),
      backgroundColor: setting.cardColor[setting.colorNumber],
      showLoader: true,
      loadingText: Text("Loading..."),
      navigator: HomeLayout(),
      durationInSeconds: 5,
      logoWidth: 50,
    );
  }
}
