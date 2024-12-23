import 'dart:convert';

import 'package:ams/bloc/auth/auth_event.dart';
import 'package:ams/model/auth/servicelist.dart';
import 'package:ams/model/user_register.dart';
import 'package:ams/screens/login/authcon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ams/bloc/auth/auth_bloc.dart';
import 'package:ams/bloc/auth/auth_state.dart';
import 'package:ams/constant.dart';
import 'package:ams/screens/home/machine_configurator.dart';
import 'package:ams/theme/theme.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:intl/intl.dart';
import 'package:multi_dropdown/multi_dropdown.dart';

class StoreUser extends StatefulWidget {
  const StoreUser({Key? key}) : super(key: key);

  @override
  _StoreUserState createState() => _StoreUserState();
}

class _StoreUserState extends State<StoreUser> {
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController userNameTextEditingController = TextEditingController();
  TextEditingController genderTextEditingController = TextEditingController();
  TextEditingController dobTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController mobileTextEditingController = TextEditingController();
  TextEditingController addressTextEditingController = TextEditingController();
  TextEditingController storeNameCon = TextEditingController();
  TextEditingController addressCon = TextEditingController();
  TextEditingController stateCon = TextEditingController();
  TextEditingController cityCon = TextEditingController();
  TextEditingController pinCon = TextEditingController();
  MultiSelectController<Servicelist> controller =
      MultiSelectController<Servicelist>();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? usernameErrorMessage;
  AuthBloc authBloc = AuthBloc();
  List<Servicelist> services = [];
  List<DropdownItem<Servicelist>> servicedropdown = [];
  bool isload = false;
  @override
  void initState() {
    getrecord();
    super.initState();
  }

