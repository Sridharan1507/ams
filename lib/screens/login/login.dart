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

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 
   TextEditingController UserNameTextEditingController = TextEditingController();
  
  TextEditingController passwordTextEditingController = TextEditingController();
 

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? usernameErrorMessage;
  AuthBloc authBloc = AuthBloc();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildLoginForm();
  }

  Widget buildLoginForm() {
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
                        Text('LogIn', style: TextStyle(color: Colors.black))),
              ],
            )),
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [buildLoginFormList(), buildLoginButton()],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLoginFormList() {
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

  Widget buildLoginButton() {
    return Column(
      children: [
        buildBloc(),
      
        buildElevatedButtonMedium("Login", Constant.buttonNegativeOkColor,
            Constant.buttonColorDark, Constant.buttonColorDark, () async {


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
