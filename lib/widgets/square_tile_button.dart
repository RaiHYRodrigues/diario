import 'package:diario_de_campo/utilities/colors.dart';
import 'package:flutter/material.dart';

class SquareTileButton extends StatelessWidget {
  final String? title;
  final String imagePath;
  final Function()? onTap;

  const SquareTileButton({
    this.title,
    super.key,
    this.onTap,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    String _title;
    if (title == null) {
      _title = "";
    } else {
      _title = title as String;
    }
    return Material(
      borderRadius: BorderRadius.circular(16),
      elevation: 2,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {},
        child: Ink(
          height: 120,
          width: 120,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey[200],
          ),
          child: Column(
            children: [
              Image.asset(
                imagePath,
                height: 60,
              ),
              Text(
                _title,
                style: const TextStyle(color: favoLight, fontSize: 14),
              )
            ],
          ),
        ),
      ),
    );
  }
}
