import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:poolyfi/src/passengerview/views/homescreen/destination/destination.dart';
import 'package:poolyfi/src/passengerview/views/homescreen/fare_box.dart';
import 'package:poolyfi/src/passengerview/views/homescreen/pick%20location/pick_location.dart';
import 'package:poolyfi/src/passengerview/views/select%20driver/select_driver.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../constants/colorconstant/colors.dart';
import '../../constants/textcontant/text_constant.dart';
import '../../provider/gmapplaces.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ///////////////////////////////////////
  Completer<GoogleMapController> gmapControllerCompleter =
      Completer<GoogleMapController>();
  Set<Marker> markers = {
    // Marker(
    //     markerId: MarkerId('id1'),
    //     position: LatLng(31.582045, 74.329376),
    //     draggable: true,
    //     flat: true,
    //     icon: BitmapDescriptor.defaultMarkerWithHue(50.6),
    //     infoWindow: InfoWindow(title: 'Driver location1')),
  };

  @override
  void initState() {
    super.initState();
    determinePosition();
    Provider.of<Placesvariables>(context, listen: false).pickupplacesvalue;
  }

  String maptheme = '';
  late LatLng currentPosition;
  Future<void> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Location services are disabled.'),
          duration: const Duration(seconds: 2),
        ),
      );
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Location permissions are denied.'),
            duration: const Duration(seconds: 2),
          ),
        );
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Location permissions are permanently denied.'),
          duration: const Duration(seconds: 2),
        ),
      );
      return;
    }

    Position position = await Geolocator.getCurrentPosition();
    LatLng currentPosition = LatLng(position.latitude, position.longitude);
    BitmapDescriptor customMarker = await createCustomMarkerFromImage(
      'assets/icons/customemarkerforuser.png',
    );
    distansef();
    setState(() {
      markers.add(
        Marker(
          markerId: MarkerId('customer'),
          position: currentPosition,
          infoWindow: InfoWindow(title: 'User Name'),
          icon: customMarker,
          draggable: true,
          onDragEnd: (value) async {
            List<Placemark> placemarks =
                await placemarkFromCoordinates(value.latitude, value.longitude);

            if (placemarks.isNotEmpty) {
              Placemark placemark = placemarks[0];
              String address =
                  "${placemark.street}, ${placemark.locality}, ${placemark.administrativeArea}, ${placemark.country}";
              context.read<Placesvariables>().setnewpickup(address.toString());
            } else {
              context
                  .read<Placesvariables>()
                  .setnewdestination('Address not found');
            }
            distansef();
            setState(() {
              currentPosition = LatLng(value.latitude, value.longitude);
            });
          },
        ),
      );
    });

    GoogleMapController controller = await gmapControllerCompleter.future;
    controller.animateCamera(CameraUpdate.newLatLngZoom(currentPosition, 15));
  }

  ///////////////////////////////////////
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

  Future<BitmapDescriptor> createCustomMarkerFromImage(String imagePath) async {
    final ByteData byteData = await rootBundle.load(imagePath);
    final Uint8List imageData = byteData.buffer.asUint8List();
    final BitmapDescriptor bitmapDescriptor =
        BitmapDescriptor.fromBytes(imageData);
    return bitmapDescriptor;
  }

///////////////////////
  Future<void> distansef() async {
    if (markers.length > 1) {
      Marker customerMarker =
          markers.firstWhere((marker) => marker.markerId.value == 'customer');
      double customerLatitude = customerMarker.position.latitude;
      double customerLongitude = customerMarker.position.longitude;

      Marker driverMarker =
          markers.firstWhere((marker) => marker.markerId.value == 'driver');
      double driverLatitude = driverMarker.position.latitude;
      double driverLongitude = driverMarker.position.longitude;
      double distanceInMeters = await Geolocator.distanceBetween(
          customerLatitude, customerLongitude, driverLatitude, driverLongitude);
      double distanceInKm = distanceInMeters / 1000;
      setState(() {
        distanceval = distanceInKm.toString();
      });
    } else {
      setState(() {
        distanceval = 'Kilometer';
      });
    }
  }

  String distanceval = 'Kilometer';
