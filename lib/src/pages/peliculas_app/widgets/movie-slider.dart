import 'package:challenges/modes/models.dart';
import 'package:flutter/material.dart';

class MovieSlider extends StatefulWidget {
  final List<Movie> movies;
  final String? title;
  final Function onNextPage;

  MovieSlider(
      {Key? key, required this.movies, this.title, required this.onNextPage})
      : super(key: key);

  @override
  _MovieSliderState createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  final ScrollController scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 500) {
        this.widget.onNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /* <---------------------------------------> */
          if (this.widget.title != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                this.widget.title!,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          /* <---------------------------------------> */
          SizedBox(
            height: 5,
          ),
          /* <---------------------------------------> */
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: this.widget.movies.length,
              itemBuilder: (_, int index) => _Movieposter(
                movie: this.widget.movies[index],
                heroId: '${widget.title}-$index-${widget.movies[index].id}',
              ),
            ),
          ),
          /* <---------------------------------------> */
        ],
      ),
    );
  }
}

class _Movieposter extends StatelessWidget {
  final Movie movie;
  final String heroId;

  _Movieposter({required this.movie, required this.heroId});

  @override
  Widget build(BuildContext context) {
    movie.heroId = heroId;

    return Container(
      width: 130,
      height: 190,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          /* image movie */
          GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'detail-movies', arguments: movie),
            child: Hero(
              tag: movie.heroId!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: AssetImage('assets/images/no-image.jpg'),
                  image: NetworkImage(movie.fullPosterImg),
                  width: 130,
                  height: 190,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          /* vertical space */
          SizedBox(
            height: 5,
          ),

          /* Title movie */
          Text(
            this.movie.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
