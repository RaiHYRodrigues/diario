import 'package:flutter/material.dart';

import '../../utilities/colors.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String title;

  const MyButton({super.key, required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.all(25),
        width: 300,
        decoration: BoxDecoration(
          color: favoDark,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
