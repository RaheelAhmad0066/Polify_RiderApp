import 'package:flutter/material.dart';
// import 'package:poolyfi/src/driverview/views/home%20screen/driverhome.dart';
import 'package:poolyfi/src/help%20screen/help_screen.dart';
import 'package:poolyfi/src/passengerview/views/my%20trips/my_trips.dart';
import 'package:poolyfi/src/passengerview/switch%20to%20driver/switch_driver.dart';
import 'package:poolyfi/src/passengerview/views/homescreen/home.dart';
import 'package:poolyfi/src/passengerview/views/notification%20screen/notification_screen.dart';
// import 'package:poolyfi/src/passengerview/views/settingscreen/Night%20Mode/mode_settings.dart';
// import 'package:sizer/sizer.dart';

import '../../../passengerview/constants/colorconstant/colors.dart';
import '../../../passengerview/views/profile setting/edit_profile.dart';
import '../../../passengerview/views/settingscreen/setting_screen.dart';

class MainDrawerScreen extends StatefulWidget {
  const MainDrawerScreen({Key? key}) : super(key: key);

  @override
  State<MainDrawerScreen> createState() => _DriverDrawerScreenState();
}

class _DriverDrawerScreenState extends State<MainDrawerScreen> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Poolyfi Ride",
          style: TextStyle(
            fontFamily: "Mulish-Bold",
            fontSize: 20,
          ),
        ),
        backgroundColor: Color(AppColorConst.yellow),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.only(top: 40),
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Color(AppColorConst.black),
                child: Text("HA"),
              ),
              title: const Text(
                'Hamza Ahmed',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins-Bold"),
              ),
              subtitle: Text(
                "hamzaahmed@gmail.com",
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Color(AppColorConst.yellow),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => EditProfileScreen())));
              },
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              leading: Icon(
                Icons.home_filled,
                size: 25,
                color: Color(AppColorConst.yellow),
              ),
              title: const Text(
                'Home',
                style: TextStyle(fontSize: 16, fontFamily: "Poppins-Medium"),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => MainDrawerScreen())));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.local_taxi,
                size: 25,
                color: Color(AppColorConst.yellow),
              ),
              title: const Text(
                'My Trips',
                style: TextStyle(fontSize: 16, fontFamily: "Poppins-Medium"),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: ((context) => MyTripScreen())));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.wallet,
                size: 25,
                color: Color(AppColorConst.yellow),
              ),
              title: const Text(
                'Settings',
                style: TextStyle(fontSize: 16, fontFamily: "Poppins-Medium"),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingScreen()));
              },
            ),
            ListTile(
              trailing: CircleAvatar(
                backgroundColor: Colors.red,
                radius: 10,
                child: Tab(
                  child: Text(
                    "9",
                    style: TextStyle(
                        fontFamily: "Mulish-Bold",
                        fontSize: 10,
                        color: Color(AppColorConst.white)),
                  ),
                ),
              ),
              leading: Icon(
                Icons.notifications,
                size: 25,
                color: Color(AppColorConst.yellow),
              ),
              title: const Text(
                'Notifications',
                style: TextStyle(fontSize: 16, fontFamily: "Poppins-Medium"),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NotificationScreen()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.help,
                size: 25,
                color: Color(AppColorConst.yellow),
              ),
              title: const Text(
                'Help',
                style: TextStyle(fontSize: 16, fontFamily: "Poppins-Medium"),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: ((context) => HelpScreen())));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.document_scanner,
                size: 25,
                color: Color(AppColorConst.yellow),
              ),
              title: const Text(
                'Terms and Conditions',
                style: TextStyle(fontSize: 16, fontFamily: "Poppins-Medium"),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.privacy_tip,
                size: 25,
                color: Color(AppColorConst.yellow),
              ),
              title: const Text(
                'Privacy Policy',
                style: TextStyle(fontSize: 16, fontFamily: "Poppins-Medium"),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                size: 25,
                color: Color(AppColorConst.yellow),
              ),
              title: const Text(
                'Logout',
                style: TextStyle(fontSize: 16, fontFamily: "Poppins-Medium"),
              ),
              onTap: () {},
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0, left: 30, right: 30),
              child: Container(
                child: MaterialButton(
                  onPressed: () {
                    setState(() {
                      _isLoading = true;
                    });

                    Future.delayed(Duration(seconds: 2), () {
                      setState(() {
                        _isLoading = false;
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SwitchToDriverScreen()));
                    });
                  },
                  color: Color(AppColorConst.yellow),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: _isLoading
                      ? Container(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.white,
                            color: Colors.black,
                            strokeWidth: 2,
                          ),
                        )
                      : Text(
                          "Driver Mode",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: "Poppins-Regular",
                              color: Color(AppColorConst.black)),
                        ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/icons/facebook.png"),
                  Image.asset("assets/icons/instagram.png"),
                  Image.asset("assets/icons/youtube.png"),
                  Image.asset("assets/icons/linkedIn.png"),
                ],
              ),
            )
          ],
        ),
      ),
      body: HomeScreen(),
    );
  }
}
