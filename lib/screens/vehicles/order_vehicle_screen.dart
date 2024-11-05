
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class HalfImageHalfTextScreen extends StatefulWidget {
  @override
  _HalfImageHalfTextScreenState createState() =>
      _HalfImageHalfTextScreenState();
}

class _HalfImageHalfTextScreenState extends State<HalfImageHalfTextScreen> {
  @override
  void initState() {
    // TODO: implement initState
    _fetchAddress();
    super.initState();
  }

  String _address = '';

  getLocation() async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(52.2165157, 6.9437819);

    print("placemarks ${jsonEncode(placemarks)}");
  }

  Future<String> getAddressFromLatLng(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      Placemark place = placemarks[0];

      return '${place.street},${place.subLocality},${place.name},${place.locality}, ${place.postalCode}, ${place.administrativeArea},${place.country}.';
    } catch (e) {
      return 'Failed to get address: $e';
    }
  }

  void showCustomModalBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.30, // 3/4 of screen height
        color: Colors.white,
        padding: const EdgeInsets.all(16),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment process',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.red),
            ),
            SizedBox(height: 12),
            Text('For Order Confirmation and Payment Details, Contact this number',style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),),
            
            SizedBox(height: 8), Row(
              children: [
                Icon(Icons.call),
                Padding(
                  padding: EdgeInsets.only(left:4.0),
                  child: Text('9043117008',style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),),
                ),
              ],
            ),
            
            SizedBox(height: 6),  Row(
              children: [
                Icon(Icons.call),
                Padding(
                  padding: EdgeInsets.only(left:4.0),
                  child: Text('9342504211',style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}

  Future<void> _fetchAddress() async {
    // "lat": "12.971600",
    //           "lng": "77.594600",
    double latitude = 12.925090; // Replace with your latitude
    double longitude = 80.100870; // Replace with your longitude
    String address = await getAddressFromLatLng(latitude, longitude);
    setState(() {
      _address = address;
    });
    print("adddress $_address");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            elevation: 0,
            shape: const Border(
                bottom: BorderSide(color: Color(0xFFf3f5f5), width: 1)),
            title: const Row(
              children: [
                Expanded(
                    child: Text('Order', style: TextStyle(color: Colors.black))),
              ],
            )),
      body: SafeArea(
        child: Column(
          children: [
            // Image half
            Container(
              height: MediaQuery.of(context).size.height * 0.30,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'lib/assets/images/tractor-cultivating-field.jpg'), // Replace with your image asset
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 20),
                  child: Text(
                    'Machine Details',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold), // Changed to 13.5
                  ),
                ),
              ],
            ),
            // Text container half
            Container(
              padding: const EdgeInsets.all(20.0),
              color: Colors.white, // Change background color if needed
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Registration Number',
                    style: TextStyle(
                        fontSize: 13.5,
                        fontWeight: FontWeight.bold), // Changed to 13.5
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'This is some descriptive text about the image.',
                    style: TextStyle(fontSize: 16), // Changed to 16
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Vehicle Name',
                    style: TextStyle(
                        fontSize: 13.5,
                        fontWeight: FontWeight.bold), // Changed to 13.5
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'This is some descriptive text about the image.',
                    style: TextStyle(fontSize: 16), // Changed to 16
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Engine Number',
                    style: TextStyle(
                        fontSize: 13.5,
                        fontWeight: FontWeight.bold), // Changed to 13.5
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'This is some descriptive text about the image.',
                    style: TextStyle(fontSize: 16), // Changed to 16
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Amount",
                    style: TextStyle(
                        fontSize: 13.5,
                        fontWeight: FontWeight.bold), // Changed to 13.5
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'This is some descriptive text about the image.',
                    style: TextStyle(fontSize: 16), // Changed to 16
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Area",
                    style: TextStyle(
                        fontSize: 13.5,
                        fontWeight: FontWeight.bold), // Changed to 13.5
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _address,
                    style: const TextStyle(fontSize: 16), // Changed to 16
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          showCustomModalBottomSheet( context);
                        },
                        child: Container(
                          decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(4)),color: Colors.black),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ), // Plus icon
                                SizedBox(width: 8), // Space between icon and text
                                Text(
                                  'Order',
                                  style: TextStyle(color: Colors.white),
                                ), // Button text
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // _address

                  // Add more text widgets as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
