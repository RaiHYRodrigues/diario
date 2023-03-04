import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class GenericHome extends StatelessWidget {
  const GenericHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Center(
          child: Column(
            children: [
              ElevatedButton(onPressed: () {}, child: const Text('Logout'))
            ],
          ),
        ),
      ),
    );
  }
}
