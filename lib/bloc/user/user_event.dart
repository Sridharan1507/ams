import 'package:equatable/equatable.dart';
import 'package:ams/model/auth_respose.dart';
import 'package:ams/model/change_password.dart';
import 'package:ams/model/regen_token.dart';

abstract class UserEvent extends Equatable {}

class GetUserEvent extends UserEvent {
  GetUserEvent();

  @override
  List<Object?> get props => [];
}


class GetAllUserEvent extends UserEvent {
  GetAllUserEvent();

  @override
  List<Object?> get props => [];
}