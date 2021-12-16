import 'package:dio/dio.dart';
import 'package:teste_tokenlab/data/remote/movie/model/movie_details/details/movie_details_rm.dart';
import 'package:teste_tokenlab/data/remote/movie/model/movies/movie_rm.dart';

class MovieRemoteDataSource {
  MovieRemoteDataSource(
    this._dio,
  );

  final Dio _dio;
  final String _baseUrlMovieList =
      'https://desafio-mobile.nyc3.digitaloceanspaces.com/movies';

  Future<MovieDetailsRM> fetchMovieDetails(int movieId) async {
    final response = await _dio.get('$_baseUrlMovieList${'/$movieId'}');
    final movieDetailsRM = MovieDetailsRM.fromJson(response.data);
    return movieDetailsRM;
  }

  Future<List<MovieRM>> fetchMovieList() async {
    final response = await _dio.get(_baseUrlMovieList);
    final List<MovieRM> movieListRM =
        (response.data.map((item) => MovieRM.fromJson(item)).toList())
            .cast<MovieRM>();
    return movieListRM;
  }
}
