import 'package:flutter/material.dart';
import 'package:poolyfi/src/passengerview/views/drawer/drawer.dart';

import 'package:sizer/sizer.dart';

import '../../constants/colorconstant/colors.dart';
import '../../constants/textcontant/text_constant.dart';
// import '../homescreen/home.dart';

rideCancelAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child:
        YellowTextWidget("Cancel", 16, "Mulish-Regular", AppColorConst.yellow),
    onPressed: () => Navigator.of(context).pop(),
  );
  Widget continueButton = TextButton(
    child: YellowTextWidget("Sure", 16, "Mulish-Regular", AppColorConst.yellow),
    onPressed: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainDrawerScreen()));
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: YellowTextWidget("Please Confirm", 18, "Mulish-Bold"),
    content: Text(
      "Do you really want to cancel a ride?",
      style: TextStyle(
        fontFamily: "Mulish-Regular",
        fontSize: 14.sp,
      ),
    ),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
