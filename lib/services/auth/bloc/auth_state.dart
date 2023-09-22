import 'package:diario_de_campo/services/auth/auth_user.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class AuthState {
  const AuthState();
}

class AuthStateLoading extends AuthState {
  const AuthStateLoading();
}

class AuthStateRegisterFailure extends AuthState {
  final Exception exception;
  const AuthStateRegisterFailure(this.exception);
}

class AuthStateLoggedIn extends AuthState {
  final AuthUser user;
  const AuthStateLoggedIn(this.user);
}

class AuthStateLogInFaiulure extends AuthState {
  final Exception exception;
  const AuthStateLogInFaiulure(this.exception);
}

class AuthStateLoggedOut extends AuthState {
  const AuthStateLoggedOut();
}

class AuthStateLogOutFaiulure extends AuthState {
  final Exception exception;
  const AuthStateLogOutFaiulure(this.exception);
}

class AuthStateForgotPassword extends AuthState {
  const AuthStateForgotPassword();
}
