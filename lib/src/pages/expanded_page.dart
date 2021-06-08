import 'package:flutter/material.dart';

class ExpandedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expanded'),
      ),
      body: Container(
        child: Center(
          child: Text('Expanded widget'),
        ),
      ),
    );
  }
}
