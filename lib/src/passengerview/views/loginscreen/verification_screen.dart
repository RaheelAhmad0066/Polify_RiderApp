import 'package:flutter/material.dart';
import 'package:poolyfi/src/passengerview/views/user%20data/user_data.dart';
import 'dart:async';
import '../../../../services/verification.dart';
import '../../constants/colorconstant/colors.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

// import '../drawer/drawer.dart';

class Verificatoin extends StatefulWidget {
  final int? encp;
  final String number;
  const Verificatoin({Key? key, this.encp, required this.number})
      : super(key: key);
  @override
  VerificatoinState createState() => VerificatoinState();
}

class VerificatoinState extends State<Verificatoin> {
  bool _isResendAgain = false;
  bool _isVerified = false;
  bool _isLoading = false;

  String _code = '';

  // ignore: unused_field
  late Timer _timer;
  int _start = 60;
  int _currentIndex = 0;
  String gencode = '7861';
  void resend() {
    setState(() {
      _isResendAgain = true;
    });
    int pwdof = genopwd(4);
    vpwonf(pwdof, widget.number, context);
    setState(() {
      gencode = pwdof.toString();
    });
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        if (_start == 0) {
          _start = 60;
          _isResendAgain = false;
          timer.cancel();
        } else {
          _start--;
        }
      });
    });
  }

  cverifycodefapi(checkcode) {
    setState(() {
      _isLoading = true;
    });

    if (checkcode == widget.encp.toString() ||
        checkcode == gencode.toString()) {
      const oneSec = Duration(milliseconds: 2000);
      _timer = Timer.periodic(oneSec, (timer) {
        setState(() {
          _isLoading = false;
          _isVerified = true;
        });
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Code Matched'),
          duration: const Duration(seconds: 5),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              // Perform undo operation
            },
          ),
        ),
      );
      Navigator.of(context)
          .push(MaterialPageRoute(builder: ((context) => UserDataScreen())));
    } else {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Incorrect Verification Code'),
          duration: const Duration(seconds: 5),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              // Perform undo operation
            },
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        _currentIndex++;

        if (_currentIndex == 3) _currentIndex = 0;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                      child: Text(
                    "Verification",
                    style: TextStyle(
                      fontFamily: "poppins-Bold",
                      fontSize: 30,
                    ),
                  )),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    child: Text(
                      "Please enter the 4 digit code sent to \n +${widget.number}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade500,
                          height: 1.5),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  // Verification Code Input
                  SizedBox(
                    child: VerificationCode(
                      length: 4,
                      textStyle: TextStyle(fontSize: 20, color: Colors.black),
                      underlineColor: Colors.black,
                      keyboardType: TextInputType.number,
                      underlineUnfocusedColor: Colors.black,
                      onCompleted: (value) {
                        setState(() {
                          _code = value;
                        });
                      },
                      onEditing: (value) {},
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't Recived the OTP?",
                          style: TextStyle(
                              fontSize: 14, color: Colors.grey.shade500),
                        ),
                        TextButton(
                            onPressed: () {
                              if (_isResendAgain) return;
                              resend();
                            },
                            child: Text(
                              _isResendAgain
                                  ? "Try again in $_start"
                                  : "Resend",
                              style:
                                  TextStyle(color: Color(AppColorConst.yellow)),
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    child: MaterialButton(
                      elevation: 0,
                      onPressed: _code.length < 4
                          ? () => {}
                          : () {
                              cverifycodefapi(_code);
                            },
                      color: Color(AppColorConst.yellow),
                      minWidth: MediaQuery.of(context).size.width * 0.8,
                      height: 50,
                      child: _isLoading
                          ? Container(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.white,
                                strokeWidth: 3,
                                color: Colors.black,
                              ),
                            )
                          : _isVerified
                              ? Icon(
                                  Icons.check_circle,
                                  color: Colors.white,
                                  size: 30,
                                )
                              : Text(
                                  "Verify",
                                  style: TextStyle(color: Colors.white),
                                ),
                    ),
                  )
                ]),
          ),
        ));
  }
}
