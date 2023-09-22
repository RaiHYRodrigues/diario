import 'package:bloc/bloc.dart';
import 'package:diario_de_campo/services/auth/auth_user.dart';
import 'package:diario_de_campo/services/auth/bloc/auth_event.dart';
import 'package:diario_de_campo/services/auth/bloc/auth_state.dart';
import 'package:diario_de_campo/services/auth/firebase_auth_provider.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(FirebaseAuthProvider provider) : super(const AuthStateLoading()) {
    //initialize
    on<AuthEventInitialize>((event, emit) async {
      await provider.initialize();
      final user = provider.currentUser;
      if (user == null) {
       emit(const AuthStateLoggedOut());
      } else {
         emit(AuthStateLoggedIn(user));
        print(user.email);
        
      }
    });
    //register
    on<AuthEventRegister>((event, emit) async {
      emit(const AuthStateLoading());
      final email = event.email;
      final password = event.password;
      try {
        provider.register(email: email, password: password);
        emit(const AuthStateLoggedOut());
      } on Exception catch (e) {
        emit(AuthStateRegisterFailure(e));
      }
    });
    //log in
    on<AuthEventLogIn>(((event, emit) async {
      emit(const AuthStateLoading());
      final email = event.email;
      final password = event.password;
      try {
        final user = await provider.logIn(email: email, password: password);
        emit(AuthStateLoggedIn(user));
      } on Exception catch (e) {
        emit(AuthStateLogInFaiulure(e));
      }
    }));
    //Google Sign In
    on<AuthEventGoogleSignIn>((event, emit) async {
      emit(const AuthStateLoading());
      try {
        await provider.googleSignIn();
        final user = await provider.googleSignIn();
        emit(AuthStateLoggedIn(user));
      } on Exception catch (e) {
        emit(AuthStateLogInFaiulure(e));
      }
    });
    //logout
    on<AuthEventLogOut>((event, emit) async {
      emit(const AuthStateLoading());
      try {
        await provider.logOut();
        emit(const AuthStateLoggedOut());
      } on Exception catch (e) {
        emit(AuthStateLogOutFaiulure(e));
      }
    });
  }
}
