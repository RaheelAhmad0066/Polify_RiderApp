import 'package:flutter/material.dart';
import '../../constants/colorconstant/colors.dart';
import '../../constants/textcontant/text_constant.dart';

fareshowDialog(BuildContext context) {
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
          Text("Specify your number of seats"),
          Divider(
            thickness: 2,
            color: Color(AppColorConst.light_gray),
          ),
          ListTile(
            leading: Text(
              "SEATS",
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
                hintText: "e.g 4",
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
