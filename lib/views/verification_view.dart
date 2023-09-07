import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../utilities/colors.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
          color: favoDark,
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: width * 0.15),
            Container(
              width: width * 0.5,
              child: Text(
                textAlign: TextAlign.center,
                'Por Favor, confirme sua conta, e retorne para fazer Login',
                style: TextStyle(color: favoDark, fontSize: width * 0.035),
              ),
            ),
            SizedBox(height: width * 0.15),
            SizedBox(height: width * 0.03),
          ],
        ),
      ),
    );
  }
}
