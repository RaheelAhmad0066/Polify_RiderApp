import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:poolyfi/src/driverview/views/DriverDrawer/driver_drawer.dart';
import 'package:poolyfi/src/passengerview/constants/colorconstant/colors.dart';
import 'package:poolyfi/src/passengerview/views/drawer/drawer.dart';
import 'package:sizer/sizer.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  image: DecorationImage(
                    image: AssetImage("assets/images/welcomeBg.jpg"),
                    fit: BoxFit.cover,
                  )),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.black.withOpacity(0.8),
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 20.h,
                      width: 60.w,
                      child: Lottie.asset("assets/images/lottie_image.json")),
                  Text(
                    textAlign: TextAlign.center,
                    "Welcome to Poolyfi\nRide Sharing",
                    style: TextStyle(
                        height: 1.3,
                        fontFamily: "Metropolis-Bold",
                        fontSize: 34,
                        color: Color(AppColorConst.white)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  DriverDrawerScreen()));
                    },
                    child: Container(
                      height: 7.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(AppColorConst.yellow),
                      ),
                      child: Center(
                        child: Text(
                          "Become a Passenger",
                          style: TextStyle(
                              color: Color(AppColorConst.black),
                              fontFamily: "Poppins-Medium",
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  MainDrawerScreen()));
                    },
                    child: Container(
                      height: 7.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(AppColorConst.yellow),
                      ),
                      child: Center(
                        child: Text(
                          "Become a Driver",
                          style: TextStyle(
                              color: Color(AppColorConst.black),
                              fontFamily: "Poppins-Medium",
                              fontSize: 18),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
