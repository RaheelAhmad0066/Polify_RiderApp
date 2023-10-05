import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

YellowTextWidget(
  final String title, [
  double FontSize = 14,
  String Fontfamily = "Mulish-Regular",
  int color = 0xffFFCB44,
]) {
  return Text(
    title,
    style: TextStyle(
        fontFamily: Fontfamily, fontSize: FontSize.sp, color: Color(color)),
  );
}
