part of 'sign_in_bloc.dart';

sealed class SignInEvent {}

//events corresponding to  forgetpassword state
class ForgetPasswordInitiateEvent extends SignInEvent {
  final String password;

  ForgetPasswordInitiateEvent({required this.password});
}

//events corresponding to  sigin state
class SignInInitiateEvent extends SignInEvent {
  final String email;
  final String password;

  SignInInitiateEvent({required this.email, required this.password});
}

//event corresponding to resetpassword state
class ResetPasswordInitiateEvent extends SignInEvent {
  final String email;

  ResetPasswordInitiateEvent({required this.email});
}
