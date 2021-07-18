import 'package:challenges/src/pages/animated_container_page.dart';
import 'package:challenges/src/pages/expanded_page.dart';
import 'package:challenges/src/pages/fade_transition_page.dart';
import 'package:challenges/src/pages/future_builder_page.dart';
import 'package:challenges/src/pages/home_page.dart';
import 'package:challenges/src/pages/opacity_animated_opacity.dart';
import 'package:challenges/src/pages/page_view_page.dart';
import 'package:challenges/src/pages/sliverapp_bar_page.dart';
import 'package:challenges/src/pages/wrap_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getAplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'expanded': (BuildContext context) => ExpandedPage(),
    'wrap': (BuildContext context) => WrapPage(),
    'animated-container': (BuildContext context) => AnimatedContainerPage(),
    'opacity-animated-opacity': (BuildContext context) =>
        OpacityAnimatedOpacityPage(),
        'future-builder': (BuildContext context) => FutureBuilderPage(),
    'fade-transition': (BuildContext context) => FadeTransitionPage(),
    'page-view': (BuildContext context) => PageViewPage(),
    'sliver-app-bar': (BuildContext context) => SliverAppBarPage(),
  };
}
