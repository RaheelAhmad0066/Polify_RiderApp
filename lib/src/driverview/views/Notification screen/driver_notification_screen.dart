import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../passengerview/constants/colorconstant/colors.dart';

class DriverNotificationScreen extends StatelessWidget {
  const DriverNotificationScreen({Key? key}) : super(key: key);

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
          "Notifications",
          style: TextStyle(
              fontFamily: "Mulish-Bold",
              fontSize: 20,
              color: Color(AppColorConst.black)),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 100.h,
          width: 100.w,
          child: Column(
            children: [
              Expanded(
                  flex: 9,
                  child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          height: 10.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 0),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: CircleAvatar(
                                    radius: 20,
                                    backgroundColor:
                                        Color(AppColorConst.yellow),
                                    child: Icon(
                                      Icons.notifications_active,
                                      size: 20,
                                      color: Color(AppColorConst.black),
                                    ),
                                  ),
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "New Request",
                                        style: TextStyle(
                                            fontFamily: "Mulish-Bold",
                                            fontSize: 16),
                                      ),
                                      Text(
                                        "17/10 10:00 AM",
                                        style: TextStyle(
                                            fontFamily: "Mulish-Regular",
                                            fontSize: 12),
                                      ),
                                    ],
                                  ),
                                  subtitle: Text(
                                    "A new Passenger ride has been posted near you, click for more details!",
                                    style: TextStyle(
                                        fontFamily: "Mulish-Regular",
                                        fontSize: 13),
                                  ),
                                ),
                                Divider(
                                  thickness: 2,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  )),
              Expanded(
                flex: 1,
                child: Container(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
