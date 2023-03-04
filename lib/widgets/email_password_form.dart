import 'package:diario/utilities/colors.dart';
import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  final String? hintText;
  final IconData? icon;
  final ValueChanged<String>? onChanged;

  const RoundedInputField({
    Key? key,
    this.hintText,
    this.icon,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.2,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: TextFormField(
          onChanged: onChanged,
          decoration: InputDecoration(
            icon: Icon(
              icon,
              color: favoDark,
            ),
            hintText: hintText,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

class EmailPasswordForm extends StatelessWidget {
  final ValueChanged<String>? onChangedEmail;
  final ValueChanged<String>? onChangedPassword;

  const EmailPasswordForm({
    Key? key,
    this.onChangedEmail,
    this.onChangedPassword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RoundedInputField(
          hintText: "Email",
          icon: Icons.person,
          onChanged: onChangedEmail,
        ),
        RoundedInputField(
          hintText: "Password",
          icon: Icons.lock,
          onChanged: onChangedPassword,
        ),
      ],
    );
  }
}
