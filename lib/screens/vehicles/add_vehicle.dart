// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:ams/bloc/vehicle/vehicle_bloc.dart';
import 'package:ams/bloc/vehicle/vehicle_event.dart';
import 'package:ams/bloc/vehicle/vehicle_state.dart';
import 'package:ams/model/get_user.dart';
import 'package:ams/model/vehicle/add_vechiles.dart';
import 'package:ams/model/vehicle/vehicle_cat.dart';
import 'package:ams/model/vehicle/vehicle_sub_cat.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ams/constant.dart';
import 'package:ams/theme/theme.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:geolocator/geolocator.dart' as geo;

class AddVehicleScrenn extends StatefulWidget {
  const AddVehicleScrenn({Key? key}) : super(key: key);

  @override
  _AddVehicleScrennState createState() => _AddVehicleScrennState();
}

class _AddVehicleScrennState extends State<AddVehicleScrenn> {
  TextEditingController vehicleNameTextEditingController =
      TextEditingController();
  TextEditingController regNumberTextEditingController =
      TextEditingController();
  TextEditingController engineNumberTextEditingController =
      TextEditingController();
  TextEditingController chasisnumberTextEditingController =
      TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController amountTextEditingController = TextEditingController();
  String amountType='';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  VehicleBloc vehicleBloc = VehicleBloc();
   VehicleBloc vehicleBloc_1 = VehicleBloc();
  String catIdCode = '';
  String subcatIdCode = '';

  List<VehicleSubCatResponseData> items = [];
    List<VehicleCatResposeData> vehicleCatList = [];
  @override
  void initState() {
    super.initState();
    
    vehicleBloc.add(GetVehicleCategoryEvent());
  }

  List<AmountType> amountTypeList = [
    AmountType(code: "PER_DAY", name: "Pay Per Day"),
    AmountType(code: "PER_HOUR", name: "Pay Per Hour"),
    AmountType(code: "PER_KM", name: "Pay Per Kilometer")
  ];

  @override
  Widget build(BuildContext context) {
    return buildAddVehicleForm();
  }

