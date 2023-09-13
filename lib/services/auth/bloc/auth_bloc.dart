import 'package:bloc/bloc.dart';
import 'package:diario_de_campo/services/auth/bloc/auth_event.dart';
import 'package:diario_de_campo/services/auth/bloc/auth_state.dart';
import 'package:diario_de_campo/services/auth/firebase_auth_provider.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState>{
  AuthBloc(FirebaseAuthProvider provider) : super(const AuthStateLoading()){
    on<AuthEventInitialize>((event, emit) async {
  await provider.initialize();
  final user = provider.currentUser;
    if(user==null){
      emit (AuthStateForgotPassword());
    }
    else{
      emit(AuthStateLoggedIn());
    }
    });
  }
}