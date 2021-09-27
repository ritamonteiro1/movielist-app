import 'package:dio/dio.dart';
import 'package:teste_tokenlab/data/remote/movie/model/movie_details/details/movie_details_response.dart';
import 'package:teste_tokenlab/data/remote/movie/model/movies/movie_response.dart';
import 'package:teste_tokenlab/domain/movie_details/details/movie_details_model.dart';
import 'package:teste_tokenlab/domain/movies/movie_model.dart';
import 'package:teste_tokenlab/extensions/list_movie_response_extensions.dart';
import 'package:teste_tokenlab/extensions/movie_details_response_extensions.dart';

class MovieRemoteDataSource {
  MovieRemoteDataSource(this._dio);
  final Dio _dio;
  static const String baseUrlMovieList =
      'https://desafio-mobile.nyc3.digitaloceanspaces.com/movies';

  Future<MovieDetailsModel> fetchMovieDetails(int movieId) async {
    final response = await _dio.get('$baseUrlMovieList${'/$movieId'}');
    final movieDetailsResponse = MovieDetailsResponse.fromJson(response.data);
    final movieDetailsModel = movieDetailsResponse.toMovieDetailsModel();

    print('Requisição de detalhes do filme: ${response.statusCode}');
    print(response.data);
    print('LogoUrl do filme clicado: ${movieDetailsModel.posterUrl}');

    return movieDetailsModel;
  }

  Future<List<MovieModel>> fetchMovieList() async {
    final response = await _dio.get(baseUrlMovieList);
    final List<MovieResponse> movieListResponse =
        (response.data.map((item) => MovieResponse.fromJson(item)).toList())
            .cast<MovieResponse>();
    final movieListModel = movieListResponse.toMovieListModel();

    print('Requisição de lista de filmes: ${response.statusCode}');

    return movieListModel;
  }
}
