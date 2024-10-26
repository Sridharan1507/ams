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