part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final String phoneNumber;
  final String userName;
  final String invtationCode;

  const AuthSuccess(
      {required this.phoneNumber,
      required this.userName,
      required this.invtationCode});

  @override
  List<Object> get props => [phoneNumber, userName];
}

class AuthFailure extends AuthState {
  final String error;

  const AuthFailure(this.error);

  @override
  List<Object> get props => [error];
}

class AuthVerificationSuccess extends AuthState {}
