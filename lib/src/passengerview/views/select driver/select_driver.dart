import 'package:flutter/material.dart';
import 'package:poolyfi/src/passengerview/views/ride%20details/ride_details.dart';
import 'package:poolyfi/src/passengerview/views/homescreen/fare_box.dart';
import 'package:poolyfi/src/passengerview/views/select%20driver/cancel_ride.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colorconstant/colors.dart';

class SelectDriver extends StatefulWidget {
  const SelectDriver({Key? key}) : super(key: key);

  @override
  State<SelectDriver> createState() => _SelectDriverState();
}

class _SelectDriverState extends State<SelectDriver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 100.h,
          width: 100.w,
          child: Column(
            children: [
              Expanded(
                  flex: 9,
                  child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 30.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(AppColorConst.yellow),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: CircleAvatar(
                                    radius: 30,
                                    backgroundImage:
                                        AssetImage("assets/images/p1.jpg"),
                                  ),
                                  title: Text(
                                    "Suzuki Alto",
                                    style: TextStyle(
                                        fontFamily: "Mulish-Medium",
                                        fontSize: 16),
                                  ),
                                  subtitle: Column(
                                    children: [
                                      Text(
                                        "Muhammad Asif",
                                        style: TextStyle(
                                            fontFamily: "Mulish-Regular",
                                            fontSize: 12),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.favorite,
                                            size: 18,
                                            color: Colors.red,
                                          ),
                                          SizedBox(
                                            width: 1.w,
                                          ),
                                          Text(
                                            "4.9",
                                            style: TextStyle(
                                                fontFamily: "Mulish-Regular",
                                                fontSize: 12),
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Text(
                                            "(86)",
                                            style: TextStyle(
                                                fontFamily: "Mulish-Regular",
                                                fontSize: 12),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  trailing: Text(
                                    "PKR440",
                                    style: TextStyle(
                                        fontFamily: "Mulish-ExtraBold",
                                        fontSize: 18.sp),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "2 Min",
                                      style: TextStyle(
                                          fontFamily: "Mulish-Regular",
                                          fontSize: 14.sp),
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Text(
                                      "|",
                                      style: TextStyle(
                                          fontFamily: "Mulish-Regular",
                                          fontSize: 14.sp),
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Text(
                                      "600 meter",
                                      style: TextStyle(
                                          fontFamily: "Mulish-Regular",
                                          fontSize: 14.sp),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      size: 12,
                                    ),
                                    Text(
                                      "26/OCT/2022",
                                      style: TextStyle(
                                          fontFamily: "Mulish-Regular",
                                          fontSize: 12),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "at",
                                      style: TextStyle(
                                          fontFamily: "Mulish-Regular",
                                          fontSize: 12),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "9:00:AM",
                                      style: TextStyle(
                                          fontFamily: "Mulish-Regular",
                                          fontSize: 12),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "|",
                                      style: TextStyle(
                                          fontFamily: "Mulish-Regular",
                                          fontSize: 12),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Malir City Near Airport karachi",
                                      style: TextStyle(
                                          fontFamily: "Mulish-Regular",
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                CircleAvatar(
                                  radius: 2,
                                  backgroundColor: Colors.white,
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                CircleAvatar(
                                  radius: 2,
                                  backgroundColor: Colors.white,
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                CircleAvatar(
                                  radius: 2,
                                  backgroundColor: Colors.white,
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      size: 12,
                                    ),
                                    Text(
                                      "26/OCT/2022",
                                      style: TextStyle(
                                          fontFamily: "Mulish-Regular",
                                          fontSize: 12),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "at",
                                      style: TextStyle(
                                          fontFamily: "Mulish-Regular",
                                          fontSize: 12),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "10:00 AM",
                                      style: TextStyle(
                                          fontFamily: "Mulish-Regular",
                                          fontSize: 12),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "|",
                                      style: TextStyle(
                                          fontFamily: "Mulish-Regular",
                                          fontSize: 14),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Guslhane-e-Iqbal Block 9",
                                      style: TextStyle(
                                          fontFamily: "Mulish-Regular",
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                        "Decline",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 40, vertical: 10), backgroundColor: Color(AppColorConst.light_gray),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    RideDetails())));
                                      },
                                      child: Text(
                                        "Accept",
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 40, vertical: 10), backgroundColor: Color(AppColorConst.light_gray),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                      ),
                                    )
                                  ],
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton.extended(
                heroTag: Text("data"),
                label: Text(
                  "Edit Seats",
                  style: TextStyle(fontSize: 18, fontFamily: "Poppins-Bold"),
                ),
                backgroundColor: Colors.green,
                icon: Icon(Icons.edit),
                onPressed: () {
                  fareshowDialog(context);
                }),
            SizedBox(
              width: 2.w,
            ),
            FloatingActionButton.extended(
                heroTag: Text("data"),
                label: Text("Cancel",
                    style: TextStyle(fontSize: 18, fontFamily: "Poppins-Bold")),
                backgroundColor: Colors.red,
                icon: Icon(Icons.close),
                onPressed: () {
                  rideCancelAlertDialog(context);
                }),
          ],
        ),
      ),
    );
  }
}