///////////////////////
  bool showplacesheet = true;
///////////////////////
  String pickuplocation = '';
  String destinationlocation = '';
//____________________________________________________________________________________
  /***********************************************************************************/
  // use this in async function
  // remember its call in a future function

  // Marker customerMarker =
  //       markers.firstWhere((marker) => marker.markerId.value == 'customer');
  //   double customerLatitude = customerMarker.position.latitude;
  //   double customerLongitude = customerMarker.position.longitude;

  //   Marker driverMarker =
  //       markers.firstWhere((marker) => marker.markerId.value == 'driver');
  //   double driverLatitude = driverMarker.position.latitude;
  //   double driverLongitude = driverMarker.position.longitude;

  // need to store in firebase from top commited function value like on press button
  // then you get theses value to store
  // 1. customerLatitude
  // 2. customerLongitude
  // 3. driverLatitude
  // 4. driverLongitude
  // 5. pickuplocation =  context.watch<Placesvariables>().pickupplacesvalue;
  // 6. destinationlocation = context.watch<Placesvariables>().destinationvalue;
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  // Example Like This To Add to firebase

  // .add({
  //   'customerLatitude':customerLatitude,
  //   'customerLongitude':customerLongitude,
  //   'driverLatitude':driverLatitude,
  //   'driverLongitude':driverLongitude,
  //   'pickuplocation':context.watch<Placesvariables>().pickupplacesvalue,
  //   'destinationlocation':context.watch<Placesvariables>().destinationvalue,
  // })
//____________________________________________________________________________________
  /***********************************************************************************/
