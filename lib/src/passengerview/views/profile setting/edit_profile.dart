import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colorconstant/colors.dart';
import '../drawer/drawer.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  DateTime selectedDate = DateTime.now();
  bool _isLoading = false;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1950, 8),
        lastDate: DateTime(2222));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(AppColorConst.black)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Profile Setting",
          style: TextStyle(
              fontFamily: "Mulish-Bold",
              fontSize: 20,
              color: Color(AppColorConst.black)),
        ),
        backgroundColor: Color(AppColorConst.yellow),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 88.h,
          width: 100.h,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  GestureDetector(
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Image.asset(
                        "assets/images/user.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    onTap: () {},
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                        child: Column(
                      children: [
                        TextFormField(
                          maxLines: 1,
                          cursorColor: Colors.black,
                          cursorHeight: 22,
                          decoration: InputDecoration(
                            hintText: "First Name",
                            filled: true,
                            // fillColor: Color(AppColorConst.light_gray),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Color(AppColorConst.yellow),
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(50)),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          maxLines: 1,
                          cursorColor: Colors.black,
                          cursorHeight: 22,
                          decoration: InputDecoration(
                            hintText: "Last Name",
                            filled: true,
                            // fillColor: Color(AppColorConst.light_gray),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Color(AppColorConst.yellow),
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(50)),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          onTap: () {
                            FocusScope.of(context)
                                .requestFocus(FocusNode());
                            _selectDate(context);
                          },
                          maxLines: 1,
                          cursorColor: Colors.black,
                          cursorHeight: 22,
                          decoration: InputDecoration(
                            hintText: "Date of Birth",
                            filled: true,
                            // fillColor: Color(AppColorConst.light_gray),
                            prefixIcon: Icon(
                              Icons.calendar_month,
                              color: Color(AppColorConst.yellow),
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(50)),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Date.';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          maxLines: 1,
                          cursorColor: Colors.black,
                          cursorHeight: 22,
                          decoration: InputDecoration(
                            hintText: "Email",
                            filled: true,
                            // fillColor: Color(AppColorConst.light_gray),
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Color(AppColorConst.yellow),
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(50)),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          maxLines: 1,
                          cursorColor: Colors.black,
                          cursorHeight: 22,
                          decoration: InputDecoration(
                            hintText: "City",
                            filled: true,
                            // fillColor: Color(AppColorConst.light_gray),
                            prefixIcon: Icon(
                              Icons.location_city,
                              color: Color(AppColorConst.yellow),
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(50)),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                          child: MaterialButton(
                            minWidth: double.infinity,
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
                                        builder: (context) =>
                                            MainDrawerScreen()));
                              });
                            },
                            color: Color(AppColorConst.yellow),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 30),
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
                                    "Save",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: "Poppins-Regular",
                                        color: Color(AppColorConst.black)),
                                  ),
                          ),
                        ),
                      ],
                    )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
