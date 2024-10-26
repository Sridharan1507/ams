import 'dart:async';


import 'package:ams/bloc/auth/auth_bloc.dart';
import 'package:ams/bloc/auth/auth_state.dart';
import 'package:ams/constant.dart';
import 'package:ams/screens/home/machine_configurator.dart';
import 'package:ams/screens/login/sign_up.dart';
import 'package:ams/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(), child: const SplashScreenFul());
  }
}

class SplashScreenFul extends StatefulWidget {
  const SplashScreenFul({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SplashWidgetScreen();
  }
}

class SplashWidgetScreen extends State<SplashScreenFul> {
  AuthBloc? authBloc;

  @override
  void initState() {
    super.initState();
    authBloc = BlocProvider.of<AuthBloc>(context);

    getSession();
  }

  getSession() async {
    String mobile = await SharedPreference.getMobileNumber();
    String sessionToken = await SharedPreference.getSessionId();

    if (mobile.isNotEmpty && sessionToken.isNotEmpty) {
      // need to login with saved credentials


    } else {
      navigatePage();
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (!authBloc!.isClosed) {
      authBloc!.close();
      authBloc = null;
    }
  }

  final signUp = const SignUpScreen();
  final dashboard = MachineConfiguratorScreen(
  );


  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: authBloc,
        builder: (context, AuthState state) {
          if (state is ValidateSessionLoadedState) {
            SharedPreference.saveAuthToken(
                state.validateSessionRsp.authToken.toString());
            SharedPreference.saveSessionId(
                state.validateSessionRsp.sessionToken.toString());
            navigatePage();
          }

          if (state is AuthInitialState) {
            return _splash(context);
            //debugPrint("Inside AuthInitialState");
          }
          if (state is AuthLoadingState) {
            debugPrint("Inside AuthLoadingState");
          }
          if (state is ValidateSessionErrorState) {
            navigateSignup();
            debugPrint("Inside AuthErrorState");
          }
          return _splash(context);
        });
  }

  navigateSignup() async {
    await SharedPreference.logout();
    Timer(
        const Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (BuildContext context) => signUp),
            ));
  }

  navigatePage() {
    SharedPreference.getIsLogged().then((islogged) {
      if (islogged) {
        Timer(
            const Duration(seconds: 2),
            () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (BuildContext context) => dashboard),
                ));
      }
      if (!islogged) {
        Timer(
            const Duration(seconds: 2),
            () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (BuildContext context) => signUp),
                ));
      }
    });
  }

  Widget _splash(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Stack(
        children: <Widget>[
          Align(
              alignment: Alignment.center,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(Constant.splashlogo),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.center,
                  ),
                ),
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text("Powered by Ezeeinfo Cloud Solutions",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.0,
                      color: Constant.textColorDark,
                    ))),
          ),
        ],
      ),
    );
  }
}
