// ignore_for_file: use_build_context_synchronously

import 'package:ams/bloc/auth/auth_event.dart';
import 'package:ams/bloc/user/user_bloc.dart';
import 'package:ams/bloc/user/user_event.dart';
import 'package:ams/bloc/user/user_state.dart';
import 'package:ams/model/auth_respose.dart';
import 'package:ams/model/change_password.dart';
import 'package:ams/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ams/bloc/auth/auth_bloc.dart';
import 'package:ams/bloc/auth/auth_state.dart';
import 'package:ams/constant.dart';
import 'package:ams/screens/home/machine_configurator.dart';
import 'package:ams/theme/theme.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController newPasswordTextEditingController = TextEditingController();

  TextEditingController passwordTextEditingController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => UserBloc())
      ],
      // : (context) => AuthBloc(),
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
                        Text('Change Password', style: TextStyle(color: Colors.black))),
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
                      "Old Password",
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
                    labelText: 'Enter Old Password',
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
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        bottom: 5, top: 7, left: 5, right: 2),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "New Password",
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
                controller: newPasswordTextEditingController,
                showCursor: true,
                style: Theme.of(context).custom().textBody5_Light_M,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15.0),
                  labelText: 'Enter new password',
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
        buildAuthBlocWidget(),
        buildElevatedButtonMedium("Save", Constant.buttonNegativeOkColor,
            Constant.buttonColorDark, Constant.buttonColorDark, () async {
          if (newPasswordTextEditingController.text.isEmpty) {
            _toast(context, "Please Enter new Password");
          } else if (passwordTextEditingController.text.isEmpty) {
            _toast(context, "Plaese enter old Password");
          } else {
            ChangePasswordRequestBody changePasswordRequestBody = ChangePasswordRequestBody(
                currentPassword: passwordTextEditingController.text.trim(),
                password: newPasswordTextEditingController.text.trim());

            authBloc.add(ChangePasswordEvent(changePasswordRequestBody));
          }
        })
      ],
    );
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

  _listenerGetTicketDetailsBloc(context, state) {
    if (state is ChangePasswordLoadingState) {
      print('GetAuthTokenLoadingState');
    } else if (state is ChangePasswordLoadedState) {
      print('GetAuthTokenLoadedState');

      print("newPasswordTextEditingController.text.trim() ${newPasswordTextEditingController.text.trim()}");
              SharedPreference.savePassword( newPasswordTextEditingController.text.trim());
          
         

      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) =>
               MachineConfiguratorScreen()));
    } else if (state is ChangePasswordErrorState) {
      print('GetAuthToken Error');
      _toast(context, state.error);
    }
  }

  getPassword()async{
    String password=await SharedPreference.getPassword();
    print("password $password");
  }

    _listenerGetUserBloc(context, state) {
    if (state is GetUserLoadingState) {
      print('Get User loading');
    } else if (state is GetUserLoadedState) {
      _toast(context, "User Got");
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) =>
               MachineConfiguratorScreen( getUserResponseData: state.getUserResponseData![0])));
    } else if (state is GetUserErrorState) {
      print('Get user eeor Error');
      _toast(context, state.error);
    }
  }

  Widget buildAuthBlocWidget() {
    return BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          _listenerGetTicketDetailsBloc(context, state);
        },
        bloc: authBloc,
        builder: (context, AuthState state) {
          if (state is ChangePasswordLoadedState) {
             getPassword();
            return const SizedBox();
          }
          return const SizedBox();
        });
  }


}
