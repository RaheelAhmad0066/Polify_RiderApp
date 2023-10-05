import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:sizer/sizer.dart';
import '../../../../services/verification.dart';
import '../../constants/colorconstant/colors.dart';
import '../drawer/drawer.dart';
import '../user data/user_data.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController controller = TextEditingController();
  late String? vphonenumber;
  bool cvalidate = false;
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) => UserDataScreen())));
            },
            child: Text('ByPass To Home')),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(30),
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/login_vector.png",
                  fit: BoxFit.cover,
                  width: 280,
                ),
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(
                  child: Text(
                    'Join us via phone number',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                        color: Colors.grey.shade900),
                  ),
                ),
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 20),
                    child: Text(
                      'Enter your phone number to continu, we will send you OTP to verifiy.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 10.sp, color: Colors.grey.shade700),
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                SizedBox(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black.withOpacity(0.13)),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffeeeeee),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        InternationalPhoneNumberInput(
                          onInputChanged: (PhoneNumber number) {
                            vphonenumber = number.phoneNumber;
                            print(number.phoneNumber.toString());
                          },
                          onInputValidated: (bool value) {
                            setState(() {
                              cvalidate = value;
                            });
                            print(value);
                          },
                          selectorConfig: SelectorConfig(
                            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                          ),
                          ignoreBlank: false,
                          autoValidateMode: AutovalidateMode.disabled,
                          selectorTextStyle: TextStyle(color: Colors.black),
                          textFieldController: controller,
                          formatInput: false,
                          maxLength: 10,
                          keyboardType: TextInputType.numberWithOptions(
                              signed: true, decimal: true),
                          cursorColor: Colors.black,
                          inputDecoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.only(bottom: 15, left: 0),
                            border: InputBorder.none,
                            hintText: 'Phone Number',
                            hintStyle: TextStyle(
                                color: Colors.grey.shade500, fontSize: 16),
                          ),
                          onSaved: (PhoneNumber number) {
                            print('On Saved: $number');
                          },
                        ),
                        Positioned(
                          left: 85,
                          top: 8,
                          bottom: 8,
                          child: Container(
                            height: 40,
                            width: 1,
                            color: Colors.black.withOpacity(0.13),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  child: MaterialButton(
                    minWidth: double.infinity,
                    onPressed: () {
                      /// 2: call in future builder by function name and if need also list the list view Builder
                      setState(() {
                        _isLoading = true;
                      });
                      int pwdof = genopwd(4);
                      if (cvalidate) {
                        vpwonf(pwdof, vphonenumber.toString().substring(1),
                            context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please Enter Correct Number'),
                            duration: const Duration(seconds: 5),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {},
                            ),
                          ),
                        );
                        setState(() {
                          _isLoading = false;
                        });
                      }
                    },
                    color: Color(AppColorConst.yellow),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
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
                            "NEXT",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: "Poppins-Regular",
                                color: Color(AppColorConst.black)),
                          ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'By tapping "NEXT" you agree to',
                              style: TextStyle(
                                  fontSize: 10.sp, color: Colors.grey.shade700),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                // Navigator.of(context)
                                //     .pushReplacementNamed('/login');
                              },
                              child: Text(
                                'Term and Conditions',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 10.sp,
                                    color: Colors.grey.shade700),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'and',
                              style: TextStyle(
                                  fontSize: 10.sp, color: Colors.grey.shade700),
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            InkWell(
                              onTap: () {
                                // Navigator.of(context)
                                //     .pushReplacementNamed('/login');
                              },
                              child: Text(
                                'Privacy Policy',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 10.sp,
                                    color: Colors.grey.shade700),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
