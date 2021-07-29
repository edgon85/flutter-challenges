import 'package:challenges/src/pages/peliculas_app/providers/movie_provider.dart';
import 'package:challenges/src/pages/peliculas_app/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/* class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MoviesProvider(),
          lazy: false,
        )
      ],
      child: MainMoviesApp(),
    );
  }
} */

class MainMoviesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MoviesProvider(),
          lazy: false,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movies',
        home: HomeMovieScreen(),
        routes: {
          'home-movies': (BuildContext context) => HomeMovieScreen(),
          'detail-movies': (BuildContext context) => DetailMovieScreen(),
        },
        theme: ThemeData.light()
            .copyWith(appBarTheme: AppBarTheme(color: Colors.yellow[800])),
      ),
    );
  }
}
