import 'package:diario_de_campo/services/auth/bloc/auth_bloc.dart';
import 'package:diario_de_campo/services/auth/bloc/auth_event.dart';
import 'package:diario_de_campo/services/auth/bloc/auth_state.dart';
import 'package:diario_de_campo/services/auth/firebase_auth_provider.dart';
import 'package:diario_de_campo/views/auth_views/forgot_pwd.dart';
import 'package:diario_de_campo/views/auth_views/login_view.dart';
import 'package:diario_de_campo/views/home_view.dart';
import 'package:diario_de_campo/views/loading_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  runApp(MaterialApp(
      home: BlocProvider<AuthBloc>(
    create: (context) => AuthBloc(FirebaseAuthProvider()),
    child: const AuthHome(),
  )));
}

class AuthHome extends StatelessWidget {
  const AuthHome({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(const AuthEventInitialize());
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthStateLoggedIn) {
          return const HomeView();
        } else if (state is AuthStateLoggedOut) {
          return const LoginView();
        } else if (state is AuthStateForgotPassword) {
          return const ForgotPwdView();
        } else {
          return const LoadingView();
        }
      },
    );
  }
}
