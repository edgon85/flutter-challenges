import 'dart:math';

import 'package:flutter/material.dart';

class SliverAppBarPage extends StatelessWidget {
  const SliverAppBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MiPagina();
  }
}

class MiPagina extends StatelessWidget {
  final rnd = new Random();

  final List<Color> colores = [
    Colors.red,
    Colors.blueGrey,
    Colors.amberAccent,
    Colors.pink,
    Colors.purple,
    Colors.lightGreen,
    Colors.black,
    Colors.lightBlue,
    Colors.lime,
    Colors.yellow
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = List.generate(
        100,
        (index) => Container(
              width: double.infinity,
              height: 150,
              color: colores[rnd.nextInt(this.colores.length)],
            ));
    /* return Scaffold(
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return items[index];
        },
      ),
    ); */
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            // pinned: true,
            expandedHeight: 200,
            title: Text('SliverAppBar'),
            flexibleSpace: Image.network(
              'https://lh3.googleusercontent.com/DCoJfj42YSQ_Log0jxIqcDjv2Gqx1M6pcJHSV7ek_mpAtIebhw1t8MzttyrYrmR1WCdUyi-6WeyfuAId0ZILZShy0Q=w640-h400-e365-rj-sc0x00ffffff',
              fit: BoxFit.cover,
            ),
          ),
          SliverList(delegate: SliverChildListDelegate(items))
        ],
      ),
    );
  }
}
