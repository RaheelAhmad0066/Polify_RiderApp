import 'package:flutter/material.dart';
import 'package:poolyfi/src/passengerview/views/my%20trips/past%20trip/past_trip.dart';
import 'package:poolyfi/src/passengerview/views/my%20trips/requested%20trip/requested_trip.dart';

import '../../constants/colorconstant/colors.dart';

class MyTripScreen extends StatelessWidget {
  const MyTripScreen({Key? key}) : super(key: key);

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
            "My Trips",
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
                  "Requested Trips",
                  style: TextStyle(
                      fontFamily: "Mulish-Bold",
                      fontSize: 14,
                      color: Color(AppColorConst.black)),
                ),
              ),
              Tab(
                child: Text(
                  "Past Trips",
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
          children: [RequestedTripScreen(), PastTripScreen()],
        ),
      ),
    );
  }
}
