import 'package:ams_flutter/features/onboarding/presentation/Admin/widgets/auth_widgets.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../Admin/widgets/login_widgets.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final String allowedDomain = "nitp.ac.in";
  SignInBloc() : super(SignInInitial()) {
    on<SignInEvent>((event, emit) {});
    on<SignInInitiateEvent>((event, emit) async {
      emit(SignInProgress());
      final UserCredential? userCredential = await FirebaseSignIn()
          .signIn(email: event.email, password: event.password);

      if (userCredential != null &&
          userCredential.user != null &&
          userCredential.user!.email != null) {
        if (userCredential.user!.email!.endsWith("@" + allowedDomain)) {
          emit(SignInSuccess());
          showToast("SIGN IN SUCCESSFUL");
        } else {
          emit(SignInFailure());
          showToast("Please use an Valid email of $allowedDomain");
        }
      }
      emit(SignInSuccess());
    });
    on<ResetPasswordInitiateEvent>((event, emit) async {
      emit(ResetPasswordProgress());
      bool isSuccess = await FirebaseSignIn().resetPassword(email: event.email);
      if (isSuccess) {
        emit(ResetPasswordSuccess());
        showToast("successfully reset password");
      } else {
        emit(ResetPasswordFailure());
        showToast("ERROR");
      }
    });
  }
}
