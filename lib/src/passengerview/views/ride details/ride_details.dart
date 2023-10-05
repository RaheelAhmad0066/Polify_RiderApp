import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../constants/colorconstant/colors.dart';

class RideDetails extends StatelessWidget {
  const RideDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(AppColorConst.yellow),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(AppColorConst.black)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        // centerTitle: true,
        title: Text(
          "Ride Details",
          style: TextStyle(
              fontFamily: "Mulish-Bold",
              fontSize: 20,
              color: Color(AppColorConst.black)),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: 100.h,
            width: 100.w,
            child: Image.asset(
              "assets/images/googlemap.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 62.h,
              width: 100.w,
              decoration: BoxDecoration(
                  color: Color(0xffFFCB44).withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Seats: 04',
                          style: TextStyle(
                              fontSize: 18, fontFamily: "Poppins-Regular"),
                        ),
                        Text(
                          'Fair: 200 per seat',
                          style: TextStyle(
                              fontSize: 18, fontFamily: "Poppins-Regular"),
                        ),
                      ],
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.location_on,
                        size: 25,
                        // color: Color(AppColorConst.black),
                      ),
                      title: const Text(
                        'Pickup Location',
                        style: TextStyle(
                            fontSize: 16, fontFamily: "Poppins-Medium"),
                      ),
                      subtitle: const Text(
                        'Guslshan-e-Iqbal near farooqia mosque',
                        style: TextStyle(
                            fontSize: 14, fontFamily: "Poppins-Light"),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.location_on,
                        size: 25,
                        // color: Color(AppColorConst.black),
                      ),
                      title: const Text(
                        'Destination Location',
                        style: TextStyle(
                            fontSize: 16, fontFamily: "Poppins-Medium"),
                      ),
                      subtitle: const Text(
                        'Saddar regal market new hbl bank',
                        style: TextStyle(
                            fontSize: 14, fontFamily: "Poppins-Light"),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.calendar_month,
                        size: 25,
                        // color: Color(AppColorConst.black),
                      ),
                      title: const Text(
                        'Date',
                        style: TextStyle(
                            fontSize: 16, fontFamily: "Poppins-Medium"),
                      ),
                      subtitle: const Text(
                        '22/10/2022',
                        style: TextStyle(
                            fontSize: 14, fontFamily: "Poppins-Light"),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.punch_clock,
                        size: 25,
                        // color: Color(AppColorConst.black),
                      ),
                      title: const Text(
                        'Time',
                        style: TextStyle(
                            fontSize: 16, fontFamily: "Poppins-Medium"),
                      ),
                      subtitle: const Text(
                        '10:00 Am',
                        style: TextStyle(
                            fontSize: 14, fontFamily: "Poppins-Light"),
                      ),
                      onTap: () {},
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                "assets/images/pet.png",
                                height: 65,
                                width: 65,
                              ),
                              Text(
                                'Not Allowed',
                                style: TextStyle(
                                    fontSize: 10, fontFamily: "Poppins-Medium"),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Image.asset(
                                "assets/images/gun.png",
                                height: 65,
                                width: 65,
                              ),
                              Text(
                                'Not Allowed',
                                style: TextStyle(
                                    fontSize: 10, fontFamily: "Poppins-Medium"),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Image.asset(
                                "assets/images/smooking.png",
                                height: 65,
                                width: 65,
                              ),
                              Text(
                                'Not Allowed',
                                style: TextStyle(
                                    fontSize: 10, fontFamily: "Poppins-Medium"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Accept Request",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 70, vertical: 15),
                        backgroundColor: Color(AppColorConst.light_gray),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
