import 'package:flutter/material.dart';

class ClipRRectOValPathPage extends StatelessWidget {
  const ClipRRectOValPathPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainBody(),
    );
  }
}

class MainBody extends StatelessWidget {
  const MainBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('ClipRRect'),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              // borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
              child: MyImage(),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text('ClipOval'),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            child: ClipOval(
              child: MyImage(),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text('ClipPath'),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            child: ClipPath(
              clipper: MyCustomClipper(),
              child: MyImage(),
            ),
          ),
        ],
      ),
    );
  }
}

class MyImage extends StatelessWidget {
  const MyImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
        image: NetworkImage(
            'https://flutter.dev/assets/homepage/news-1-de8e4b946f7154891c3374e9f0744ca02b2a9c8d0f32a3f2c3b151cfc87804e9.png'));
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(0, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height * .5)
      ..lineTo(size.width, size.height * .5);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
