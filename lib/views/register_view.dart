import 'package:flutter/material.dart';

import '../services/auth/firebase_auth_provider.dart';
import '../utilities/colors.dart';
import '../widgets/components/email_textfield.dart';
import '../widgets/components/my_button.dart';
import '../widgets/components/password_textfield.dart';
import '../widgets/components/square_tile.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        body: const SafeArea(
          child: SingleChildScrollView(child: RegisterBody()),
        ),
      ),
    );
  }
}

class RegisterBody extends StatefulWidget {
  const RegisterBody({super.key});

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding:  const EdgeInsets.symmetric(horizontal: 25),
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
              hintText: 'Email',
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
                onTap: () async {
                  await FirebaseAuthProvider().createUser(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                }),
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
            // Login Com google e Apple.
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //google button
                GestureDetector(
                    onTap: () async {
                      await FirebaseAuthProvider().signInWithGoogle();
                    },
                    child: const SquareTile(imagePath: 'assets/google.png')),
              ],
            ),
            const SizedBox(height: 35),
            // not a member? register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Ja possui cadastro?',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                const SizedBox(width: 4),
                const Text(
                  'Entrar',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
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
