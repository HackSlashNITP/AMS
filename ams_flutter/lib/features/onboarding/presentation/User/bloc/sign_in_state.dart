part of 'sign_in_bloc.dart';

sealed class SignInState {}

//states regarding signin functionality
final class SignInInitial extends SignInState {}

final class SignInProgress extends SignInState {}

final class SignInFailure extends SignInState {}

final class SignInSuccess extends SignInState {}

//states regarding reset password
final class ResetPasswordProgress extends SignInState {}

final class ResetPasswordFailure extends SignInState {}

final class ResetPasswordSuccess extends SignInState {}

//states regarding forgetpassword

final class ForgetPasswordProgress extends SignInState {}

final class ForgetPasswordFailure extends SignInState {}

final class ForgetPasswordSuccess extends SignInState {}
