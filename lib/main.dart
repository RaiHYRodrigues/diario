import 'package:diario_de_campo/services/auth/firebase_auth_provider.dart';
import 'package:diario_de_campo/views/auth_views/forgot_pwd.dart';

import 'package:flutter/material.dart';

void main() async {
  final provider = FirebaseAuthProvider();
  WidgetsFlutterBinding.ensureInitialized();
  await provider.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: ForgotPwdView());
  }
}
