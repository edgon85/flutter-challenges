import 'dart:async';

import 'package:flutter/material.dart';

class StreamBuilderPage extends StatelessWidget {
  const StreamBuilderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyPage();
  }
}

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  final colorStream = new StreamController<Color>();
  int counter = -1;

  final List<Color> colorList = [
    Colors.blue,
    Colors.yellowAccent,
    Colors.green
  ];

  @override
  void dispose() {
    colorStream.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder(
          stream: colorStream.stream,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (!snapshot.hasData) {
              return LoadingWidget();
            }

            if (snapshot.connectionState == ConnectionState.done) {
              return Text('End of the stream  :(');
            }

            return Container(height: 150, width: 150, color: snapshot.data);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.color_lens),
        onPressed: () {
          this.counter++;
          if (counter < colorList.length) {
            this.colorStream.sink.add(colorList[this.counter]);
          } else {
            this.colorStream.close();
          }
        },
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Waiting clicks'),
        SizedBox(
          height: 20,
        ),
        CircularProgressIndicator(),
      ],
    );
  }
}
