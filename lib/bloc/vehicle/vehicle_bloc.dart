// import 'dart:math';

import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ams/bloc/user/user_event.dart';
import 'package:ams/bloc/user/user_state.dart';
import 'package:ams/bloc/vehicle/vehicle_event.dart';
import 'package:ams/bloc/vehicle/vehicle_state.dart';
import 'package:ams/http_service.dart';
import 'package:ams/repo/user/user_repo.dart';
import 'package:ams/repo/vechile/vehicle_repo.dart';

class VehicleBloc extends Bloc<VehicleEvent, VehicleState> {
  VehicleBloc() : super(GetAllVechilesInitilState()) {
    on<GetAllVechiclesEvent>(getAllVehicles);
    on<GetVehicleCategoryEvent>(getvehicleCategory);
    on<AddVehicleEvent>(addVehicle);
    on<GetVehicleSubCategoryEvent>(getvehiclesubCategory);
  }
}

void getAllVehicles(
    GetAllVechiclesEvent event, Emitter<VehicleState> emit) async {
  try {
    emit(GetAllVechilesLoadingState());

    final data = await APIWeb()
        .post(VehicleRepo.getAllVehicles(event.getVehiclesRequestBody));

    if (data is ErrResponse) {
      log(data.toString());
      emit(GetAllVechilesErrorState(data.message!));
    } else {
      emit(GetAllVechilesLoadedState(data));
    }
  } catch (ex) {
    emit(GetAllVechilesErrorState(ex.toString()));
  }
}

void getvehicleCategory(
    GetVehicleCategoryEvent event, Emitter<VehicleState> emit) async {
  try {
    emit(GetVehicleCategoryLoadingState());

    final data = await APIWeb().get(VehicleRepo.getvehicleCategory());

    if (data is ErrResponse) {
      log(data.toString());
      emit(GetVehicleCategoryErrorState(data.message!));
    } else {
      emit(GetVehicleCategoryLoadedState(data));
    }
  } catch (ex) {
    emit(GetVehicleCategoryErrorState(ex.toString()));
  }
}

void getvehiclesubCategory(
    GetVehicleSubCategoryEvent event, Emitter<VehicleState> emit) async {
  // try {
    emit(GetVehicleSubCategoryLoadingState());

    final data = await APIWeb().get(VehicleRepo.getvehicleSubCategory());

    if (data is ErrResponse) {
      // log(data.toString());
      emit(GetVehicleSubCategoryErrorState(data.message!));
    } else {
      emit(GetVehicleSubCategoryLoadedState(data));
    }
  // } catch (ex) {
  //   emit(GetVehicleCategoryErrorState(ex.toString()));
  // }
}


void addVehicle(
    AddVehicleEvent event, Emitter<VehicleState> emit) async {
  // try {
    emit(AddVehicleLoadingState());

    final data = await APIWeb()
        .post(VehicleRepo.addVehicle(event.addVehicleRequestBody));

    if (data is ErrResponse) {
      log(data.toString());
      emit(AddVehicleErrorState(data.message!));
    } else {
      emit(AddVehicleLoadedState(data));
    }
  } 
  // catch (ex) {
  //   emit(AddVehicleErrorState(ex.toString()));
  // }
