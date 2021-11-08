import 'package:flutter/material.dart';
import 'package:teste_tokenlab/domain/movies/movie.dart';
import 'package:teste_tokenlab/view/movies_view/widgets/movie_list_widget_view.dart';

class MoviesWidgetView extends StatelessWidget {
  const MoviesWidgetView({
    required this.appBarTitle,
    required this.movies,
    Key? key,
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
