import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/colorconstant/colors.dart';

class PastTripScreen extends StatelessWidget {
  const PastTripScreen({Key? key}) : super(key: key);

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
                  flex: 4,
                  child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Column(
                              children: [
                                Text(
                                  'Seats: 04',
                                  style: TextStyle(
                                      fontSize: 20, fontFamily: "Poppins-Bold"),
                                ),
                                ListTile(
                                  leading: Icon(
                                    Icons.location_on,
                                    size: 25,
                                    // color: Color(AppColorConst.black),
                                  ),
                                  title: const Text(
                                    'Pickup Location',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: "Poppins-Medium"),
                                  ),
                                  subtitle: const Text(
                                    'Guslshan-e-Iqbal near farooqia mosque',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "Poppins-Light"),
                                  ),
                                  onTap: () {},
                                ),
                                ListTile(
                                  leading: Icon(
                                    Icons.location_on,
                                    size: 25,
                                    // color: Color(AppColorConst.black),
                                  ),
                                  title: const Text(
                                    'Destination Location',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: "Poppins-Medium"),
                                  ),
                                  subtitle: const Text(
                                    'Saddar regal market new hbl bank',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "Poppins-Light"),
                                  ),
                                  onTap: () {},
                                ),
                                ListTile(
                                  leading: Icon(
                                    Icons.calendar_month,
                                    size: 25,
                                    // color: Color(AppColorConst.black),
                                  ),
                                  title: const Text(
                                    'Date',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: "Poppins-Medium"),
                                  ),
                                  subtitle: const Text(
                                    '22/10/2022',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "Poppins-Light"),
                                  ),
                                  onTap: () {},
                                ),
                                ListTile(
                                  leading: Icon(
                                    Icons.punch_clock,
                                    size: 25,
                                    // color: Color(AppColorConst.black),
                                  ),
                                  title: const Text(
                                    'Time',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: "Poppins-Medium"),
                                  ),
                                  subtitle: const Text(
                                    '10:00 Am',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "Poppins-Light"),
                                  ),
                                  onTap: () {},
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    "Completed",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 16,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 70, vertical: 15), backgroundColor: Color(AppColorConst.light_gray),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
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
