import 'package:diario/views/generic_home.dart';
import 'package:diario/views/loading_view.dart';
import 'package:diario/views/login_view.dart';
import 'package:diario/views/register_view.dart';
import 'package:diario/views/unlogged_view.dart';
import 'package:diario/views/verification_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: VerificationView(),
    );
  }
}
