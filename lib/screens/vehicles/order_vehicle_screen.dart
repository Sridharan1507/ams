// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:ams/bloc/vehicle/vehicle_state.dart';
import 'package:ams/constant.dart';
import 'package:ams/model/vehicle/get_vechiles.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

import '../../model/vehicle/vehicle_sub_cat.dart';
import 'controller.dart';
import 'package:geolocator/geolocator.dart' as geo;

class OrderConfirmationScreen extends StatefulWidget {
  final VechileList vehicleSubCatResponseData;

  final String? assetImagepath;
  OrderConfirmationScreen({required this.vehicleSubCatResponseData,this.assetImagepath});
  @override
  _OrderConfirmationScreenState createState() =>
      _OrderConfirmationScreenState();
}

class _OrderConfirmationScreenState extends State<OrderConfirmationScreen> {
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

  // *For Payment (9043117008 , 93425 04211)

  Future<void> _fetchAddress() async {
    geo.Position geoposition = await geo.Geolocator.getCurrentPosition(
                desiredAccuracy: geo.LocationAccuracy.medium);
              // geoposition.latitude;
    // geoposition.longitude;
    double latitude = geoposition.latitude;
    //  12.925090; // Replace with your latitude
    double longitude =geoposition.longitude;
    //  80.100870; // Replace with your longitude
    String address = await getAddressFromLatLng(latitude, longitude);
    setState(() {
      _address = address;
    });
    print("adddress $_address");
  }

  String amountType = '';

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      elevation: 0.8,
      enableDrag: true,
      isScrollControlled: true,
      // isDismissible: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ), // Allows you to control the height of the bottom sheet
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height *0.2 , // Half of the screen height
          color: Colors.white,
          child: ListView.builder(
            itemCount: 1, // The number of getEnquireyListResponse in the list
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: ClipPath(
                  clipper: ShapeBorderClipper(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  child: Text(
                                    "For  Payment Details",
                                    style: TextStyle(
                                        color: Constant
                                            .textRedColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  ),
                                ),
                               
                                
                              ]),
                               SizedBox(height: 5,),
                                Padding(
                                  padding: const EdgeInsets.only(left :15.0),
                                  child: SizedBox(
                                    child: Text(
                                      "Please Contact",
                                      style: TextStyle(
                                          color: Constant
                                              .textBlueColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                    ),
                                  ),
                                ),
                                  SizedBox(height: 5,),
                                SizedBox(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.phone,size: 17,),
                                          SizedBox(width: 4,),
                                          Text(
                                            "9043117008",
                                            style: TextStyle(
                                                color: Constant
                                                    .textColorDarkGrey,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5,),
                                       Row(
                                        children: [
                                          Icon(Icons.phone,size: 17),
                                          SizedBox(width: 4,),
                                          Text(
                                            "9342504211",
                                            style: TextStyle(
                                                color: Constant
                                                    .textColorDarkGrey,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                     
                        ]),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    amountType =
        widget.vehicleSubCatResponseData.amountType!.replaceAll("_", " ");

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
              decoration:  BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      widget.assetImagepath!), // Replace with your image asset
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
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      widget.vehicleSubCatResponseData.name ?? '',
                      style: const TextStyle(fontSize: 16), // Changed to 16
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Engine Number',
                    style: TextStyle(
                        fontSize: 13.5,
                        fontWeight: FontWeight.bold), // Changed to 13.5
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      widget.vehicleSubCatResponseData.engineNumber ?? '',
                      style: const TextStyle(
                          fontSize: 13.5,
                          fontWeight: FontWeight.bold), // Changed to 13.5
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Amount',
                    style: TextStyle(
                        fontSize: 13.5,
                        fontWeight: FontWeight.bold), // Changed to 13.5
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      "${widget.vehicleSubCatResponseData.amount ?? ''} - $amountType",
                      style: const TextStyle(
                          fontSize: 13.5,
                          fontWeight: FontWeight.bold), // Changed to 13.5
                    ),
                  ),
                  const SizedBox(height: 10),

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
                  GestureDetector(
                    onTap: () async {
                      if (await Controller.addinquiry(
                              widget.vehicleSubCatResponseData.code!) ==
                          1) {
                        Constant.toast(context, "enquiry added");
                      } else {
                        Constant.toast(context, "enquiry unable to add");
                      }

                      _showModalBottomSheet(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              color: Colors.black),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ), // Plus icon
                                SizedBox(
                                    width: 8), // Space between icon and text
                                Text(
                                  'Order',
                                  style: TextStyle(color: Colors.white),
                                ), // Button text
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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
