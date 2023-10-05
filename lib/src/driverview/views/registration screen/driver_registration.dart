import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:poolyfi/src/driverview/views/DriverDrawer/driver_drawer.dart';
import 'package:sizer/sizer.dart';
import 'dart:io';

import '../../../passengerview/constants/colorconstant/colors.dart';

class DriverRegistrationScreen extends StatefulWidget {
  const DriverRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<DriverRegistrationScreen> createState() =>
      _DriverRegistrationScreenState();
}

class _DriverRegistrationScreenState extends State<DriverRegistrationScreen> {
  bool _isLoading = false;
  File? image;
  String? gender = "male";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // leading: IconButton(
        //   icon: Icon(
        //     color: Color(AppColorConst.black),
        //     Icons.arrow_back,
        //   ),
        //   onPressed: () => Navigator.of(context).pop(),
        // ),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Poolyfi Driver Registration",
          style: TextStyle(
            color: Color(AppColorConst.black),
            fontFamily: "Mulish-Bold",
            fontSize: 20,
          ),
        ),
        backgroundColor: Color(AppColorConst.yellow),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
              child: Column(
            children: [
              InkWell(
                onTap: () {
                  // selectImageFromGal();
                },
                child: Center(
                  child: image == null
                      ? profilewithoutImage()
                      : profilewithImage(),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Upload Profile image",
                style: TextStyle(fontSize: 14, fontFamily: "Metropolis-Medium"),
              ),
              SizedBox(
                height: 2.h,
              ),
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
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
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
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                maxLines: 1,
                cursorColor: Colors.black,
                cursorHeight: 22,
                decoration: InputDecoration(
                  hintText: "Phone Number",
                  filled: true,
                  // fillColor: Color(AppColorConst.light_gray),
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Color(AppColorConst.yellow),
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              TextFormField(
                maxLines: 1,
                cursorColor: Colors.black,
                cursorHeight: 22,
                decoration: InputDecoration(
                  hintText: "Email Address",
                  filled: true,
                  // fillColor: Color(AppColorConst.light_gray),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Color(AppColorConst.yellow),
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Select Gender",
                    style: TextStyle(
                        fontSize: 16, fontFamily: "Metropolis-Medium"),
                  ),
                  RadioListTile(
                    activeColor: Color(AppColorConst.yellow),
                    title: Text("Male"),
                    value: "male",
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    activeColor: Color(AppColorConst.yellow),
                    title: Text("Female"),
                    value: "female",
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    activeColor: Color(AppColorConst.yellow),
                    title: Text("Other"),
                    value: "other",
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value.toString();
                      });
                    },
                  )
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              TextFormField(
                maxLines: 1,
                cursorColor: Colors.black,
                cursorHeight: 22,
                decoration: InputDecoration(
                  hintText: "Address 1",
                  filled: true,
                  // fillColor: Color(AppColorConst.light_gray),
                  prefixIcon: Icon(
                    Icons.home,
                    color: Color(AppColorConst.yellow),
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              TextFormField(
                maxLines: 1,
                cursorColor: Colors.black,
                cursorHeight: 22,
                decoration: InputDecoration(
                  hintText: "Address 2",
                  filled: true,
                  // fillColor: Color(AppColorConst.light_gray),
                  prefixIcon: Icon(
                    Icons.home,
                    color: Color(AppColorConst.yellow),
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
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
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              TextFormField(
                maxLines: 1,
                cursorColor: Colors.black,
                cursorHeight: 22,
                decoration: InputDecoration(
                  hintText: "Country",
                  filled: true,
                  // fillColor: Color(AppColorConst.light_gray),
                  prefixIcon: Icon(
                    Icons.map,
                    color: Color(AppColorConst.yellow),
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                maxLines: 1,
                cursorColor: Colors.black,
                cursorHeight: 22,
                decoration: InputDecoration(
                  hintText: "CNIC",
                  filled: true,
                  // fillColor: Color(AppColorConst.light_gray),
                  prefixIcon: Icon(
                    Icons.card_membership,
                    color: Color(AppColorConst.yellow),
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Upload Your Documents",
                style: TextStyle(fontSize: 18, fontFamily: "Metropolis-Medium"),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "CNIC FRONT",
                style: TextStyle(fontSize: 14, fontFamily: "Metropolis-Medium"),
              ),
              InkWell(
                onTap: () {
                  // selectImageFromGal();
                },
                child: Center(
                  child: image == null ? cnicwithoutImage() : cnicwithImage(),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "CNIC BACK",
                style: TextStyle(fontSize: 14, fontFamily: "Metropolis-Medium"),
              ),
              InkWell(
                onTap: () {},
                child: Center(
                  child: image == null ? cnicwithoutImage() : cnicwithImage(),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "DRIVING LICENCE FRONT",
                style: TextStyle(fontSize: 14, fontFamily: "Metropolis-Medium"),
              ),
              InkWell(
                onTap: () {
                  // selectImageFromGal();
                },
                child: Center(
                  child: image == null ? licwithoutImage() : licwithImage(),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "DRIVING LICENCE BACK",
                style: TextStyle(fontSize: 14, fontFamily: "Metropolis-Medium"),
              ),
              InkWell(
                onTap: () {
                  // selectImageFromGal();
                },
                child: Center(
                  child: image == null ? licwithoutImage() : licwithImage(),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              SizedBox(
                width: 80.w,
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
                              builder: (context) => DriverDrawerScreen()));
                    });
                  },
                  color: Color(AppColorConst.yellow),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
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
                          "Register",
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: "Poppins-Regular",
                              color: Color(AppColorConst.black)),
                        ),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }

  //________________image from gal
  // selectImageFromGal() async {
  //   ImagePicker imagePick = ImagePicker();
  //   var fileimage = await imagePick.pickImage(source: ImageSource.gallery);
  //   image = File(fileimage!.path);
  //   setState(() {});
  // }

  //________________image from cam
  // selectImageFromCam() async {
  //   ImagePicker imagePick = ImagePicker();
  //   var fileimage = await imagePick.pickImage(source: ImageSource.camera);
  //   image = File(fileimage!.path);
  //   setState(() {});
  // }

  cnicwithoutImage() {
    return Container(
      height: 150,
      width: 300,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/cnic.png"),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  cnicwithImage() {
    return Container(
      margin: const EdgeInsets.all(20),
      height: 150,
      width: 300,
      child: Center(
          child: Image.file(
        image!,
        fit: BoxFit.cover,
      )),
    );
  }

  licwithoutImage() {
    return Container(
      height: 150,
      width: 300,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/licence.png"),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  licwithImage() {
    return Container(
      margin: const EdgeInsets.all(20),
      height: 150,
      width: 300,
      child: Center(
          child: Image.file(
        image!,
        fit: BoxFit.cover,
      )),
    );
  }

  profilewithImage() {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
      ),
      child: Image.file(
        image!,
        fit: BoxFit.cover,
      ),
    );
  }

  profilewithoutImage() {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
      ),
      child: Image.asset(
        "assets/images/user.png",
        fit: BoxFit.cover,
      ),
    );
  }
}
