import 'package:flutter/material.dart';
import 'package:poolyfi/src/passengerview/constants/colorconstant/colors.dart';
import 'package:sizer/sizer.dart';

class DriverPickLocation extends StatelessWidget {
  const DriverPickLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(AppColorConst.yellow),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        // centerTitle: true,
        title: Text(
          "Pickup Location",
          style: TextStyle(
            fontFamily: "Mulish-Bold",
            fontSize: 18.sp,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            child: TextFormField(
          cursorColor: Colors.black,
          cursorHeight: 22,
          decoration: InputDecoration(
            hintText: "Select Pick Address",
            prefixIcon: Icon(
              Icons.location_on_outlined,
              color: Color(AppColorConst.yellow),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(AppColorConst.black)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(AppColorConst.yellow)),
            ),
          ),
        )),
      ),
    );
  }
}
