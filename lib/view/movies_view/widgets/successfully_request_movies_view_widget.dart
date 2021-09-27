import 'package:flutter/material.dart';
import 'package:teste_tokenlab/domain/movies/movie_model.dart';
import 'package:teste_tokenlab/view/movies_view/widgets/movie_list_view_widget.dart';

class SuccessfullyRequestMovies extends StatelessWidget {
  const SuccessfullyRequestMovies({required this.movies, Key? key})
      : super(key: key);
  final List<MovieModel> movies;

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.blue,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 8,
          title: const Text(
            'Lista de filmes',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SizedBox.expand(
          child: MovieListViewWidget(movies: movies),
        ),
      );
}
