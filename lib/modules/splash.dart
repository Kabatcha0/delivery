import 'dart:async';

import 'package:delivery/components/navigator.dart';
import 'package:delivery/modules/onboarding.dart';
import 'package:delivery/shared/const.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      navigatorRemoveUntil(context: context, widget: const OnBoarding());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(Const.colorOfSplash),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SizedBox(
          width: 200,
          height: 200,
          child: Image.asset("assets/splash.png"),
        ),
      ),
    );
  }
}