////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        mini: true,
        onPressed: () {
          determinePosition();
        },
        child: Icon(Icons.gps_fixed),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            GoogleMap(
              // myLocationEnabled: true,
              myLocationButtonEnabled: true,
              initialCameraPosition: CameraPosition(
                  target: LatLng(31.582045, 74.329376), zoom: 13),
              // compassEnabled: true,
              // mapToolbarEnabled: true,
              // mapType: MapType.normal,
              markers: markers,
              onTap: (argument) async {
                BitmapDescriptor customMarker =
                    await createCustomMarkerFromImage(
                        'assets/icons/customemarkerforuser.png');
                List<Placemark> placemarks = await placemarkFromCoordinates(
                    argument.latitude, argument.longitude);

                if (placemarks.isNotEmpty) {
                  Placemark placemark = placemarks[0];
                  String address =
                      "${placemark.street}, ${placemark.locality}, ${placemark.administrativeArea}, ${placemark.country}";
                  context
                      .read<Placesvariables>()
                      .setnewpickup(address.toString());
                  // placeaddressvalue = address;
                } else {
                  context.read<Placesvariables>().setnewpickup('Not Found');
                }
                setState(() {
                  currentPosition =
                      LatLng(argument.latitude, argument.longitude);
                  markers.removeWhere(
                      (marker) => marker.markerId.value == 'customer');

                  markers.add(
                    Marker(
                      markerId: MarkerId('customer'),
                      position: currentPosition,
                      infoWindow: InfoWindow(title: 'User Name'),
                      icon: customMarker,
                      draggable: true,
                      onDragEnd: (value) async {
                        List<Placemark> placemarks =
                            await placemarkFromCoordinates(
                                value.latitude, value.longitude);
                        setState(() {
                          if (placemarks.isNotEmpty) {
                            Placemark placemark = placemarks[0];
                            String address =
                                "${placemark.street}, ${placemark.locality}, ${placemark.administrativeArea}, ${placemark.country}";
                            context
                                .read<Placesvariables>()
                                .setnewpickup(address.toString());
                            // placeaddressvalue = address;
                          } else {
                            context
                                .read<Placesvariables>()
                                .setnewpickup('Address not found');
                          }

                          currentPosition =
                              LatLng(value.latitude, value.longitude);
                          distansef();
                        });
                      },
                    ),
                  );
                  distansef();
                });
              },
              onMapCreated: (GoogleMapController controller) {
                controller.setMapStyle(maptheme);
                gmapControllerCompleter.complete(controller);
              },
            ),
            // google map here
            // Container(
            //   height: MediaQuery.of(context).size.height,
            //   width: MediaQuery.of(context).size.width,
            //   child: Image.asset(
            //     "assets/images/googlemap.jpg",
            //     fit: BoxFit.cover,
            //   ),
            // ),
            Visibility(
              visible: showplacesheet,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: Color.fromARGB(255, 53, 53, 53).withOpacity(0.8),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.47,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 25),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              distanceval.toString() == 'Kilometer'
                                  ? 'Kilometer'
                                  : '${distanceval.toString().substring(0, 6)} KM',
                              style: TextStyle(color: Colors.yellow),
                            ),
                            Text(
                              "Make Your Ride",
                              style: TextStyle(
                                  color: Color(AppColorConst.yellow),
                                  fontSize: 20,
                                  fontFamily: "Poppins-Bold"),
                            ),
                          ],
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
                          onTap: () async {
                            BitmapDescriptor customermarker =
                                await createCustomMarkerFromImage(
                              'assets/icons/customemarkerforuser.png',
                            );

                            final addedValue1 = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PickupLocation()));

                            if (addedValue1 != null) {
                              MarkerId driverMarkerId = MarkerId('customer');
                              if (markers.any((marker) =>
                                  marker.markerId == driverMarkerId)) {
                                markers.removeWhere((marker) =>
                                    marker.markerId == driverMarkerId);
                              }
                              // markers.removeWhere((marker) =>
                              //     marker.markerId.value == 'driver');
                              markers.add(Marker(
                                markerId: MarkerId('customer'),
                                position: LatLng(double.parse(addedValue1[0]),
                                    double.parse(addedValue1[1])),
                                infoWindow: InfoWindow(title: 'Driver Name'),
                                icon: customermarker,
                                draggable: true,
                                onDragEnd: (value) async {
                                  List<Placemark> placemarks =
                                      await placemarkFromCoordinates(
                                          value.latitude, value.longitude);
                                  setState(() {
                                    if (placemarks.isNotEmpty) {
                                      Placemark placemark = placemarks[0];
                                      String address =
                                          "${placemark.street}, ${placemark.locality}, ${placemark.administrativeArea}, ${placemark.country}";
                                      context
                                          .read<Placesvariables>()
                                          .setnewdestination(
                                              address.toString());
                                    } else {
                                      context
                                          .read<Placesvariables>()
                                          .setnewdestination(
                                              'Address not found');
                                    }

                                    currentPosition =
                                        LatLng(value.latitude, value.longitude);
                                    distansef();
                                  });
                                },
                              ));
                              GoogleMapController controller =
                                  await gmapControllerCompleter.future;
                              controller.animateCamera(
                                  CameraUpdate.newLatLngZoom(
                                      LatLng(double.parse(addedValue1[0]),
                                          double.parse(addedValue1[1])),
                                      15));
                              pickuplocation = addedValue1[2];
                            }
                            distansef();
                            setState(() {});
                          },
                          child: Container(
                            child: ListTile(
                              title: Text(
                                context
                                    .watch<Placesvariables>()
                                    .pickupplacesvalue
                                    .toString(),
                                // placeaddressvalue.toString(),
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
                          onTap: () async {
                            BitmapDescriptor drivermarker =
                                await createCustomMarkerFromImage(
                              'assets/icons/customemarkerfordriver.png',
                            );

                            final addedValue2 = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DestinationLocation()));
                            if (addedValue2 != null) {
                              MarkerId driverMarkerId = MarkerId('driver');
                              if (markers.any((marker) =>
                                  marker.markerId == driverMarkerId)) {
                                markers.removeWhere((marker) =>
                                    marker.markerId == driverMarkerId);
                              }
                              // markers.removeWhere((marker) =>
                              //     marker.markerId.value == 'driver');
                              markers.add(Marker(
                                markerId: MarkerId('driver'),
                                position: LatLng(double.parse(addedValue2[0]),
                                    double.parse(addedValue2[1])),
                                infoWindow: InfoWindow(title: 'Driver Name'),
                                icon: drivermarker,
                                draggable: true,
                                onDragEnd: (value) async {
                                  List<Placemark> placemarks =
                                      await placemarkFromCoordinates(
                                          value.latitude, value.longitude);

                                  if (placemarks.isNotEmpty) {
                                    Placemark placemark = placemarks[0];
                                    String address =
                                        "${placemark.street}, ${placemark.locality}, ${placemark.administrativeArea}, ${placemark.country}";
                                    context
                                        .read<Placesvariables>()
                                        .setnewdestination(address.toString());
                                  } else {
                                    context
                                        .read<Placesvariables>()
                                        .setnewdestination('Address not found');
                                  }
                                  distansef();
                                  setState(() {
                                    currentPosition =
                                        LatLng(value.latitude, value.longitude);
                                  });
                                },
                              ));
                              GoogleMapController controller =
                                  await gmapControllerCompleter.future;
                              controller.animateCamera(
                                  CameraUpdate.newLatLngZoom(
                                      LatLng(double.parse(addedValue2[0]),
                                          double.parse(addedValue2[1])),
                                      15));
                              destinationlocation = addedValue2[2];
                            }
                            distansef();
                            setState(() {});
                          },
                          child: Container(
                            child: ListTile(
                              title: Text(
                                context
                                    .watch<Placesvariables>()
                                    .destinationvalue
                                    .toString(),
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
                            fareshowDialog1(context);
                          },
                          child: Container(
                            child: ListTile(
                              title: Text(
                                seatsnocont.text.isNotEmpty
                                    ? seatsnocont.text
                                    : "Select number of seats",
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
                            onPressed: () async {
//

                              Marker customerMarker = markers.firstWhere(
                                  (marker) =>
                                      marker.markerId.value == 'customer');
                              double customerLatitude =
                                  customerMarker.position.latitude;
                              double customerLongitude =
                                  customerMarker.position.longitude;

                              Marker driverMarker = markers.firstWhere(
                                  (marker) =>
                                      marker.markerId.value == 'driver');
                              double driverLatitude =
                                  driverMarker.position.latitude;
                              double driverLongitude =
                                  driverMarker.position.longitude;
                              await FirebaseFirestore.instance
                                  .collection('ride_detail_info')
                                  .add({
                                    'customerLatitude': customerLatitude,
                                    'customerLongitude': customerLongitude,
                                    'driverLatitude': driverLatitude,
                                    'driverLongitude': driverLongitude,
                                    'pickup': pickuplocation,
                                    'destination': destinationlocation,
                                    'no_of_seats': seatsnocont.text,
                                    'date': _selectedDate,
                                    'time': _timeOfDay.toString(),
                                  })
                                  .then((value) => ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text('Data Stored'),
                                          duration: const Duration(seconds: 5),
                                          action: SnackBarAction(
                                            label: 'Undo',
                                            onPressed: () {
                                              // Perform undo operation
                                            },
                                          ),
                                        ),
                                      ))
                                  .onError((error, stackTrace) =>
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text('$error'),
                                          duration: const Duration(seconds: 5),
                                          action: SnackBarAction(
                                            label: 'Undo',
                                            onPressed: () {
                                              // Perform undo operation
                                            },
                                          ),
                                        ),
                                      ));

                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      SelectDriver()));
                            },
                            child: Text(
                              "Find Driver",
                              style: TextStyle(
                                fontSize: 14.sp,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 70, vertical: 14),
                              backgroundColor: Color(AppColorConst.yellow),
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
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 100.0, horizontal: 10),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      showplacesheet = !showplacesheet;
                    });
                  },
                  child: Opacity(
                    opacity: showplacesheet ? 0.4 : 1,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.yellow,
                          ),
                          borderRadius: BorderRadius.circular(50)),
                      child: CircleAvatar(
                        backgroundColor: Colors.black26,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            showplacesheet
                                ? Icons.keyboard_arrow_down
                                : Icons.keyboard_arrow_up,
                            color: Colors.yellowAccent,
                            shadows: [
                              BoxShadow(
                                  color: Colors.black,
                                  offset: Offset(1, 1),
                                  blurRadius: 4)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: PopupMenuButton(
                  icon: Icon(
                    Icons.nights_stay_sharp,
                    shadows: [
                      BoxShadow(
                          color: Colors.black54,
                          blurRadius: 4,
                          offset: Offset(1, 1))
                    ],
                  ),
                  color: Colors.yellow.withOpacity(0.8),
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  initialValue: 23,
                  elevation: 40,
                  splashRadius: 22,
                  position: PopupMenuPosition.over,
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem(
                        onTap: () {
                          gmapControllerCompleter.future.then((value) {
                            DefaultAssetBundle.of(context)
                                .loadString('assets/theme/night.json')
                                .then((string) => value.setMapStyle(string));
                          });
                        },
                        value: 1,
                        child: Column(
                          children: [
                            Text('Night Theme'),
                            Divider(),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        onTap: () {
                          gmapControllerCompleter.future.then((value) {
                            DefaultAssetBundle.of(context)
                                .loadString('assets/theme/bluenight.json')
                                .then((string) => value.setMapStyle(string));
                          });
                        },
                        value: 2,
                        child: Column(
                          children: [
                            Text('Blue Night Theme'),
                            Divider(),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        onTap: () {
                          gmapControllerCompleter.future.then((value) {
                            DefaultAssetBundle.of(context)
                                .loadString('assets/theme/retro.json')
                                .then((string) => value.setMapStyle(string));
                          });
                        },
                        value: 2,
                        child: Column(
                          children: [
                            Text('Retro Theme'),
                            Divider(),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        onTap: () {
                          gmapControllerCompleter.future.then((value) {
                            DefaultAssetBundle.of(context)
                                .loadString('assets/theme/silver.json')
                                .then((string) => value.setMapStyle(string));
                          });
                        },
                        value: 2,
                        child: Column(
                          children: [
                            Text('Silver Theme'),
                            Divider(),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        onTap: () {
                          gmapControllerCompleter.future.then((value) {
                            DefaultAssetBundle.of(context)
                                .loadString('assets/theme/normal.json')
                                .then((string) => value.setMapStyle(string));
                          });
                        },
                        value: 2,
                        child: Column(
                          children: [
                            Text('Normal Theme'),
                            Divider(),
                          ],
                        ),
                      ),
                    ];
                  }),
            )
          ],
        ),
      ),
    );
  }

  TextEditingController seatsnocont = TextEditingController();
  fareshowDialog1(BuildContext context) {
    Widget closeButton = TextButton(
      child: YellowTextWidget(
        "Close",
        14,
        "Mulish-Bold",
      ),
      onPressed: () => Navigator.of(context).pop(),
    );
    Widget DoneButton = TextButton(
        child: YellowTextWidget(
          "Done",
          14,
          "Mulish-Bold",
        ),
        onPressed: () {
          setState(() {
            Navigator.of(context).pop();
          });
        });
    AlertDialog alert = AlertDialog(
      scrollable: true,
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("Specify your number of seats"),
            Divider(
              thickness: 2,
              color: Color(AppColorConst.light_gray),
            ),
            ListTile(
              leading: Text(
                "SEATS",
                style: TextStyle(
                    fontFamily: "Mulish-ExtraBold",
                    fontSize: 30,
                    color: Color(AppColorConst.yellow)),
              ),
              title: TextField(
                controller: seatsnocont,
                keyboardType: TextInputType.number,
                maxLines: 1,
                cursorColor: Colors.black,
                cursorHeight: 22,
                decoration: InputDecoration(
                  hintText: "e.g 4",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(AppColorConst.black)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(AppColorConst.yellow)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        closeButton,
        DoneButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
