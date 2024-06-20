import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _firebaseAuth;

  AuthBloc(this._firebaseAuth) : super(AuthInitial()) {
    on<SignInRequested>(_onSignInRequested);
    on<SignOutRequested>(_onSignOutRequested);
  }

  void _onSignInRequested(
      SignInRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      if (!event.email.endsWith('@${event.allowedDomain}')) {
        throw 'Only ${event.allowedDomain} emails are allowed';
      }

      await _firebaseAuth.signInWithEmailAndPassword(
          email: event.email, password: event.password);
      emit(AuthAuthenticated());
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  void _onSignOutRequested(
      SignOutRequested event, Emitter<AuthState> emit) async {
    await _firebaseAuth.signOut();
    emit(AuthInitial());
  }
}
