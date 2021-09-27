import 'package:teste_tokenlab/domain/movie_details/details/movie_details_model.dart';
import 'package:teste_tokenlab/domain/movies/movie_model.dart';

abstract class MovieDataRepository {
  Future<List<MovieModel>> fetchMovieList();
  Future<MovieDetailsModel> fetchMovieDetails(int movieId);
}