import 'package:diario_de_campo/services/auth/bloc/auth_event.dart';
import 'package:diario_de_campo/views/auth_views/register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/auth/bloc/auth_bloc.dart';
import '../../utilities/colors.dart';
import '../../widgets/components/email_textfield.dart';
import '../../widgets/components/my_button.dart';
import '../../widgets/components/password_textfield.dart';
import '../../widgets/components/square_tile.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.grey[300],
          body: SafeArea(child: SingleChildScrollView(child: LoginBody()))),
    );
  }
}

class LoginBody extends StatelessWidget {
  LoginBody({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
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
              "Bem vindo de volta!",
              style: TextStyle(
                color: favoDark,
              ),
            ),
            const SizedBox(height: 20),
            EmailTextField(
              controller: emailController,
            ),
            const SizedBox(height: 10),
            PasswordTextField(
              controller: passwordController,
              hintText: 'senha',
            ),
            const SizedBox(height: 10),
            // forgot password?
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    child: const Text(
                      'esqueceu a senha?',
                      style: TextStyle(color: favoDark),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            MyButton(
              title: "Entrar",
              onTap: () {
                final email = emailController.text;
                final password = passwordController.text;
                context.read<AuthBloc>().add(AuthEventLogIn(email, password));
              },
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: const [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: favoDark,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'Ou continue com',
                      style: TextStyle(color: favoDark),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: favoDark,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 35),
            // google + apple sign in buttons
            InkWell(
                onTap: () {
                  context.read<AuthBloc>().add(const AuthEventGoogleSignIn());
                },
                child: const SquareTile(imagePath: 'assets/google.png')),

            const SizedBox(width: 25),
            const SizedBox(height: 35),
            // not a member? register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Não Cadastrado?',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                const SizedBox(width: 4),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const RegisterView(), // Replace with your new page widget
                      ),
                    );
                  },
                  child: const Text(
                    'Criar conta',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
