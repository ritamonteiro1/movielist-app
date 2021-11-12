import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:teste_tokenlab/bloc/favorite_movies/favorites_movie_result_state.dart';
import 'package:teste_tokenlab/data/repository/movie_data_repository.dart';

class FavoritesMovieBloc {
  FavoritesMovieBloc(this._movieRepository) {
    _subscriptions.add(_behaviorSubjectCallbackFavoriteMovies.stream
        .flatMap((_) => _fetchFavoriteMoviesId())
        .listen(_behaviorSubjectFavoriteMovies.add));
  }

  final MovieDataRepository _movieRepository;
  final _subscriptions = CompositeSubscription();

  Stream<FavoritesMovieResultState> get favoriteMoviesResultState =>
      _behaviorSubjectFavoriteMovies.stream;
  final _behaviorSubjectFavoriteMovies =
      BehaviorSubject<FavoritesMovieResultState>.seeded(
          FavoritesMovieLoadingState());

  Sink<void> get favoriteMoviesCallback =>
      _behaviorSubjectCallbackFavoriteMovies.sink;

  Stream<void> get favoriteMoviesCallbackOutput =>
      _behaviorSubjectCallbackFavoriteMovies.stream;
  final _behaviorSubjectCallbackFavoriteMovies = BehaviorSubject<void>();

  Stream<FavoritesMovieResultState> _fetchFavoriteMoviesId() async* {
    yield FavoritesMovieLoadingState();

    try {
      final favoriteMovies = await _movieRepository.fetchFavoriteMovies();
      if (favoriteMovies.isNotEmpty) {
        yield FavoritesMovieSuccessState(favoriteMovies);
      } else {
        yield FavoritesMovieNoResultState();
      }
    } catch (EmptyFavoriteListException) {
      yield FavoritesMovieNoResultState();
    }
  }

  void dispose() {
    _behaviorSubjectFavoriteMovies.close();
    _subscriptions.dispose();
    _behaviorSubjectCallbackFavoriteMovies.close();
  }
}
