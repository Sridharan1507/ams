import 'dart:convert';
import 'dart:developer';

import 'package:ams/model/user_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ams/bloc/auth/auth_bloc.dart';
import 'package:ams/bloc/auth/auth_event.dart';
import 'package:ams/bloc/auth/auth_state.dart';
import 'package:ams/constant.dart';
import 'package:ams/http_service.dart';
import 'package:ams/model/auth_respose.dart';
import 'package:ams/repo/auth/login_repo.dart';
import 'package:ams/screens/home/machine_configurator.dart';
import 'package:ams/theme/theme.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameTextEditingController = TextEditingController();
   TextEditingController UserNameTextEditingController = TextEditingController();
    TextEditingController genderTextEditingController = TextEditingController();
     TextEditingController dobTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController =
      TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController mobileTextEditingController =
      TextEditingController();
  TextEditingController addressTextEditingController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? usernameErrorMessage;
  AuthBloc authBloc = AuthBloc();
  @override
  void initState() {
    super.initState();
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
                controller: UserNameTextEditingController,
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
              Container(
                padding: const EdgeInsets.only(bottom: 5, top: 7, left: 5),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Address",
                  style: Theme.of(context).custom().textBody5_Dark_M,
                ),
              ),
              Container(
                child: TextFormField(
                  controller: addressTextEditingController,
                  showCursor: true,
                  style: Theme.of(context).custom().textBody5_Light_M,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 15.0),
                    labelText: 'Enter Address',
                    labelStyle: Theme.of(context).custom().textBody5_Light_M,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                          color: Constant.borderColorLight!, width: 1),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Constant.borderColorLight!,
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
      
        buildElevatedButtonMedium("Save", Constant.buttonNegativeOkColor,
            Constant.buttonColorDark, Constant.buttonColorDark, () async {

              // UserRegisterRequestBody userRegisterRequestBody=UserRegisterRequestBody();
          // AuthRequest authRequest =
          //     AuthRequest(userName: "haridas", password: "123456");
          // authBloc.add(GetAuthTokenEvent(authRequest));

         Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                         MachineConfiguratorScreen()));
                 
        })
      ],
    );
  }

  Widget buildBloc() {
    return BlocBuilder<AuthBloc, AuthState>(
        bloc: authBloc,
        builder: (BuildContext context, state) {
          if (state is GetAuthTokenLoadingState) {
            print('GetAuthTokenLoadingState');
          }
          else if (state is GetAuthTokenLoadedState) {
            print('GetAuthTokenLoadedState');
            return Text("Loaded");
          }
          return Text("not yet");
        });
  }

  String calculateSeatAvailabilityPercentage(
      int bookedSeatCount, int totalSeatCount) {
    double per = ((bookedSeatCount / totalSeatCount) * 100);
    return (!per.isInfinite) && per > 0 ? "(${per.toStringAsFixed(2)}%)" : "";
  }
}

class UserNameCheck {
  String? username;

  UserNameCheck({this.username});

  UserNameCheck.fromJson(Map<String, dynamic> json) {
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    return data;
  }
}
