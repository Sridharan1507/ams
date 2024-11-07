import 'package:ams/model/vehicle/add_vechiles.dart';
import 'package:ams/model/vehicle/get_vechiles.dart';
import 'package:ams/model/vehicle/vehicle_cat.dart';
import 'package:ams/model/vehicle/vehicle_sub_cat.dart';
import 'package:equatable/equatable.dart';
import 'package:ams/model/auth_respose.dart';

abstract class VehicleState extends Equatable {}

class GetAllVechilesInitilState extends VehicleState {
  @override
  List<Object?> get props => [];
}

class GetAllVechilesLoadingState extends VehicleState {
  @override
  List<Object?> get props => [];
}

class GetAllVechilesLoadedState extends VehicleState {
  final GetAllVehiclesResponseData getAllVehiclesResponseData;

  GetAllVechilesLoadedState(this.getAllVehiclesResponseData);

  @override
  List<Object?> get props => [getAllVehiclesResponseData];
}

class GetAllVechilesErrorState extends VehicleState {
  final String error;

  GetAllVechilesErrorState(this.error);

  @override
  List<Object?> get props => [error];
}

class GetVehicleCategoryLoadingState extends VehicleState {
  @override
  List<Object?> get props => [];
}

class GetVehicleCategoryLoadedState extends VehicleState {
  final List<VehicleSubCatResponseData>? vehicleSubCatResposeData;

  GetVehicleCategoryLoadedState(this.vehicleSubCatResposeData);

  @override
  List<Object?> get props => [vehicleSubCatResposeData];
}

class GetVehicleCategoryErrorState extends VehicleState {
  final String error;

  GetVehicleCategoryErrorState(this.error);

  @override
  List<Object?> get props => [error];
}


class GetVehicleSubCategoryLoadingState extends VehicleState {
  @override
  List<Object?> get props => [];
}

class GetVehicleSubCategoryLoadedState extends VehicleState {
  final List<VehicleSubCatResponseData>? vehicleSubCatResponseData;

  GetVehicleSubCategoryLoadedState(this.vehicleSubCatResponseData);

  @override
  List<Object?> get props => [vehicleSubCatResponseData];
}

class GetVehicleSubCategoryErrorState extends VehicleState {
  final String error;

  GetVehicleSubCategoryErrorState(this.error);

  @override
  List<Object?> get props => [error];
}

class AddVehicleLoadingState extends VehicleState {
  @override
  List<Object?> get props => [];
}

class AddVehicleLoadedState extends VehicleState {
  final List<AddVehicleResponseData>? addVehicleResponse;

  AddVehicleLoadedState(this.addVehicleResponse);

  @override
  List<Object?> get props => [addVehicleResponse];
}

class AddVehicleErrorState extends VehicleState {
  final String error;

  AddVehicleErrorState(this.error);

  @override
  List<Object?> get props => [error];
}


class GetMyVehicleLoadingState extends VehicleState {
  @override
  List<Object?> get props => [];
}

class GetMyVehicleLoadedState extends VehicleState {
  final List<MyvehilcesResponseData>? getMyVehicleResponse;

  GetMyVehicleLoadedState(this.getMyVehicleResponse);

  @override
  List<Object?> get props => [getMyVehicleResponse];
}

class GetMyVehicleErrorState extends VehicleState {
  final String error;

  GetMyVehicleErrorState(this.error);

  @override
  List<Object?> get props => [error];
}

class GetEnquireyListLoadingState extends VehicleState {
  @override
  List<Object?> get props => [];
}

class GetEnquireyListLoadedState extends VehicleState {
  final List<GetEnquiresListResponseData>? getEnquireyListResponse;

  GetEnquireyListLoadedState(this.getEnquireyListResponse);

  @override
  List<Object?> get props => [getEnquireyListResponse];
}

class GetEnquireyListErrorState extends VehicleState {
  final String error;

  GetEnquireyListErrorState(this.error);

  @override
  List<Object?> get props => [error];
}