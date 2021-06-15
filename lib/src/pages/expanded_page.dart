import 'package:flutter/material.dart';

class ExpandedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expanded'),
      ),
      body: Row(
          children: <Widget>[
            Cuadrado(color: Colors.amber),
            Expanded(flex: 3, child: Cuadrado(color: Colors.red)),
            Expanded(flex: 2, child: Cuadrado(color: Colors.red)),
            Cuadrado(color: Colors.greenAccent),
          ],
        ));
  }
}

class Cuadrado extends StatelessWidget {
  final Color color;

  const Cuadrado({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(color: this.color
      ),
    );
  }
}
