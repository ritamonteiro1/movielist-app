import 'package:domain/domain/model/movies/movie.dart';

abstract class FavoritesMovieResultState {}

class FavoritesMovieLoadingState implements FavoritesMovieResultState {}

class FavoritesMovieNoResultState implements FavoritesMovieResultState {}

class FavoritesMovieSuccessState implements FavoritesMovieResultState {
  FavoritesMovieSuccessState(this.favoritesMovie);
  final List<Movie> favoritesMovie;
}
