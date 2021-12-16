import 'package:domain/domain/model/movies/movie.dart';
import 'package:flutter/material.dart';
import 'package:teste_tokenlab/presentation/movie/movie_list/movie_list_widget_view.dart';

class MoviesWidgetView extends StatelessWidget {
  const MoviesWidgetView({
    required this.appBarTitle,
    required this.movies,
    required Key key,
  }) : super(key: key);
  final List<Movie> movies;
  final String appBarTitle;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 8,
          title: Text(
            appBarTitle,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        body: SizedBox.expand(
          child: MovieListWidgetView(movies: movies),
        ),
      );
}
