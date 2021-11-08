
import 'package:teste_tokenlab/domain/movies/movie.dart';

abstract class MoviesResultState {}

class MoviesLoadingState implements MoviesResultState {}

class MoviesErrorState implements MoviesResultState {}

class MoviesSuccessState implements MoviesResultState {
  MoviesSuccessState(this.movies);
  final List<Movie> movies;

}
