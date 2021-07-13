import 'package:flutter/material.dart';

class FadeTransitionPage extends StatefulWidget {
  const FadeTransitionPage({Key? key}) : super(key: key);

  @override
  _FadeTransitionPageState createState() => _FadeTransitionPageState();
}

class _FadeTransitionPageState extends State<FadeTransitionPage>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? opacidad;

  @override
  void initState() {
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    opacidad = new Tween(begin: 0.0, end: 1.0).animate(controller!);

    controller?.forward();

    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.access_alarm),
        onPressed: () {
          controller?.forward(from: 0.0);
        },
      ),
      body: FadeTransition(
        opacity: opacidad!,
        child: Center(
          child: Cuadrado(),
        ),
      ),
    );
  }
}

class Cuadrado extends StatelessWidget {
  const Cuadrado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(color: Colors.amber),
    );
  }
}
