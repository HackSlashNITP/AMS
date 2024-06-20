import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignInRequested extends AuthEvent {
  final String email;
  final String password;
  final String allowedDomain; 

  SignInRequested({
    required this.email,
    required this.password,
    required this.allowedDomain,
  });

  @override
  List<Object?> get props => [email, password, allowedDomain];
}

class SignOutRequested extends AuthEvent {}
