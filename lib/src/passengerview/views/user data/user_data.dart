import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
// import 'package:sizer/sizer.dart';

import '../../constants/colorconstant/colors.dart';
import '../drawer/drawer.dart';

class UserDataScreen extends StatefulWidget {
  const UserDataScreen({Key? key}) : super(key: key);

  @override
  State<UserDataScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<UserDataScreen> {
  final TextEditingController first_name_controller = TextEditingController();
  final TextEditingController last_name_controller = TextEditingController();
  final TextEditingController dob_controller = TextEditingController();
  final TextEditingController email_controller = TextEditingController();
  final TextEditingController city_controller = TextEditingController();
  final firestore = FirebaseFirestore.instance.collection('user_info');
  final user_info_key = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  bool _isLoading = false;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1950, 8),
        lastDate: DateTime(2222));
    if (picked != null && picked != selectedDate) {
      print(picked);
      print(selectedDate);
      dob_controller.text = DateFormat.yMMMEd().format(picked);
      picked.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                  Form(
                    key: user_info_key,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter First Name';
                              }
                              return null;
                            },
                            controller: first_name_controller,
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Last Name';
                              }
                              return null;
                            },
                            controller: last_name_controller,
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Date of Birth';
                              }
                              return null;
                            },
                            controller: dob_controller,
                            onTap: () {
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());
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
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Email Address';
                              }
                              return null;
                            },
                            controller: email_controller,
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter City';
                              }
                              return null;
                            },
                            controller: city_controller,
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
                              onPressed: () async {
                                if (user_info_key.currentState!.validate()) {
                                  print("in button method");
                                  setState(() {});
                                  String id = FirebaseFirestore.instance
                                      .collection("user_info")
                                      .doc()
                                      .id;
                                  await firestore.doc(id).set({
                                    'first_name':
                                        first_name_controller.text.toString(),
                                    'last_name':
                                        last_name_controller.text.toString(),
                                    'dob': dob_controller.text.toString(),
                                    'email': email_controller.text.toString(),
                                    'city': city_controller.text.toString(),
                                    'id': id,
                                  });
                                  EasyLoading.show().then((value) {
                                    Fluttertoast.showToast(
                                        msg: "User info Stored",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.black38,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                    EasyLoading.dismiss();
                                  }).catchError(
                                    (err) {
                                      print('Error: $err');
                                      EasyLoading.dismiss(); // Prints 401.
                                    },
                                  );
                                  first_name_controller.clear();
                                  last_name_controller.clear();
                                  dob_controller.clear();
                                  email_controller.clear();
                                  city_controller.clear();
                                  //Navigator.pushNamedAndRemoveUntil(context, 'HomeScreen', (route) => false);
                                }
                                setState(() {
                                  _isLoading = true;
                                });
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MainDrawerScreen()));

                                Future.delayed(Duration(seconds: 1), () {
                                  setState(() {
                                    _isLoading = false;
                                  });
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
                      ),
                    ),
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
