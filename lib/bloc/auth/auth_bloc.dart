// import 'dart:math';

import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ams/bloc/auth/auth_event.dart';
import 'package:ams/bloc/auth/auth_state.dart';
import 'package:ams/http_service.dart';
import 'package:ams/repo/auth/login_repo.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
    on<GetAuthTokenEvent>(getAuthToken);
    on<ChangePasswordEvent>(changePassword);
     on<RegenTokenEvent>(regenToken);
  }
}

void getAuthToken(GetAuthTokenEvent event, Emitter<AuthState> emit) async {
  // try {
    emit(GetAuthTokenLoadingState());

    final data = await APIWeb().post(AuthRepoClass.loginRepo(event.authrequest));

    if (data is ErrResponse) {
      log(data.toString());
      emit(GetAuthTokenErrorState(data.message!));
    } else {
      emit(GetAuthTokenLoadedState(data));
    }
  // } catch (ex) {
  //   emit(GetAuthTokenErrorState(ex.toString()));
  // }
}

void changePassword(ChangePasswordEvent event, Emitter<AuthState> emit) async {
  try {
    emit(ChangePasswordLoadingState());

    final data = await APIWeb()
        .get(AuthRepoClass.changePassword(event.changePasswordRequestBody));

    if (data is ErrResponse) {
      log(data.toString());
      emit(ChangePasswordErrorState(data.message!));
    } else {
      emit(ChangePasswordLoadedState(data));
    }
  } catch (ex) {
    emit(ChangePasswordErrorState(ex.toString()));
  }
}


void regenToken(RegenTokenEvent event, Emitter<AuthState> emit) async {
  try {
    emit(RegenTokenLoadingState());

    final data = await APIWeb()
        .get(AuthRepoClass.regenToken(event.regenTokenRequestBody));

    if (data is ErrResponse) {
      log(data.toString());
      emit(RegenTokenErrorState(data.message!));
    } else {
      emit(RegenTokenLoadedState(data));
    }
  } catch (ex) {
    emit(RegenTokenErrorState(ex.toString()));
  }
}