  getrecord() async {
    isload = false;
    services = await AuthController().getallservice();
    isload = true;

    controller = MultiSelectController<Servicelist>();
    servicedropdown = services
        .map(
          (item) => DropdownItem<Servicelist>(label: item.name, value: item),
        )
        .toList();
    setState(() {});
  }

  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return buildActiveTripInfoVehicleAndDriver();
  }

  Widget buildActiveTripInfoVehicleAndDriver() {
    return BlocProvider(
      create: (context) => AuthBloc(),
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
                    child:
                        Text('Sign Up', style: TextStyle(color: Colors.black))),
              ],
            )),
        body: SafeArea(
          child: Center(
            child: Visibility(
              visible: isload,
              replacement: const CircularProgressIndicator(),
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
        ),
      ),
    );
  }

  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day + 90, 0, 0, 0));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  String busDateFormat(DateTime date) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(date);
    return formatted;
  }

  Widget buildVehicleDriverForm() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Column(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        bottom: 5, top: 7, left: 5, right: 2),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Name",
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
                controller: nameTextEditingController,
                showCursor: true,
                style: Theme.of(context).custom().textBody5_Light_M,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15.0),
                  labelText: 'Enter Name',
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
                      "User Name",
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
                controller: userNameTextEditingController,
                showCursor: true,
                style: Theme.of(context).custom().textBody5_Light_M,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15.0),
                  labelText: 'Enter User Name',
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
                      "Gender",
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
                controller: genderTextEditingController,
                showCursor: true,
                style: Theme.of(context).custom().textBody5_Light_M,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15.0),
                  labelText: 'Enter Gender',
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
                      "DOB",
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

              //         GestureDetector(
              //           onTap: () => _selectDate(context),
              //           child: Container(
              // padding: EdgeInsets.symmetric(horizontal: 16.0),
              // decoration: BoxDecoration(
              //   border: Border.all(color: Colors.grey), // Border color
              //   borderRadius: BorderRadius.circular(8.0), // Rounded corners
              // ),
              //             child: RichText(
              //                     text: TextSpan(
              //                       children: [
              //                         TextSpan(
              //                             text: "${busDateFormat(selectedDate)} ",
              //                             style: const TextStyle(
              //                                 fontSize: 15.0,
              //                                 color: Colors.black)),

              //                       ],
              //                     ),
              //                   ),
              //           ),
              //         ),

              TextFormField(
                controller: dobTextEditingController,
                showCursor: true,
                style: Theme.of(context).custom().textBody5_Light_M,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15.0),
                  labelText: 'Enter Date of Birth',
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
                      "Mobile",
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
                controller: mobileTextEditingController,
                showCursor: true,
                style: Theme.of(context).custom().textBody5_Light_M,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15.0),
                  labelText: 'Enter Mobile Number',
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
                      "Email",
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
                controller: emailTextEditingController,
                showCursor: true,
                style: Theme.of(context).custom().textBody5_Light_M,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15.0),
                  labelText: 'Enter Email',
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
                      "Password",
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
                  controller: passwordTextEditingController,
                  showCursor: true,
                  style: Theme.of(context).custom().textBody5_Light_M,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 15.0),
                    labelText: 'Enter Password',
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
          Column(
            children: [
              SizedBox(
                height: 20,
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
                          "Store name",
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
                    controller: storeNameCon,
                    showCursor: true,
                    style: Theme.of(context).custom().textBody5_Light_M,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15.0),
                      labelText: 'Enter Store name',
                      labelStyle: Theme.of(context).custom().textBody5_Light_M,
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                            color: Constant.borderColorLight!, width: 2),
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
                          "Store address",
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
                    controller: addressCon,
                    showCursor: true,
                    style: Theme.of(context).custom().textBody5_Light_M,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15.0),
                      labelText: 'Enter Store address',
                      labelStyle: Theme.of(context).custom().textBody5_Light_M,
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                            color: Constant.borderColorLight!, width: 2),
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
                          "State",
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
                    controller: stateCon,
                    showCursor: true,
                    style: Theme.of(context).custom().textBody5_Light_M,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15.0),
                      labelText: 'Enter State',
                      labelStyle: Theme.of(context).custom().textBody5_Light_M,
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                            color: Constant.borderColorLight!, width: 2),
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
                          "Pincode",
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
                    controller: pinCon,
                    showCursor: true,
                    style: Theme.of(context).custom().textBody5_Light_M,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15.0),
                      labelText: 'Enter Pincode',
                      labelStyle: Theme.of(context).custom().textBody5_Light_M,
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                            color: Constant.borderColorLight!, width: 2),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              MultiDropdown<Servicelist>(
                items: servicedropdown,
                controller: controller,
                enabled: true,
                searchEnabled: true,
                chipDecoration: const ChipDecoration(
                  backgroundColor: Colors.yellow,
                  wrap: true,
                  runSpacing: 2,
                  spacing: 10,
                ),
                fieldDecoration: FieldDecoration(
                  hintText: 'Services',
                  hintStyle: const TextStyle(color: Colors.black87),
                  prefixIcon: const Icon(CupertinoIcons.settings),
                  showClearIcon: false,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.black87,
                    ),
                  ),
                ),
                dropdownDecoration: const DropdownDecoration(
                  marginTop: 2,
                  maxHeight: 500,
                  header: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Select Services',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                dropdownItemDecoration: DropdownItemDecoration(
                  selectedIcon:
                      const Icon(Icons.check_box, color: Colors.green),
                  disabledIcon: Icon(Icons.lock, color: Colors.grey.shade300),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a country';
                  }
                  return null;
                },
                onSelectionChange: (selectedItems) {
                  debugPrint("OnSelectionChange: $selectedItems");
                },
              ),
              SizedBox(
                height: 20,
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
        buildElevatedButtonMedium("Save", Constant.buttonNegativeOkColor,
            Constant.buttonColorDark, Constant.buttonColorDark, () async {
          if (nameTextEditingController.text.isEmpty) {
            _toast(context, "Please enter Name");
          } else if (userNameTextEditingController.text.isEmpty) {
            _toast(context, "Please enter User Name");
          } else if (emailTextEditingController.text.isEmpty) {
            _toast(context, "Please enter Email");
          } else if (passwordTextEditingController.text.isEmpty) {
            _toast(context, "Please enter Password");
          } else if (mobileTextEditingController.text.isEmpty) {
            _toast(context, "Please enter Mobile numer");
          } else if (dobTextEditingController.text.isEmpty) {
            _toast(context, "Please enter Date of Birth");
          } else if (genderTextEditingController.text.isEmpty &&
              (genderTextEditingController.text.trim() == "male" ||
                  genderTextEditingController.text.trim() == "female")) {
            _toast(context, "Please enter valid Gender");
          } else {
            List<int> serviceid = [];
            controller.selectedItems.forEach((element) {
              serviceid.add(int.parse(element.value.id));
            });
            Userstore userRegisterRequestBody = Userstore(
              name: nameTextEditingController.text.trim(),
              userName: userNameTextEditingController.text.trim(),
              email: emailTextEditingController.text.trim(),
              password: passwordTextEditingController.text.trim(),
              mobileNumber: mobileTextEditingController.text.trim(),
              dob: DateTime.now(),
              gender: genderTextEditingController.text.trim(),
              deviceToken: "",
              store: [
                Store(
                    storeName: storeNameCon.text,
                    categoryId: 2,
                    services: serviceid
                        .toString()
                        .replaceAll("[", "")
                        .replaceAll("]", ""),
                    address: addressCon.text,
                    city: "cuddalore",
                    state: stateCon.text,
                    pincode: 607001,
                    aadharNumber: '33e',
                    coords: '12.91484690850322, 80.10231545247325')
              ],
            );
            print(jsonEncode(userRegisterRequestBody.toJson()));
            String status =
                await AuthController().addstoreuser(userRegisterRequestBody);

            _toast(context, status);
            if (status == "success") {
              Navigator.pop(context);
            }
          }
        })
      ],
    );
  }

  Widget buildBloc() {
    return BlocBuilder<AuthBloc, AuthState>(
        bloc: authBloc,
        builder: (BuildContext context, state) {
          if (state is UserRegistrationLoadingState) {
            print('user loading');
          } else if (state is UserRegistrationErrorState) {
            print('UserReg error');
            _toast(context, state.error);
            return const SizedBox();
          } else if (state is UserRegistrationLoadedState) {
            print('user reg loaded');
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) =>
                    const MachineConfiguratorScreen()));
            return const SizedBox();
          }
          return const SizedBox();
        });
  }

  String calculateSeatAvailabilityPercentage(
      int bookedSeatCount, int totalSeatCount) {
    double per = ((bookedSeatCount / totalSeatCount) * 100);
    return (!per.isInfinite) && per > 0 ? "(${per.toStringAsFixed(2)}%)" : "";
  }
}

void _toast(BuildContext context, String errDesc) async {
  await Future.delayed(const Duration(microseconds: 1));
  if (WidgetsBinding.instance.window.viewInsets.bottom > 0.0) {
    FocusScope.of(context).requestFocus(FocusNode());
  }
  showToast(errDesc,
      textStyle: TextStyle(fontSize: 15.0, color: Constant.textColorExtraLight),
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
