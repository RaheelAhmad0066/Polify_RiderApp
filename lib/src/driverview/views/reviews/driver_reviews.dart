import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../passengerview/constants/colorconstant/colors.dart';

class DriverReviews extends StatelessWidget {
  const DriverReviews({Key? key}) : super(key: key);

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
          "Passenger Reviews",
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
                          height: 12.h,
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
                                    backgroundImage:
                                        AssetImage("assets/images/p1.jpg"),
                                  ),
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Abdul Razzque",
                                        style: TextStyle(
                                            fontFamily: "Mulish-Bold",
                                            fontSize: 16),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            size: 18,
                                            color: Color(AppColorConst.yellow),
                                          ),
                                          Icon(
                                            Icons.star,
                                            size: 18,
                                            color: Color(AppColorConst.yellow),
                                          ),
                                          Icon(
                                            Icons.star,
                                            size: 18,
                                            color: Color(AppColorConst.yellow),
                                          ),
                                          Icon(
                                            Icons.star,
                                            size: 18,
                                            color: Color(AppColorConst.yellow),
                                          ),
                                          Icon(
                                            Icons.star,
                                            size: 18,
                                            color: Color(AppColorConst.yellow),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  subtitle: Text(
                                    "Best Driver and Awesome APP",
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
