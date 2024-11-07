import 'package:ams/model/vehicle/add_vechiles.dart';
import 'package:equatable/equatable.dart';
import 'package:ams/model/auth_respose.dart';
import 'package:ams/model/change_password.dart';
import 'package:ams/model/regen_token.dart';
import 'package:ams/model/vehicle/get_vechiles.dart';

abstract class VehicleEvent extends Equatable {}

class GetAllVechiclesEvent extends VehicleEvent {
  final GetVehiclesRequestBody getVehiclesRequestBody;
  GetAllVechiclesEvent(this.getVehiclesRequestBody);

  @override
  List<Object?> get props => [getVehiclesRequestBody];
}


class GetVehicleCategoryEvent extends VehicleEvent {
  GetVehicleCategoryEvent();

  @override
  List<Object?> get props => [];
}


class GetMyVehiclesEvent extends VehicleEvent {
  GetMyVehiclesEvent();

  @override
  List<Object?> get props => [];
}

class GetEnquieryEvent extends VehicleEvent {
  GetEnquieryEvent();

  @override
  List<Object?> get props => [];
}

class AddVehicleEvent extends VehicleEvent {
  final AddVehicleRequestBody addVehicleRequestBody;
  AddVehicleEvent(this.addVehicleRequestBody);

  @override
  List<Object?> get props => [addVehicleRequestBody];
}

class GetVehicleSubCategoryEvent extends VehicleEvent {
  GetVehicleSubCategoryEvent();

  @override
  List<Object?> get props => [];
}

