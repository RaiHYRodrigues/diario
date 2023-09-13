import 'package:flutter/material.dart';

import '../../utilities/colors.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController controller;

  const EmailTextField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: 300,
      child: TextField(
        autocorrect: false,
        enableSuggestions: false,
        keyboardType: TextInputType.emailAddress,
        controller: controller,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: favoDark),
            ),
            fillColor: Colors.grey[200],
            filled: true,
            hintText: "email",
            hintStyle: TextStyle(color: Colors.grey[500])),
      ),
    );
  }
}
