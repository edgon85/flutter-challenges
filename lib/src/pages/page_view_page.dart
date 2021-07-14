import 'package:flutter/material.dart';

class PageViewPage extends StatelessWidget {
  const PageViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: 300,
          child: PageView(
            controller: PageController(viewportFraction: 0.6),
            // scrollDirection: Axis.vertical, // <= cambia la dirección
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              Pagina(Colors.blueAccent),
              Pagina(Colors.redAccent),
              Pagina(Colors.greenAccent),
            ],
          ),
        ),
      ),
    );
  }
}

class Pagina extends StatelessWidget {
  final Color color;
  Pagina(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: this.color,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
