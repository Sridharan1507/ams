import 'package:equatable/equatable.dart';
import 'package:ams/model/auth_respose.dart';

abstract class UserState extends Equatable {}




class GetUserInitilState extends UserState {
  @override
  List<Object?> get props => [];
}

class GetUserLoadingState extends UserState {
  @override
  List<Object?> get props => [];
}

class GetUserLoadedState extends UserState {
  final List<AuthResponseData>? authResponse;

  GetUserLoadedState(this.authResponse);

  @override
  List<Object?> get props => [authResponse];
}

class GetUserErrorState extends UserState {
  final String error;

  GetUserErrorState(this.error);

  @override
  List<Object?> get props => [error];
}



class GetAllUsersLoadingState extends UserState {
  @override
  List<Object?> get props => [];
}

class GetAllUsersLoadedState extends UserState {
  final List<AuthResponseData>? authResponse;

  GetAllUsersLoadedState(this.authResponse);

  @override
  List<Object?> get props => [authResponse];
}

class GetAllUsersErrorState extends UserState {
  final String error;

  GetAllUsersErrorState(this.error);

  @override
  List<Object?> get props => [error];
}