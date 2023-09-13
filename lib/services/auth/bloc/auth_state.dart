import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class AuthState {
  const AuthState();
}

class AuthStateLoading extends AuthState{
  const AuthStateLoading();
}

class AuthStateRegistered extends AuthState{
  const AuthStateRegistered();
}

class AuthStateLoggedIn extends AuthState{
  const AuthStateLoggedIn();
}

class AuthStateForgotPassword extends AuthState {
  const AuthStateForgotPassword();
}