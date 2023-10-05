import 'dart:async';

import 'package:flutter/material.dart';

import 'package:poolyfi/src/passengerview/views/onboardingscreen/onboarding_screen.dart';

import '../passengerview/constants/colorconstant/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => OnboardingScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(AppColorConst.yellow),
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        child: Stack(
          children: [
            Container(
              child: Image.asset(
                "assets/images/Logo.png",
                height: 250,
                width: 200,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 1,
              width: MediaQuery.of(context).size.width * 1,
              child: Image.asset(
                "assets/images/splashbg.png",
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                alignment: Alignment.centerLeft,
                // color: Colors.red,
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.55,
                child: Text(
                  "GET YOUR RIDE \n AT YOUR OWN PRICE",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(AppColorConst.black),
                      height: 1,
                      fontFamily: "Mulish",
                      fontSize: 24),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
