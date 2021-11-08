import 'package:teste_tokenlab/domain/movie_details/details/movie_details.dart';
import 'package:teste_tokenlab/domain/movies/movie.dart';

abstract class MovieDataRepository {
  Future<List<Movie>> fetchMovieList();
  Future<MovieDetails> fetchMovieDetails(int movieId);
  Future<List<Movie>> fetchFavoriteMovies();
  Future<void> addFavoriteMovie(int movieId);
  Future<void> removeFavoriteMovie(int movieId);
}