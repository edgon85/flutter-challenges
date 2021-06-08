import 'package:challenges/src/pages/expanded_page.dart';
import 'package:challenges/src/pages/home_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getAplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'expanded': (BuildContext context) => ExpandedPage()
  };
}
