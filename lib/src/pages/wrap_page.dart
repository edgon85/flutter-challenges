import 'package:flutter/material.dart';

class WrapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wrap'),
      ),
      body: Center(
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 10.0,
          // direction: Axis.vertical, // <== para ponerlo en forma vertical
          children: <Widget>[
            Tag('Metal Gear'),
            Tag('Overwatch'),
            Tag('Cyberpunk'),
            Tag('Call of Duty'),
            Tag('Smash'),
          ],
        ),
      ),
    );
  }
}

class Tag extends StatelessWidget {
  final String text;

  Tag(this.text);

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: CircleAvatar(
        child: Text(this.text[0]),
        backgroundColor: Colors.white,
      ),
      label: Text(
        this.text,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.blue,
    );
  }
}
