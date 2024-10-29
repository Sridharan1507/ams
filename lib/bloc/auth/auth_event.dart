import 'package:ams/model/user_register.dart';
import 'package:equatable/equatable.dart';
import 'package:ams/model/auth_respose.dart';
import 'package:ams/model/change_password.dart';
import 'package:ams/model/regen_token.dart';


abstract class AuthEvent extends Equatable {}

class APIDetailsEvent extends AuthEvent {
  APIDetailsEvent({required this.accountId});

  final String accountId;

  @override
  List<Object?> get props => [accountId];
}

class GetAuthTokenEvent extends AuthEvent {
  final AuthRequest authrequest;

  GetAuthTokenEvent(this.authrequest);

  @override
  List<Object?> get props =>
      [authrequest];
}
class UserRegistrationEvent extends AuthEvent {
  final UserRegisterRequestBody userRegisterRequestBody;

  UserRegistrationEvent(this.userRegisterRequestBody);

  @override
  List<Object?> get props =>
      [userRegisterRequestBody];
}


class ChangePasswordEvent extends AuthEvent {
  final ChangePasswordRequestBody changePasswordRequestBody;

  ChangePasswordEvent(this.changePasswordRequestBody);

  @override
  List<Object?> get props =>
      [changePasswordRequestBody];
}

class RegenTokenEvent extends AuthEvent {
  final RegenTokenRequestBody regenTokenRequestBody;

  RegenTokenEvent(this.regenTokenRequestBody);

  @override
  List<Object?> get props =>
      [regenTokenRequestBody];
}

