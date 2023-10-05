import 'package:flutter/material.dart';
import 'package:poolyfi/src/passengerview/constants/colorconstant/colors.dart';
// import 'package:poolyfi/src/passengerview/constants/textcontant/text_constant.dart';

import 'package:poolyfi/src/passengerview/views/settingscreen/Night%20Mode/mode_settings.dart';
import 'package:poolyfi/src/passengerview/views/settingscreen/logout_alert.dart';
import 'package:poolyfi/src/passengerview/views/settingscreen/phone_alert.dart';
import 'package:sizer/sizer.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

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
          "Edit Setting",
          style: TextStyle(
              fontFamily: "Mulish-Bold",
              fontSize: 20,
              color: Color(AppColorConst.black)),
        ),
      ),
      body: Container(
        height: 100.h,
        width: 100.w,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  "Phone Number",
                  style: TextStyle(
                    fontFamily: "Metropolis-Medium",
                    fontSize: 14.sp,
                  ),
                ),
                subtitle: Text(
                  "+923123456768789",
                  style: TextStyle(
                    fontFamily: "Poppins-Light",
                    fontSize: 12.sp,
                  ),
                ),
                trailing: GestureDetector(
                    onTap: () {
                      showAlertDialog(context);
                    },
                    child: Icon(
                      Icons.edit,
                      color: Color(AppColorConst.yellow),
                    )),
              ),

              ListTile(
                title: Text(
                  "Night Mode",
                  style: TextStyle(
                    fontFamily: "Mulish-Medium",
                    fontSize: 14.sp,
                  ),
                ),
                subtitle: Text(
                  "System Default",
                  style: TextStyle(
                    fontFamily: "Poppins-Light",
                    fontSize: 12.sp,
                  ),
                ),
                trailing: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ModeSetting()));
                    },
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(AppColorConst.yellow),
                    )),
              ),
              // ListTile(
              //   title: ConstantTextWidget("Navigator", 14, "Metropolis-Medium"),
              //   subtitle: ConstantTextWidget("Default", 12, "Poppins-Light"),
              //   trailing: GestureDetector(
              //       onTap: () {},
              //       child: Icon(
              //         Icons.arrow_forward_ios,
              //         color: Color(AppColorConst.yellow),
              //       )),
              // ),

              GestureDetector(
                onTap: () {
                  showAlertDialogLogout(context);
                },
                child: ListTile(
                  title: Text(
                    "Logout",
                    style: TextStyle(
                      fontFamily: "Metropolis-Bold",
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
