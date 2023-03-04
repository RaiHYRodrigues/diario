import 'package:diario/utilities/colors.dart';
import 'package:diario/widgets/email_password_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/custom_button.dart';

class Loginview extends StatelessWidget {
  const Loginview({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'FontAwesome',
        iconTheme: IconThemeData(
          size: width * 0.075, // Adjust the font size as needed
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back),
            color: favoDark,
          ),
          backgroundColor: Colors.white,
        ),
        body: const SafeArea(child: LoginBody()),
      ),
    );
  }
}

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: width * 0.5,
            child: Image.asset('assets/logo.png'),
          ),
          const EmailPasswordForm(),
          CustomButton(text: 'Login', onPressed: () {}),
          SizedBox(height: width * 0.05),
          Text(
            'Continue com:',
            style: TextStyle(
              fontSize: width * 0.03,
              color: favoDark,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  FontAwesomeIcons.google,
                  color: Colors.red,
                  size: width * 0.075,
                ),
                onPressed: () {
                  // handle Google login
                },
              ),
              SizedBox(width: width * 0.05),
              IconButton(
                icon: Icon(FontAwesomeIcons.facebook,
                    color: Colors.blue, size: width * 0.075),
                onPressed: () {
                  // handle Facebook login
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
