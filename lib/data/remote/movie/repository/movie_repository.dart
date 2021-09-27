import 'package:teste_tokenlab/data/remote/movie/remote_data_source/movie_remote_data_source.dart';
import 'package:teste_tokenlab/data/remote/movie/repository/movie_data_repository.dart';
import 'package:teste_tokenlab/domain/movie_details/details/movie_details_model.dart';
import 'package:teste_tokenlab/domain/movies/movie_model.dart';

class MovieRepository implements MovieDataRepository {
  MovieRepository(this._movieRemoteDataSource);
  final MovieRemoteDataSource _movieRemoteDataSource;

  @override
  Future<MovieDetailsModel> fetchMovieDetails(int movieId) =>
      _movieRemoteDataSource.fetchMovieDetails(movieId);

  @override
  Future<List<MovieModel>> fetchMovieList() =>
      _movieRemoteDataSource.fetchMovieList();
}
