import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class _MenuProvider {
  _MenuProvider();

  List<dynamic> options = [];

  Future<List<dynamic>> loadData() async {
    final resp = await rootBundle.loadString('assets/data/menu_options.json');
    Map dataMap = json.decode(resp);

    this.options = dataMap['routes'];

    return this.options;
  }
}

final menuProvider = new _MenuProvider();
