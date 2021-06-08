import 'package:challenges/src/providers/menu_provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  // const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _list(),
    );
  }
}

Widget _list() {
  return FutureBuilder(
    future: menuProvider.loadData(),
    initialData: [],
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return ListView(
        children: _listItems(snapshot.data, context),
      );
    },
  );
}

List<Widget> _listItems(List<dynamic> data, BuildContext context) {
  final List<Widget> options = [];

  data.forEach((opt) {
    final widgetTemp = ListTile(
      title: Text(opt['text']),
      // leading: getIcon(opt['icon']),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: () => Navigator.pushNamed(context, opt['route']),
    );

    options..add(widgetTemp)..add(Divider());
  });

  return options;
}
