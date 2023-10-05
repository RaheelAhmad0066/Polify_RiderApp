import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';

import '../../../../passengerview/constants/colorconstant/colors.dart';
import '../../../../passengerview/constants/textcontant/text_constant.dart';

fareshowDialogDriver(BuildContext context) {
  Widget closeButton = TextButton(
    child: YellowTextWidget(
      "Close",
      14,
      "Mulish-Bold",
    ),
    onPressed: () => Navigator.of(context).pop(),
  );
  Widget DoneButton = TextButton(
    child: YellowTextWidget(
      "Done",
      14,
      "Mulish-Bold",
    ),
    onPressed: () => Navigator.of(context).pop(),
  );
  AlertDialog alert = AlertDialog(
    scrollable: true,
    content: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text("Specify your fair per seat"),
          Divider(
            thickness: 2,
            color: Color(AppColorConst.light_gray),
          ),
          ListTile(
            leading: Text(
              "Fair",
              style: TextStyle(
                  fontFamily: "Mulish-ExtraBold",
                  fontSize: 30,
                  color: Color(AppColorConst.yellow)),
            ),
            title: TextField(
              keyboardType: TextInputType.number,
              maxLines: 1,
              cursorColor: Colors.black,
              cursorHeight: 22,
              decoration: InputDecoration(
                hintText: "e.g 200",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(AppColorConst.black)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(AppColorConst.yellow)),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    actions: [
      closeButton,
      DoneButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
