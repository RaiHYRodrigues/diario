// ignore_for_file: sized_box_for_whitespace

import 'package:diario_de_campo/utilities/colors.dart';
import 'package:diario_de_campo/widgets/square_tile_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        toolbarHeight: 130,
        backgroundColor: Colors.grey[200],
        title: Center(
          child: Container(
            height: 60,
            child: Image.asset('assets/logo.png'),
          ),
        ),
      ),
      body: const SafeArea(child: SingleChildScrollView(child: HomeBody())),
      bottomNavigationBar: Container(
        height: 100,
        child: BottomNavigationBar(
          currentIndex: 0,
          fixedColor: favoLight,
          unselectedItemColor: favoDark,
          backgroundColor: Colors.grey[200],
          type: BottomNavigationBarType.fixed,
          elevation: 2,
          iconSize: 40,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.cloudSun),
              label: 'Previsão',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.satellite),
              label: 'Mapa',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.summarize),
              label: 'Relatórios',
            ),
          ],
        ),
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SquareTileButton(
              imagePath: "assets/matriz.png",
              title: "Matrizário",
              onTap: () {},
            ),
            const SquareTileButton(
              imagePath: "assets/bercario.png",
              title: "Berçário",
            ),
            const SquareTileButton(
              imagePath: "assets/vega.png",
              title: "Vegetativo",
            ),
          ],
        ),
        Container(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            SquareTileButton(
              imagePath: "assets/flora.png",
              title: "Floração",
            ),
            SquareTileButton(
              imagePath: "assets/secagem.png",
              title: "Secagem",
            ),
            SquareTileButton(
              imagePath: "assets/extracao.png",
              title: "Extração",
            ),
          ],
        ),
      ],
    );
  }
}
