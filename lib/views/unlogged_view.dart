import 'package:diario/utilities/colors.dart';
import 'package:diario/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class UnloggedView extends StatelessWidget {
  const UnloggedView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  height: width * 0.5,
                  //width: width * 0.5,
                  child: Image.asset('assets/logo.png'),
                ),
              ),
              CustomButton(
                text: 'Login',
                onPressed: () {},
              ),
              SizedBox(
                height: width * 0.05,
              ),
              CustomButton(
                text: 'Criar Conta',
                onPressed: () {},
                color: favoLight,
              )
            ],
          ),
        ),
      ),
    );
  }
}
