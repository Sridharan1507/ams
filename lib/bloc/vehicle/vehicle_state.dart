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
  final List<AuthResponseData>? authResponse;

  GetAllVechilesLoadedState(this.authResponse);

  @override
  List<Object?> get props => [authResponse];
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
  final List<AuthResponseData>? authResponse;

  GetVehicleCategoryLoadedState(this.authResponse);

  @override
  List<Object?> get props => [authResponse];
}

class GetVehicleCategoryErrorState extends VehicleState {
  final String error;

  GetVehicleCategoryErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
