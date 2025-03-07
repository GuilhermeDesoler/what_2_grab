import 'package:equatable/equatable.dart';

import '../../../../core/failures/auth_failure.dart';
import '../../domain/entities/user.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final User user;

  const AuthSuccess(this.user);

  @override
  List<Object> get props => [user];
}

class AuthFailureState extends AuthState {
  final AuthFailure failure;

  const AuthFailureState(this.failure);

  @override
  List<Object> get props => [failure];
}
