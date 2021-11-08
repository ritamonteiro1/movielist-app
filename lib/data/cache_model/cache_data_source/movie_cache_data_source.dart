import 'package:hive/hive.dart';
import 'package:teste_tokenlab/constants/constants_movie_cache.dart';
import 'package:teste_tokenlab/data/cache_model/model/movies/movie_cm.dart';
import 'package:teste_tokenlab/data/cache_model/model/movies_details/details/movie_details_cm.dart';

class MovieCacheDataSource {
  Future<List<MovieCM>> getMovieList() async {
    final box = await Hive.openBox(ConstantsMovieCache.movieListCacheKeyString);
    final movieListCM =
        List<MovieCM>.from(box.get(ConstantsMovieCache.movieListCacheKeyInt));
    return movieListCM;
  }

  Future<void> saveMovieList(List<MovieCM> movieListCM) async {
    final box = await Hive.openBox(ConstantsMovieCache.movieListCacheKeyString);
    await box.putAll({ConstantsMovieCache.movieListCacheKeyInt: movieListCM});
  }

  Future<MovieDetailsCM> getMovieDetails(int movieId) async {
    final movieDetailsCM = await Hive.openBox<MovieDetailsCM>(
            ConstantsMovieCache.movieDetailsCacheKeyString)
        .then(
      (box) => box.get(movieId),
    );
    if (movieDetailsCM != null) {
      return movieDetailsCM;
    } else {
      throw Exception();
    }
  }

  Future<void> saveMovieDetails(MovieDetailsCM movieDetailsCM) async {
    final box = await Hive.openBox<MovieDetailsCM>(
        ConstantsMovieCache.movieDetailsCacheKeyString);
    await box.put(movieDetailsCM.id, movieDetailsCM);
  }

  Future<List<int>> getFavoriteMovieIdList() async {
    final box =
        await Hive.openBox(ConstantsMovieCache.favoritesMovieIdCacheKeyString);
    final favoriteMovieIdList = List<int>.from(box.values);
    return favoriteMovieIdList;
  }

  Future<void> removeFavoriteMovieId(int movieId) async {
    final box =
        await Hive.openBox(ConstantsMovieCache.favoritesMovieIdCacheKeyString);
    await box.delete(movieId);
  }

  Future<void> addFavoriteMovieId(int movieId) async {
    final box =
        await Hive.openBox(ConstantsMovieCache.favoritesMovieIdCacheKeyString);
    await box.put(movieId, movieId);
  }
}
