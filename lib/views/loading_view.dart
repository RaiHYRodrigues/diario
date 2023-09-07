import 'package:flutter/material.dart';

import '../utilities/colors.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: const Center(
        child: CircularProgressIndicator(
          color: favoLight,
        ),
      ),
    );
  }
}
