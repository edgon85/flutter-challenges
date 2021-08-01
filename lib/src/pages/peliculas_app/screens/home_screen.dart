import 'package:challenges/src/pages/peliculas_app/providers/movie_provider.dart';
import 'package:challenges/src/pages/peliculas_app/search/search_delegate.dart';
import 'package:challenges/src/pages/peliculas_app/widgets/card_swiper.dart';
import 'package:challenges/src/pages/peliculas_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeMovieScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Películas en cines'),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.search_outlined),
            onPressed: () =>
                showSearch(context: context, delegate: MovieSearchDelegate()),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /* Principal cards */
            CardSwiper(
              movies: moviesProvider.onDisplayMovies,
            ),

            /* Slider movies */
            MovieSlider(
              movies: moviesProvider.onPopularMovies,
              title: 'Populares',
              onNextPage: () {
                moviesProvider.getPopularMovies();
              },
            ),
          ],
        ),
      ),
    );
  }
}
