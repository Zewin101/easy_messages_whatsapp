import 'dart:async';
import 'package:easy_whats/generated/assets.dart';
import 'package:flutter/material.dart';
import '../layout/home_layout/home_layout.dart';

class SplashScreen extends StatefulWidget {

  static const String routeName = 'SplashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(
       Duration(seconds: 3),
       () => Navigator.pushReplacementNamed(context, HomeLayout.routeName),
    );

    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Container(
                color: Colors.white,
                child: const Center(
                  child: Image(
                    image: AssetImage(Assets.imageLoading),
                  ),
                ),
              ),
            ),
          ),
          Text('MOHAMMED ZEWIN',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
        ],
      ), //<- place where the image appears
    );
  }
}
