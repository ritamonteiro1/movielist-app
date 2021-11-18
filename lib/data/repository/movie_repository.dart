import 'package:domain/domain/data_repository/movie_data_repository.dart';
import 'package:domain/domain/model/movie_details/details/movie_details.dart';
import 'package:domain/domain/model/movies/movie.dart';
import 'package:teste_tokenlab/data/cache_model/cache_data_source/movie_cache_data_source.dart';
import 'package:teste_tokenlab/data/cache_model/model/movies/movie_cm.dart';
import 'package:teste_tokenlab/data/remote/movie/remote_data_source/movie_remote_data_source.dart';

import 'package:teste_tokenlab/data/mapper/remote_to_cache.dart';
import 'package:teste_tokenlab/data/mapper/cache_to_domain.dart';

class MovieRepository implements MovieDataRepository {
  MovieRepository(this._movieRemoteDataSource, this._movieCacheDataSource);

  final MovieRemoteDataSource _movieRemoteDataSource;
  final MovieCacheDataSource _movieCacheDataSource;

  @override
  Future<MovieDetails> fetchMovieDetails(int movieId) async {
    try {
      final movieDetailsRM =
          await _movieRemoteDataSource.fetchMovieDetails(movieId);
      await _movieCacheDataSource
          .saveMovieDetails(movieDetailsRM.toMovieDetailsCM());
      final movieDetailsCM =
          await _movieCacheDataSource.getMovieDetails(movieId);
      final favoriteMovieIdListCM =
          await _movieCacheDataSource.getFavoriteMovieIdList();
      final movieDetailsDM = movieDetailsCM.toMovieDetailsDM();
      movieDetailsDM.isFavorite =
          favoriteMovieIdListCM.contains(movieDetailsDM.id);
      return movieDetailsDM;
    } catch (e) {
      final movieDetailsCM =
          await _movieCacheDataSource.getMovieDetails(movieId);
      final favoriteMovieIdListCM =
          await _movieCacheDataSource.getFavoriteMovieIdList();
      final movieDetailsDM = movieDetailsCM.toMovieDetailsDM();
      movieDetailsDM.isFavorite =
          favoriteMovieIdListCM.contains(movieDetailsDM.id);
      return movieDetailsDM;
    }
  }

  @override
  Future<List<Movie>> fetchMovieList() async =>
      _movieRemoteDataSource.fetchMovieList().then((movieListRM) async {
        await _movieCacheDataSource.saveMovieList(movieListRM.toMovieListCM());
        final movieListCM = await _movieCacheDataSource.getMovieList();
        return movieListCM.toMovieListDM();
      }).catchError((error, stackTrace) async {
        final movieListCM = await _movieCacheDataSource.getMovieList();
        return movieListCM.toMovieListDM();
      });

  @override
  Future<List<Movie>> fetchFavoriteMovies() async {
    List<int> favoriteMovieIdListCM;
    List<MovieCM> movieListCM;
    favoriteMovieIdListCM =
        await _movieCacheDataSource.getFavoriteMovieIdList();
    movieListCM = await _movieCacheDataSource.getMovieList();
    return movieListCM
        .toMovieListDM()
        .where((movieDM) => favoriteMovieIdListCM.contains(movieDM.id))
        .toList();
  }

  @override
  Future<void> addFavoriteMovie(int movieId) =>
      _movieCacheDataSource.addFavoriteMovieId(movieId);

  @override
  Future<void> removeFavoriteMovie(int movieId) =>
      _movieCacheDataSource.removeFavoriteMovieId(movieId);
}
