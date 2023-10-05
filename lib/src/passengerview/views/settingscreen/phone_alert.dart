import 'package:flutter/material.dart';
import 'package:poolyfi/src/passengerview/views/loginscreen/login_screen.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colorconstant/colors.dart';
import '../../constants/textcontant/text_constant.dart';

showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: YellowTextWidget("No", 12, "Mulish-Bold", AppColorConst.yellow),
    onPressed: () => Navigator.of(context).pop(),
  );
  Widget continueButton = TextButton(
    child: YellowTextWidget("Yes", 12, "Mulish-Bold", AppColorConst.yellow),
    onPressed: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: YellowTextWidget("Please Confirm", 18, "Mulish-Bold"),
    content: Text(
      "Do you want to change your phone number?",
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