  Widget buildAddVehicleForm() {
    return BlocProvider(
      create: (context) => VehicleBloc(),
      child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            elevation: 0,
            shape: const Border(
                bottom: BorderSide(color: Color(0xFFf3f5f5), width: 1)),
            title: const Row(
              children: [
                Expanded(
                    child: Text('Add Vehicle',
                        style: TextStyle(color: Colors.black))),
              ],
            )),
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [buildVehicleDriverForm(), buildSaveButton()],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _listenerCatVehicleBloc(context, state) {
    if (state is GetVehicleCategoryLoadingState) {
      print('GetVehicleSubCategoryLoadingState');
    } else if (state is GetVehicleCategoryLoadedState) {
      _toast(context, "GetVehicleCategoryLoadedState Got");
      vehicleCatList = state.vehicleCatResposeData!;
     
      print("vehicleCatList ${vehicleCatList.length}");
      print("vehicleCatList ${vehicleCatList.map((e) => e.name)}");
    } else if (state is GetVehicleCategoryErrorState) {
      print('GetVehicleSubCategoryErrorState');
      _toast(context, state.error);
    }
  }
  _listenerGetUserBloc(context, state) {
    if (state is GetVehicleSubCategoryLoadingState) {
      print('GetVehicleSubCategoryLoadingState');
    } else if (state is GetVehicleSubCategoryLoadedState) {
      _toast(context, "GetVehicleSubCategoryLoadedState Got");
      items = state.vehicleSubCatResponseData!;
      filterProductsByCategory(catIdCode);
      print("items ${items.length}");
      print("items ${items.map((e) => e.name)}");
    } else if (state is GetVehicleSubCategoryErrorState) {
      print('GetVehicleSubCategoryErrorState');
      _toast(context, state.error);
    }
  }

  
  // Function to filter products by category_id
  void filterProductsByCategory(String categoryId) {
    // Filter products by category_id
    setState(() {
      items = items.where((product) => product.categoryId == categoryId).toList();
    });
  }

  Widget buildVehicleDriverForm() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Column(
        children: [
          BlocConsumer<VehicleBloc, VehicleState>(
              listener: (context, state) {
                _listenerCatVehicleBloc(context, state);
              },
              bloc: vehicleBloc,
              builder: (context, VehicleState state) {
                if (state is GetVehicleCategoryLoadedState) {
                  return DropdownSearch<VehicleCatResposeData>(
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      textAlignVertical: TextAlignVertical.center,
                      dropdownSearchDecoration: InputDecoration(
                          hintText: 'Select Vehicle Category',
                          hintStyle:
                              Theme.of(context).custom().textBody5_Dark_M,
                          border: InputBorder.none,
                          icon: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.local_shipping,
                              color: Colors.black,
                              size: 17,
                            ),
                          )),
                    ),
                    // mode: Mode.MENU, // You can also use Mode.BOTTOM_SHEET or Mode.DIALOG
                    itemAsString: (VehicleCatResposeData? v) {
                      if (v == null) {
                        return "";
                      }
                      return v.name ?? "";
                    },
                    items: state.vehicleCatResposeData!,
                    onChanged: (value) {
                      print("Selected: ${value!.code}");
                      catIdCode = value.id!;
                       vehicleBloc_1.add(GetVehicleSubCategoryEvent());
                    },
                    selectedItem:
                        null, // You can set a default selected item here
                    // showSearchBox: true, // Enables the search box
                  );
                }
                return const Text("user not yet");
              }),
          BlocConsumer<VehicleBloc, VehicleState>(
              listener: (context, state) {
                _listenerGetUserBloc(context, state);
              },
              bloc: vehicleBloc_1,
              builder: (context, VehicleState state) {
                if (state is GetVehicleSubCategoryLoadedState) {
                  return DropdownSearch<VehicleSubCatResponseData>(
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      textAlignVertical: TextAlignVertical.center,
                      dropdownSearchDecoration: InputDecoration(
                          hintText: 'Select Vehicle Sub Category',
                          hintStyle:
                              Theme.of(context).custom().textBody5_Dark_M,
                          border: InputBorder.none,
                          icon: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.local_shipping,
                              color: Colors.black,
                              size: 17,
                            ),
                          )),
                    ),
                    // mode: Mode.MENU, // You can also use Mode.BOTTOM_SHEET or Mode.DIALOG
                    itemAsString: (VehicleSubCatResponseData? v) {
                      if (v == null) {
                        return "";
                      }
                      return v.name ?? "";
                    },
                    items: items,
                    onChanged: (value) {
                      print("Selected: ${value!.code}");
                      subcatIdCode = value.categoryId!;
                    },
                    selectedItem:
                        null, // You can set a default selected item here
                    // showSearchBox: true, // Enables the search box
                  );
                }
                return const Text("user not yet");
              }),
          Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        bottom: 5, top: 7, left: 5, right: 2),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Vehicle Name",
                      style: Theme.of(context).custom().textBody5_Dark_M,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 2),
                    child: Text(
                      "*",
                      style: Theme.of(context).custom().textBody2_Red_SB,
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: vehicleNameTextEditingController,
                showCursor: true,
                style: Theme.of(context).custom().textBody5_Light_M,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15.0),
                  labelText: 'Enter Vehicle Name',
                  labelStyle: Theme.of(context).custom().textBody5_Light_M,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(color: Constant.borderColorLight!, width: 1),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Constant.borderColorLight!,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(color: Constant.borderColorLight!, width: 2),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        bottom: 5, top: 7, left: 5, right: 2),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Registration Number",
                      style: Theme.of(context).custom().textBody5_Dark_M,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 2),
                    child: Text(
                      "*",
                      style: Theme.of(context).custom().textBody2_Red_SB,
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: regNumberTextEditingController,
                showCursor: true,
                style: Theme.of(context).custom().textBody5_Light_M,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15.0),
                  labelText: 'Enter Registration Number',
                  labelStyle: Theme.of(context).custom().textBody5_Light_M,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(color: Constant.borderColorLight!, width: 1),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Constant.borderColorLight!,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(color: Constant.borderColorLight!, width: 2),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        bottom: 5, top: 7, left: 5, right: 2),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Engine Number",
                      style: Theme.of(context).custom().textBody5_Dark_M,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 2),
                    child: Text(
                      "*",
                      style: Theme.of(context).custom().textBody2_Red_SB,
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: engineNumberTextEditingController,
                showCursor: true,
                style: Theme.of(context).custom().textBody5_Light_M,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15.0),
                  labelText: 'Enter Engine Number',
                  labelStyle: Theme.of(context).custom().textBody5_Light_M,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(color: Constant.borderColorLight!, width: 1),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Constant.borderColorLight!,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(color: Constant.borderColorLight!, width: 2),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        bottom: 5, top: 7, left: 5, right: 2),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Chasis Number",
                      style: Theme.of(context).custom().textBody5_Dark_M,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 2),
                    child: Text(
                      "*",
                      style: Theme.of(context).custom().textBody2_Red_SB,
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: chasisnumberTextEditingController,
                showCursor: true,
                style: Theme.of(context).custom().textBody5_Light_M,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15.0),
                  labelText: 'Enter Chasis Number',
                  labelStyle: Theme.of(context).custom().textBody5_Light_M,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(color: Constant.borderColorLight!, width: 1),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Constant.borderColorLight!,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(color: Constant.borderColorLight!, width: 2),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        bottom: 5, top: 7, left: 5, right: 2),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Amount Type",
                      style: Theme.of(context).custom().textBody5_Dark_M,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 2),
                    child: Text(
                      "*",
                      style: Theme.of(context).custom().textBody2_Red_SB,
                    ),
                  ),
                ],
              ),
             DropdownSearch<AmountType>(
  dropdownDecoratorProps: DropDownDecoratorProps(
    dropdownSearchDecoration: InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      labelText: 'Enter Amount Type',
      labelStyle: Theme.of(context).custom().textBody5_Light_M,
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Constant.borderColorLight!, width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Constant.borderColorLight!,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Constant.borderColorLight!, width: 2),
      ),
      hintText: 'Select Amount Type',
      hintStyle: Theme.of(context).custom().textBody5_Dark_M,
      // icon: const Padding(
      //   padding: EdgeInsets.all(8.0),
      //   child: Icon(
      //     Icons.local_shipping,
      //     color: Colors.black,
      //     size: 17,
      //   ),
      // ),
    ),
  ),
  // mode: Mode.MENU, // You can also use Mode.BOTTOM_SHEET or Mode.DIALOG
  itemAsString: (AmountType? v) {
    if (v == null) {
      return "";
    }
    return v.name; // No need for `??` since name should not be null
  },
  items: amountTypeList,
  onChanged: (value) {
    print("Selected: ${value!.code}");
    amountType=value.code;
  },
  selectedItem: null, // You can set a default selected item here
  // showSearchBox: true, // Enables the search box
)
,
            //   TextFormField(
            //     controller: amountType,
            //     showCursor: true,
            //     style: Theme.of(context).custom().textBody5_Light_M,
            //     decoration: InputDecoration(
            //       contentPadding: const EdgeInsets.symmetric(
            //           vertical: 10.0, horizontal: 15.0),
            //       labelText: 'Enter Amount Type',
            //       labelStyle: Theme.of(context).custom().textBody5_Light_M,
            //       enabledBorder: OutlineInputBorder(
            //         borderRadius: const BorderRadius.all(Radius.circular(10)),
            //         borderSide:
            //             BorderSide(color: Constant.borderColorLight!, width: 1),
            //       ),
            //       errorBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(10),
            //         borderSide: BorderSide(
            //           color: Constant.borderColorLight!,
            //         ),
            //       ),
            //       focusedBorder: OutlineInputBorder(
            //         borderRadius: const BorderRadius.all(Radius.circular(10)),
            //         borderSide:
            //             BorderSide(color: Constant.borderColorLight!, width: 2),
            //       ),
            //     ),
            //   ),
            //
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        bottom: 5, top: 7, left: 5, right: 2),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Amount",
                      style: Theme.of(context).custom().textBody5_Dark_M,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 2),
                    child: Text(
                      "*",
                      style: Theme.of(context).custom().textBody2_Red_SB,
                    ),
                  ),
                ],
              ),
              Form(
                key: _formKey,
                child: TextFormField(
                  controller: amountTextEditingController,
                  showCursor: true,
                  style: Theme.of(context).custom().textBody5_Light_M,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 15.0),
                    labelText: 'Enter Amount',
                    labelStyle: Theme.of(context).custom().textBody5_Light_M,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                          color: Constant.borderColorLight!, width: 1),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Constant.borderErrorRed!,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                          color: Constant.borderColorLight!, width: 2),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  buildElevatedButtonMedium(
      btnText, btnTextColor, btnColor, btnBorderColor, Function? onPress) {
    return Visibility(
      child: Container(
        width: 150,
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
                  fontSize: 13,
                )),
          ),
        ),
      ),
    );
  }

  Widget buildSaveButton() {
    return Column(
      children: [
        buildBloc(),
        buildElevatedButtonMedium("Add", Constant.buttonNegativeOkColor,
            Constant.buttonColorDark, Constant.buttonColorDark, () async {
          if (vehicleNameTextEditingController.text.isEmpty) {
            _toast(context, "Please enter Vehicle Name");
          } else if (regNumberTextEditingController.text.isEmpty) {
            _toast(context, "Please enter Registration Number");
          } else if (amountTextEditingController.text.isEmpty) {
            _toast(context, "Please enter Amount");
          } else if (amountType.isEmpty) {
            _toast(context, "Please enter Amount type");
          } else if (chasisnumberTextEditingController.text.isEmpty) {
            _toast(context, "Please enter Chasis number");
          } else if (engineNumberTextEditingController.text.isEmpty) {
            _toast(context, "Please enter Engine NUmber");
          } else {
            // geo.Position geoposition = await geo.Geolocator.getCurrentPosition(
            //     desiredAccuracy: geo.LocationAccuracy.medium);

            AddVehicleRequestBody addVehicleRequestBody = AddVehicleRequestBody(
                subCatId: int.parse(subcatIdCode),
                vehicleName: vehicleNameTextEditingController.text.trim(),
                registrationNumber: regNumberTextEditingController.text.trim(),
                engineNumber: engineNumberTextEditingController.text.trim(),
                chassisNumber: chasisnumberTextEditingController.text.trim(),
                radius: 50,
                lat: 40.712776,
                // geoposition.latitude,
                lng: -74.005974,
                // geoposition.longitude,
                amount: double.parse(amountTextEditingController.text.trim()),
                amountType: amountType,
                availabilityFlag: 1);
            vehicleBloc.add(AddVehicleEvent(addVehicleRequestBody));
            print("${jsonEncode(addVehicleRequestBody)}");
          }
        })
      ],
    );
  }

  Widget buildBloc() {
    return BlocConsumer<VehicleBloc, VehicleState>(
        listener: (context, state) {
          _listenerAddVehicleBloc(context, state);
        },
        bloc: vehicleBloc,
        builder: (context, VehicleState state) {
          if (state is AddVehicleLoadedState) {
            return const Text("Loaded");
          }
          return const Text("not yet");
        });
  }

  _listenerAddVehicleBloc(context, state) {
    if (state is AddVehicleLoadingState) {
      print('Vehicle loading');
    } else if (state is AddVehicleErrorState) {
      print('VehicleReg error');
      _toast(context, state.error);
    } else if (state is AddVehicleLoadedState) {
      print('Vehicle reg loaded');
      Navigator.pop(context);
      _toast(context, "Vehicle Added Succesfully");
    }
  }

  void _toast(BuildContext context, String errDesc) async {
    await Future.delayed(const Duration(microseconds: 1));
    if (WidgetsBinding.instance.window.viewInsets.bottom > 0.0) {
      FocusScope.of(context).requestFocus(FocusNode());
    }
    showToast(errDesc,
        textStyle:
            TextStyle(fontSize: 15.0, color: Constant.textColorExtraLight),
        context: context,
        backgroundColor: Colors.red,
        animation: StyledToastAnimation.slideFromBottom,
        reverseAnimation: StyledToastAnimation.slideToBottom,
        startOffset: const Offset(0.0, 3.0),
        reverseEndOffset: const Offset(0.0, 3.0),
        position: StyledToastPosition.bottom,
        duration: const Duration(seconds: 4),
        animDuration: const Duration(seconds: 1),
        curve: Curves.elasticOut,
        reverseCurve: Curves.fastOutSlowIn);
  }
}
