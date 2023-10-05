import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:uuid/uuid.dart';
import '../../../constants/colorconstant/colors.dart';
import 'package:http/http.dart' as http;

import '../../../provider/gmapplaces.dart';

class DestinationLocation extends StatefulWidget {
  const DestinationLocation({Key? key}) : super(key: key);

  @override
  State<DestinationLocation> createState() => _DestinationLocationState();
}

class _DestinationLocationState extends State<DestinationLocation> {
  ScrollController scontroller = ScrollController();
  TextEditingController placesinputcont = TextEditingController();

  var uuid = Uuid();
  String deviceid = '12345';
////////////////////////////////

  List<dynamic> predictionslist = [];
  ///////////-------

  void callbasef(String listen) async {
    // AIzaSyCom6WkLVrVjf9cBMBMQQk5ULGwOtPHUZk
    String places = 'AIzaSyCom6WkLVrVjf9cBMBMQQk5ULGwOtPHUZk';
    // String places = 'AIzaSyA7DwS07ALxveomntaOK2cCybUPCcjqZA8';
    String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request =
        '$baseURL?input=$listen&key=$places&sessiontoken=$deviceid';
    final resp = await http.get(Uri.parse(request));
    final respd = jsonDecode(resp.body);
    if (resp.statusCode == 200) {
      debugPrint(respd.toString());
      setState(() {
        // predictionslist = jsonDecode(resp.body.toString())['predictions'];
        predictionslist = jsonDecode(resp.body.toString())['predictions'];
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$respd not 200'),
          duration: const Duration(seconds: 15),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {},
          ),
        ),
      );
    }
  }

  ///////////-------
  @override
  void initState() {
    super.initState();
    Provider.of<Placesvariables>(context, listen: false).pickupplacesvalue;
  }

////////////////////////////////
////____________________________
  ////// get location by this
  dynamic getlatitude;
  dynamic getlongitude;

////____________________________
////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(AppColorConst.yellow),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        // centerTitle: true,
        title: Text(
          "Destination Location",
          style: TextStyle(
            fontFamily: "Mulish-Bold",
            fontSize: 18.sp,
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                  child: TextFormField(
                cursorColor: Colors.black,
                onChanged: (value) {
                  // ignore: unnecessary_null_comparison
                  if (uuid == null) {
                    deviceid = uuid.v4();
                  }
                  callbasef(value);
                },
                cursorHeight: 22,
                decoration: InputDecoration(
                  hintText: "Select Destination Address",
                  prefixIcon: Icon(
                    Icons.location_on_outlined,
                    color: Color(AppColorConst.yellow),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(AppColorConst.black)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(AppColorConst.yellow)),
                  ),
                ),
              )),
            ),
            ListView.builder(
              shrinkWrap: true,
              controller: scontroller,
              itemCount: predictionslist.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.shade200,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.white,
                              blurRadius: 4,
                              offset: Offset(1, 1))
                        ]),
                    child: ListTile(
                      title: Text(
                          predictionslist[index]['description'].toString()),
                      onTap: () async {
                        context.read<Placesvariables>().setnewdestination(
                            predictionslist[index]['description'].toString());
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'Selected: ${predictionslist[index]['description']}'),
                            duration: const Duration(seconds: 2),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {},
                            ),
                          ),
                        );
                        // Navigator.pop(context, ['khjl', 'dgfh']);
                        ///////////
                        try {
                          String address =
                              predictionslist[index]['description'];

                          List<Location> locations =
                              await locationFromAddress(address);

                          if (locations.isNotEmpty) {
                            double latitude = locations.first.latitude;
                            double longitude = locations.first.longitude;

                            Navigator.pop(context, [
                              latitude.toString(),
                              longitude.toString(),
                              address
                            ]);
                          } else {
                            print('No location found for the provided address');
                          }
                        } catch (e) {
                          print(e);
                        }
                      },
                      // subtitle: Consumer<Placesvariables>(
                      //     builder: (context, classname, child) {
                      //   return Text(classname.destinationvalue.toString());
                      // }),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
