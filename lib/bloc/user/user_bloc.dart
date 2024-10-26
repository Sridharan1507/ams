// import 'dart:math';

import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ams/bloc/user/user_event.dart';
import 'package:ams/bloc/user/user_state.dart';
import 'package:ams/http_service.dart';
import 'package:ams/repo/user/user_repo.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(GetUserInitilState()) {
    on<GetUserEvent>(getUser);
    on<GetAllUserEvent>(getAllUsers);
  }
}

void getUser(GetUserEvent event, Emitter<UserState> emit) async {
  try {
    emit(GetUserLoadingState());

    final data = await APIWeb().get(UserRepo.getUser());

    if (data is ErrResponse) {
      log(data.toString());
      emit(GetUserErrorState(data.message!));
    } else {
      emit(GetUserLoadedState(data));
    }
  } catch (ex) {
    emit(GetUserErrorState(ex.toString()));
  }
}

void getAllUsers(GetAllUserEvent event, Emitter<UserState> emit) async {
  try {
    emit(GetUserLoadingState());

    final data = await APIWeb().get(UserRepo.getAllUsers());

    if (data is ErrResponse) {
      log(data.toString());
      emit(GetUserErrorState(data.message!));
    } else {
      emit(GetUserLoadedState(data));
    }
  } catch (ex) {
    emit(GetUserErrorState(ex.toString()));
  }
}

