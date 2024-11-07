import 'dart:convert';

import 'package:ams/bloc/vehicle/vehicle_bloc.dart';
import 'package:ams/bloc/vehicle/vehicle_event.dart';
import 'package:ams/bloc/vehicle/vehicle_state.dart';
import 'package:ams/constant.dart';
import 'package:ams/model/vehicle/add_vechiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyVehiclesScreen extends StatefulWidget {
  const MyVehiclesScreen({super.key});

  @override
  State<MyVehiclesScreen> createState() => _MyVehiclesScreenState();
}

class _MyVehiclesScreenState extends State<MyVehiclesScreen> {
  VehicleBloc vehicleBloc = VehicleBloc();
  List<MyvehilcesResponseData>? getMyVehicleRespo = [];
  List<GetEnquiresListResponseData>? getEnquireyListResponse = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    vehicleBloc.add(GetMyVehiclesEvent());
    vehicleBloc.add(GetEnquieryEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VehicleBloc, VehicleState>(
        listener: (context, state) {
          _listenerAddVehicleBloc(context, state);
        },
        bloc: vehicleBloc,
        builder: (context, VehicleState state) {
          if (state is GetMyVehicleLoadedState) {
            return Scaffold(
              appBar: AppBar(
                title: Text('My vehicles'),
              ),
              body: ListView.builder(
                itemCount: getMyVehicleRespo!
                    .length, // The number of getMyVehicleRespo in the list
                itemBuilder: (context, index) {
                  // Builds each item in the list
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Card(
                      surfaceTintColor: Colors.grey.shade100,
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child:
                            Text(getMyVehicleRespo![index].registrationNumber!),
                      ),
                    ),
                  );
                },
              ),
              persistentFooterButtons: [
                Center(
                  child: buildElevatedButtonLarge(
                      "Check Enquires",
                      Colors.white,
                      Colors.green,
                      Colors.grey.shade400, () async {
                    _showModalBottomSheet(context);
                  }),
                )
              ],
            );
          }
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        });
  }

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
          height: MediaQuery.of(context).size.height /
              2, // Half of the screen height
          color: Colors.white,
          child: ListView.builder(
            itemCount: getEnquireyListResponse!
                .length, // The number of getEnquireyListResponse in the list
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: Card(
                  surfaceTintColor: Colors.grey.shade100,
                  color: Colors.white,
                  elevation: 1,
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
                                      getEnquireyListResponse![index]
                                          .email
                                          .toString(),
                                      style: TextStyle(
                                          color: Constant
                                              .containerColorLightMediumGreen,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                    ),
                                  )
                                ]),
                            const SizedBox(
                              height: 2,
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          child: Row(
                                            children: [
                                              Text(
                                                "Mobile : ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.grey.shade400,
                                                    fontSize: 13),
                                              ),
                                              Text(
                                                getEnquireyListResponse![index]
                                                    .mobileNumber
                                                    .toString(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 13),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          child: Row(
                                            children: [
                                              Text(
                                                "Name : ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.grey.shade400,
                                                    fontSize: 13),
                                              ),
                                              Text(
                                                getEnquireyListResponse![index]
                                                    .ownerName
                                                    .toString(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 13),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ]),
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          child: Row(
                                            children: [
                                              Text(
                                                "Created At : ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.grey.shade400,
                                                    fontSize: 13),
                                              ),
                                              Text(
                                                getEnquireyListResponse![index]
                                                    .createdAt
                                                    .toString(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 13),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          child: Row(
                                            children: [
                                              Text(
                                                "Reg No : ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.grey.shade400,
                                                    fontSize: 13),
                                              ),
                                              Text(
                                                getEnquireyListResponse![index]
                                                    .registrationNumber
                                                    .toString(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 13),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ]),
                                ]),
                            const SizedBox(
                              height: 2,
                            ),
                          ]),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  buildElevatedButtonLarge(
      btnText, btnTextColor, btnColor, btnBorderColor, Function? onPress) {
    return Visibility(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 40,
        margin: const EdgeInsets.only(left: 10),
        child: ElevatedButton(
          onPressed: onPress as void Function()?,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(btnColor),
              padding: MaterialStateProperty.all(EdgeInsets.zero),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(width: 1, color: btnBorderColor)),
              )),
          child: Center(
            child: Text(btnText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: btnTextColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                )),
          ),
        ),
      ),
    );
  }

  _listenerAddVehicleBloc(context, state) {
    if (state is GetMyVehicleLoadedState) {
      getMyVehicleRespo = state.getMyVehicleResponse;
      print(jsonEncode(state.getMyVehicleResponse));
    }
    if (state is GetEnquireyListLoadedState) {
      getEnquireyListResponse = state.getEnquireyListResponse;
      print(jsonEncode(state.getEnquireyListResponse));
    }
  }
}
