import 'package:diario_de_campo/services/auth/bloc/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/auth/bloc/auth_bloc.dart';
import '../../utilities/colors.dart';
import '../../widgets/components/email_textfield.dart';
import '../../widgets/components/my_button.dart';
import '../../widgets/components/password_textfield.dart';
import '../../widgets/components/square_tile.dart';

import 'login_view.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: SingleChildScrollView(child: RegisterBody()),
        ),
      ),
    );
  }
}

class RegisterBody extends StatelessWidget {
  RegisterBody({super.key});

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45),
              child: Image.asset('assets/logo.png'),
            ),
            const SizedBox(height: 30),
            const Text(
              "Faça seu cadastro!",
              style: TextStyle(
                color: favoDark,
              ),
            ),
            const SizedBox(height: 20),

            //Login com email e senha
            EmailTextField(
              controller: _emailController,
            ),
            const SizedBox(height: 10),
            PasswordTextField(
              controller: _passwordController,
              hintText: 'Senha',
            ),
            const SizedBox(height: 10),
            PasswordTextField(
              controller: _confirmPasswordController,
              hintText: 'Confirmar Senha',
            ),
            const SizedBox(height: 25),
            MyButton(
                title: 'Criar Conta',
                onTap: () {
                  final email = _emailController.text;
                  final password = _passwordController.text;
                  context
                      .read<AuthBloc>()
                      .add(AuthEventRegister(email, password));
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const LoginView(), // Replace with your new page widget
                    ),
                  );
                }),

            const SizedBox(height: 50),

            // not a member? register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Ja possui cadastro?',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                const SizedBox(width: 4),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const LoginView(), // Replace with your new page widget
                      ),
                    );
                  },
                  child: const Text(
                    'Entrar',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
