import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class GenericHome extends StatelessWidget {
  const GenericHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: const Text(
            "CounterApp!",
          )),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              color: Colors.green,
              child: Icon(Icons.add),
            ),
            Container(
              child: Text("Result"),
            ),
            Container(
              child: Icon(Icons.remove),
            ),
          ],
        ));
  }
}
