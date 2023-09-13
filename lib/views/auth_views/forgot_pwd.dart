// ignore_for_file: sized_box_for_whitespace

import 'package:diario_de_campo/utilities/colors.dart';
import 'package:diario_de_campo/widgets/components/email_textfield.dart';
import 'package:diario_de_campo/widgets/components/my_button.dart';
import 'package:flutter/material.dart';

class ForgotPwdView extends StatelessWidget {
  const ForgotPwdView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        toolbarHeight: 130,
        backgroundColor: Colors.grey[200],
        title: Center(
          child: Container(
            height: 60,
            child: Image.asset('assets/logo.png'),
          ),
        ),
      ),
      body: ForgotPwdBody(),
    );
  }
}

class ForgotPwdBody extends StatelessWidget {
  ForgotPwdBody({super.key});
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Recupere sua senha!',
            style: TextStyle(color: favoDark, fontSize: 18),
          ),
          const SizedBox(
            height: 30,
          ),
          EmailTextField(controller: emailController),
          const SizedBox(
            height: 30,
          ),
          MyButton(onTap: () {}, title: 'Enviar')
        ],
      ),
    );
  }
}
