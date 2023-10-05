import 'package:flutter/material.dart';
import 'package:poolyfi/src/driverview/views/home%20screen/driver_fare_box.dart';
import 'package:poolyfi/src/driverview/views/home%20screen/driver_pick_location.dart';

import 'package:poolyfi/src/passengerview/constants/colorconstant/colors.dart';
import 'package:sizer/sizer.dart';

import '../my rides/my_rides.dart';
import 'driver_destination.dart';
import 'fair for seat/fair.dart';

class DriverHomeScreen extends StatefulWidget {
  const DriverHomeScreen({Key? key}) : super(key: key);

  @override
  State<DriverHomeScreen> createState() => _DriverHomeScreenState();
}

class _DriverHomeScreenState extends State<DriverHomeScreen> {
  DateTime _selectedDate = DateTime.now();

  TimeOfDay _timeOfDay = TimeOfDay.now();

  // show time picker method
  void _showTimePicker() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        _timeOfDay = value!;
      });
    });
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    ).then((value) {
      setState(() {
        _selectedDate = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: 88.h,
          width: 100.w,
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "assets/images/googlemap.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: Color.fromARGB(255, 53, 53, 53).withOpacity(0.8),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.54,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 25),
                    child: Column(
                      children: [
                        Text(
                          "Make Your Ride",
                          style: TextStyle(
                              color: Color(AppColorConst.yellow),
                              fontSize: 20,
                              fontFamily: "Poppins-Bold"),
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Container(
                        //       decoration: BoxDecoration(
                        //           border: Border.all(
                        //               width: 3,
                        //               color: Color(AppColorConst.yellow)),
                        //           color: Color(AppColorConst.light_gray),
                        //           borderRadius: new BorderRadius.circular(10)),
                        //       height: 70,
                        //       width: 80,
                        //       child: Padding(
                        //         padding: const EdgeInsets.all(8.0),
                        //         child: Image.asset(
                        //           "assets/images/AcCAR.png",
                        //           fit: BoxFit.cover,
                        //         ),
                        //       ),
                        //     ),
                        //     Container(
                        //       decoration: BoxDecoration(
                        //           border: Border.all(
                        //               width: 3,
                        //               color: Color(AppColorConst.yellow)),
                        //           color: Color(AppColorConst.light_gray),
                        //           borderRadius: new BorderRadius.circular(10)),
                        //       height: 70,
                        //       width: 80,
                        //       child: Padding(
                        //         padding: const EdgeInsets.all(8.0),
                        //         child: Image.asset(
                        //           "assets/images/car.png",
                        //           fit: BoxFit.cover,
                        //         ),
                        //       ),
                        //     ),
                        //     Container(
                        //       decoration: BoxDecoration(
                        //           border: Border.all(
                        //               width: 3,
                        //               color: Color(AppColorConst.yellow)),
                        //           color: Color(AppColorConst.light_gray),
                        //           borderRadius: new BorderRadius.circular(10)),
                        //       height: 70,
                        //       width: 80,
                        //       child: Padding(
                        //         padding: const EdgeInsets.all(8.0),
                        //         child: Image.asset(
                        //           "assets/images/minicar.png",
                        //           fit: BoxFit.cover,
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DriverPickLocation()));
                          },
                          child: Container(
                            child: ListTile(
                              title: Text(
                                "Starting Location",
                                style: TextStyle(
                                    fontFamily: "Mulish-Regular",
                                    fontSize: 16,
                                    color: Color(AppColorConst.white)),
                              ),
                              leading: Icon(
                                Icons.location_on_outlined,
                                color: Color(AppColorConst.yellow),
                              ),
                            ),
                            width: 100.w,
                            height: 7.h,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    width: 2.0, color: Colors.grey.shade200),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DriverDestinationScreen()));
                          },
                          child: Container(
                            child: ListTile(
                              title: Text(
                                "Destination",
                                style: TextStyle(
                                    fontFamily: "Mulish-Regular",
                                    fontSize: 16,
                                    color: Color(AppColorConst.white)),
                              ),
                              leading: Icon(
                                Icons.location_on_outlined,
                                color: Color(AppColorConst.yellow),
                              ),
                            ),
                            width: 100.w,
                            height: 7.h,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    width: 2.0, color: Colors.grey.shade200),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            DriverfareshowDialog(context);
                          },
                          child: Container(
                            child: ListTile(
                              title: Text(
                                "Available seats?",
                                style: TextStyle(
                                    fontFamily: "Mulish-Regular",
                                    fontSize: 16,
                                    color: Color(AppColorConst.white)),
                              ),
                              leading: Icon(
                                Icons.car_rental_outlined,
                                color: Color(AppColorConst.yellow),
                              ),
                            ),
                            width: 100.w,
                            height: 6.h,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    width: 2.0, color: Colors.grey.shade200),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            fareshowDialogDriver(context);
                          },
                          child: Container(
                            child: ListTile(
                              title: Text(
                                "Fair per seat?",
                                style: TextStyle(
                                    fontFamily: "Mulish-Regular",
                                    fontSize: 16,
                                    color: Color(AppColorConst.white)),
                              ),
                              leading: Icon(
                                Icons.car_rental_outlined,
                                color: Color(AppColorConst.yellow),
                              ),
                            ),
                            width: 100.w,
                            height: 6.h,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    width: 2.0, color: Colors.grey.shade200),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _showDatePicker();
                          },
                          child: Container(
                            child: ListTile(
                              title: Text(
                                '${_selectedDate.day.toString()}/${_selectedDate.month.toString()}/${_selectedDate.year.toString()}',
                                style: TextStyle(
                                    fontFamily: "Mulish-Regular",
                                    fontSize: 16,
                                    color: Color(AppColorConst.white)),
                              ),
                              leading: Icon(
                                Icons.edit_calendar_sharp,
                                color: Color(AppColorConst.yellow),
                              ),
                            ),
                            width: 100.w,
                            height: 6.h,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    width: 2.0, color: Colors.grey.shade200),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _showTimePicker();
                          },
                          child: Container(
                            child: ListTile(
                              title: Text(
                                _timeOfDay.format(context).toString(),
                                style: TextStyle(
                                    fontFamily: "Mulish-Regular",
                                    fontSize: 16,
                                    color: Color(AppColorConst.white)),
                              ),
                              leading: Icon(
                                Icons.timer,
                                color: Color(AppColorConst.yellow),
                              ),
                            ),
                            width: 100.w,
                            height: 6.h,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    width: 2.0, color: Colors.grey.shade200),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      MyRides()));
                            },
                            child: Text(
                              "New Ride",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 70, vertical: 14), backgroundColor: Color(AppColorConst.yellow),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
