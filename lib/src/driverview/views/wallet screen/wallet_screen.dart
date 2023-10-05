import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../passengerview/constants/colorconstant/colors.dart';

class DriverWalletScreen extends StatelessWidget {
  const DriverWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(AppColorConst.yellow),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(AppColorConst.black)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        // centerTitle: true,
        title: Text(
          "My Wallet",
          style: TextStyle(
              fontFamily: "Mulish-Bold",
              fontSize: 20,
              color: Color(AppColorConst.black)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 15.h,
              width: 100.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(AppColorConst.yellow)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      "Total Earning",
                      style: TextStyle(
                          fontFamily: "Mulish-Light",
                          fontSize: 18,
                          color: Color(AppColorConst.black)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "20,400 PKR",
                      style: TextStyle(
                          fontFamily: "Metropolis-ExtraBold",
                          fontSize: 40,
                          color: Color(AppColorConst.black)),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Payment History",
              style: TextStyle(
                  fontFamily: "Metropolis-Bold",
                  fontSize: 20,
                  color: Color(AppColorConst.black)),
            ),
          ],
        ),
      ),
    );
  }
}
