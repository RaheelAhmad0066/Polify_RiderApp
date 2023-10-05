import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class SeePolyLinePage extends StatefulWidget {
  @override
  _SeePolyLinePageState createState() => _SeePolyLinePageState();
}

class _SeePolyLinePageState extends State<SeePolyLinePage> {
  Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();

  double startMarkerLatitude = 31.5204;
  double startMarkerLongitude = 74.3587;
  double endMarkerLatitude = 33.6844;
  double endMarkerLongitude = 73.0479;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getPolyline();
    });
  }

  Future<void> getPolyline() async {
    try {
      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        "AIzaSyA7DwS07ALxveomntaOK2cCybUPCcjqZA8",
        PointLatLng(startMarkerLatitude, startMarkerLongitude),
        PointLatLng(endMarkerLatitude, endMarkerLongitude),
        travelMode: TravelMode.driving,
      );

      if (result.errorMessage!.isEmpty) {
        result.points.forEach((PointLatLng point) {
          polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(result.errorMessage.toString()),
            duration: const Duration(seconds: 5),
          ),
        );
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error fetching polyline points."),
          duration: const Duration(seconds: 5),
        ),
      );
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map Page'),
      ),
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          mapController.complete(controller);
        },
        polylines: {
          Polyline(
            polylineId: PolylineId('polyline'),
            color: Colors.blue,
            width: 5,
            points: polylineCoordinates,
          ),
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(startMarkerLatitude, startMarkerLongitude),
          zoom: 12,
        ),
      ),
    );
  }
}
