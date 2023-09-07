import 'package:diario_de_campo/widgets/components/square_tile.dart';
import 'package:diario_de_campo/widgets/square_tile_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        toolbarHeight: 80,
        backgroundColor: Colors.grey[300],
        title: Center(
          child: Container(
            child: Image.asset('assets/logo.png'),
            height: 50,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SquareTileButton(imagePath: "assets/matriz.png"),
              const SquareTileButton(imagePath: "assets/bercario.png"),
              const SquareTileButton(imagePath: "assets/vega.png"),
            ],
          ),
          Container(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SquareTileButton(imagePath: "assets/flora.png"),
              const SquareTileButton(imagePath: "assets/secagem.png"),
              const SquareTileButton(imagePath: "assets/extracao.png"),
            ],
          ),
        ],
      ),
    );
  }
}
