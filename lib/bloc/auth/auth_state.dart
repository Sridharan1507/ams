import 'package:equatable/equatable.dart';
import 'package:ams/model/auth_respose.dart';

abstract class AuthState extends Equatable {}

class AuthInitialState extends AuthState {
  @override
  List<Object?> get props => [];
}


class GetAuthTokenInitilState extends AuthState {
  @override
  List<Object?> get props => [];
}

class GetAuthTokenLoadingState extends AuthState {
  @override
  List<Object?> get props => [];
}

class GetAuthTokenLoadedState extends AuthState {
  final List<AuthResponseData>? authResponse;

  GetAuthTokenLoadedState(this.authResponse);

  @override
  List<Object?> get props => [authResponse];
}

class GetAuthTokenErrorState extends AuthState {
  final String error;

  GetAuthTokenErrorState(this.error);

  @override
  List<Object?> get props => [error];
}

class ChangePasswordLoadingState extends AuthState {
  @override
  List<Object?> get props => [];
}

class ChangePasswordLoadedState extends AuthState {
  final List<AuthResponseData>? authResponse;

  ChangePasswordLoadedState(this.authResponse);

  @override
  List<Object?> get props => [authResponse];
}

class ChangePasswordErrorState extends AuthState {
  final String error;

  ChangePasswordErrorState(this.error);

  @override
  List<Object?> get props => [error];
}


class RegenTokenLoadingState extends AuthState {
  @override
  List<Object?> get props => [];
}

class RegenTokenLoadedState extends AuthState {
  final List<AuthResponseData>? authResponse;

  RegenTokenLoadedState(this.authResponse);

  @override
  List<Object?> get props => [authResponse];
}

class RegenTokenErrorState extends AuthState {
  final String error;

  RegenTokenErrorState(this.error);

  @override
  List<Object?> get props => [error];
}


class UserRegistrationLoadingState extends AuthState {
  @override
  List<Object?> get props => [];
}

class UserRegistrationLoadedState extends AuthState {
  final List<AuthResponseData>? authResponse;

  UserRegistrationLoadedState(this.authResponse);

  @override
  List<Object?> get props => [authResponse];
}

class UserRegistrationErrorState extends AuthState {
  final String error;

  UserRegistrationErrorState(this.error);

  @override
  List<Object?> get props => [error];
}