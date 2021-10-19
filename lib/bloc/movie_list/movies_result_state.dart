
import 'package:teste_tokenlab/domain/movies/movie_model.dart';

abstract class MoviesResultState {}

class MoviesLoadingState extends MoviesResultState {}

class MoviesErrorState extends MoviesResultState {}

class MoviesSuccessState extends MoviesResultState {
  MoviesSuccessState(this.movies);
  final List<MovieModel> movies;

}
