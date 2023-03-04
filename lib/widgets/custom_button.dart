import 'package:diario/utilities/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  
 
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color = favoLight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width * 0.35,
      height: width * 0.09,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          side: const BorderSide(color: favoDark),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(width * 0.06),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: width * 0.035,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
