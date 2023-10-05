import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../../config/config.dart';
import '../src/passengerview/views/loginscreen/verification_screen.dart';

vpwonf(encp, number, context) async {
  try {
    var resp = await http.get(
      // ignore: prefer_interpolation_to_compose_strings
      Uri.parse('${otpkey + encp.toString()}&mobileno=' + number),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
    );

    var respd = resp.body;
    debugPrint(respd);

    if (resp.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Your OTP has been sent'),
          duration: const Duration(seconds: 3),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              // Perform undo operation
            },
          ),
        ),
      );
      Future.delayed(Duration(seconds: 2), () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Verificatoin(
                    encp: encp,
                    number: number.toString(),
                  )),
        );
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('SomeThing Went Wrong Try Again Later'),
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
  } catch (e) {
    debugPrint('Error: ${e.toString()}');
  }
}

int genopwd(int l) {
  final random = Random();
  int maxNumber = pow(10, l).toInt() - 1;
  int opwc = random.nextInt(maxNumber);
  opwc = opwc < pow(10, l - 1).toInt() ? opwc + pow(10, l - 1).toInt() : opwc;
  int encrypted = opwc;
  return encrypted;
}
