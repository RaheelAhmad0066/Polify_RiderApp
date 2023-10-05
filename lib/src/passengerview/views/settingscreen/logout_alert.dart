import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// import '../../constants/colorconstant/colors.dart';
import '../../constants/textcontant/text_constant.dart';

showAlertDialogLogout(BuildContext context) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: YellowTextWidget("Cancel"),
    onPressed: () {},
  );
  Widget continueButton = TextButton(
    child: YellowTextWidget("Logout"),
    onPressed: () {},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    content: Text(
      "Do you want to Logout?",
      style: TextStyle(
        fontFamily: "Mulish-Bold",
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
