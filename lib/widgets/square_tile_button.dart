import 'package:flutter/material.dart';

class SquareTileButton extends StatelessWidget {
  final String imagePath;
  final Function()? onTap;

  const SquareTileButton({
    super.key,
    this.onTap,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        borderRadius: BorderRadius.circular(16),
        elevation: 2,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey[200],
          ),
          child: Image.asset(
            imagePath,
            height: 60,
          ),
        ),
      ),
    );
  }
}
