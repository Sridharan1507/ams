import 'dart:async';

import 'package:ams/bloc/auth/auth_bloc.dart';
import 'package:ams/bloc/auth/auth_event.dart';
import 'package:ams/bloc/auth/auth_state.dart';
import 'package:ams/bloc/user/user_bloc.dart';
import 'package:ams/bloc/user/user_event.dart';
import 'package:ams/bloc/user/user_state.dart';
import 'package:ams/constant.dart';
import 'package:ams/model/auth_respose.dart';
import 'package:ams/model/get_user.dart';
import 'package:ams/screens/home/machine_configurator.dart';
import 'package:ams/screens/login/sign_in.dart';
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
  AuthBloc authBloc = AuthBloc();
  UserBloc userBloc = UserBloc();

  @override
  void initState() {
    super.initState();
    // authBloc = BlocProvider.of<AuthBloc>(context);
    // userBloc =BlocProvider.of<UserBloc>(context);

    getSession();
  }

  getSession() async {
    String userName = await SharedPreference.getUserName();
    String password = await SharedPreference.getPassword();

    if (userName.isNotEmpty && password.isNotEmpty) {
      authBloc.add(
          GetAuthTokenEvent(AuthRequest(userName: userName, password: password)));
    } else {
      navigatePage();
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (!authBloc!.isClosed) {
      authBloc!.close();
    }
  }

  final signUp = const SignInScreen();
  final dashboard = const MachineConfiguratorScreen();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => UserBloc())
      ],
      child: BlocBuilder(
          bloc: authBloc,
          builder: (context, AuthState state) {
            if (state is GetAuthTokenLoadedState) {
              SharedPreference.saveAuthToken(
                  state.authResponse![0].accessToken.toString());
              SharedPreference.saveSessionToken(
                  state.authResponse![0].sessionToken.toString());
              userBloc.add(GetUserEvent());
            }

            if (state is AuthInitialState) {
              return _splash(context);
              //debugPrint("Inside AuthInitialState");
            }
            if (state is GetAuthTokenLoadingState) {
              print('GetAuthTokenLoadingState');
            } else if (state is GetAuthTokenErrorState) {
              print('GetAuthToken Error');
              navigateSignup();
            }
            return BlocConsumer<UserBloc, UserState>(
                listener: (context, state) {
                  _listenerGetUserBloc(context, state);
                },
                bloc: userBloc,
                builder: (context, UserState state) {
                  return _splash(context);
                });

            // return _splash(context);
          }),
    );
  }

  _listenerGetUserBloc(context, state) {
    if (state is GetUserLoadingState) {
      print('Get User loading');
    } else if (state is GetUserLoadedState) {
      navigatePage(getUserResponseData: state.getUserResponseData![0]);
    } else if (state is GetUserErrorState) {
      print('Get user eeor Error');
    }
  }

  navigateSignup() async {
    await SharedPreference.logout();
    Timer(
        const Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (BuildContext context) => signUp),
            ));
  }

  navigatePage({GetUserResponseData? getUserResponseData}) {
    SharedPreference.getIsLogged().then((islogged) {
      if (islogged) {
        Timer(
            const Duration(seconds: 2),
            () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (BuildContext context) => MachineConfiguratorScreen(getUserResponseData: getUserResponseData)),
                ));
      }
      if (!islogged) {
        Timer(
            const Duration(seconds: 2),
            () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (BuildContext context) => signUp),
                ));
      }
    });
  }

  Widget _splash(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      child: Stack(
        children: <Widget>[
          Align(
              alignment: Alignment.center,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    image: AssetImage(Constant.splashlogo1),
                    fit: BoxFit.fill,
                    alignment: Alignment.center,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
