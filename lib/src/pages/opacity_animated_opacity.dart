import 'package:flutter/material.dart';

class OpacityAnimatedOpacityPage extends StatelessWidget {
  const OpacityAnimatedOpacityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold();
  }
}

class MyScaffold extends StatefulWidget {
  const MyScaffold({
    Key? key,
  }) : super(key: key);

  @override
  _MyScaffoldState createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold> {
  double opacidad = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.opacity),
        onPressed: () {
          setState(() {
            this.opacidad = (opacidad == 1) ? 0 : 1;
          });
        },
      ),
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        child: Wrap(
          direction: Axis.vertical,
          spacing: 50.0,
          children: <Widget>[
            Rectangulo(Color(0xFF00E057), 1),
            Rectangulo(Color(0xFF00BFF4), opacidad),
            Rectangulo(Color(0xFFFEBF2F), 1),
          ],
        ),
      ),
    );
  }
}

class Rectangulo extends StatelessWidget {
  final Color color;
  final double opacidad;

  Rectangulo(this.color, this.opacidad);

  @override
  Widget build(BuildContext context) {
    // return Opacity(
    return AnimatedOpacity(
      curve: Curves.easeOut,
      duration: Duration(milliseconds: 600),
      opacity: this.opacidad,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(color: this.color),
      ),
    );
  }
}
