import 'package:flutter/material.dart';
import 'package:poolyfi/src/driverview/views/my%20rides/completed_rides.dart';
import 'package:poolyfi/src/driverview/views/my%20rides/present_rides.dart';

import '../../../passengerview/constants/colorconstant/colors.dart';

class MyRides extends StatelessWidget {
  const MyRides({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color(AppColorConst.black)),
            onPressed: () => Navigator.of(context).pop(),
          ),
          elevation: 0,
          centerTitle: true,
          title: Text(
            "My Rides",
            style: TextStyle(
                fontFamily: "Mulish-Bold",
                fontSize: 20,
                color: Color(AppColorConst.black)),
          ),
          backgroundColor: Color(AppColorConst.yellow),
          bottom: TabBar(
            indicatorWeight: 3,
            indicatorColor: Colors.black,
            tabs: [
              Tab(
                child: Text(
                  "Present Rides",
                  style: TextStyle(
                      fontFamily: "Mulish-Bold",
                      fontSize: 14,
                      color: Color(AppColorConst.black)),
                ),
              ),
              Tab(
                child: Text(
                  "Completed Rides",
                  style: TextStyle(
                      fontFamily: "Mulish-Bold",
                      fontSize: 14,
                      color: Color(AppColorConst.black)),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [PresentRides(), CompletedRides()],
        ),
      ),
    );
  }
}
