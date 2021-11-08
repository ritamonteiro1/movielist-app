import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:teste_tokenlab/bloc/favorite_movies/favorites_movie_result_state.dart';
import 'package:teste_tokenlab/data/repository/movie_data_repository.dart';

class FavoritesMovieBloc {
  FavoritesMovieBloc(this._movieRepository) {
    _subscriptions.add(
      _fetchFavoriteMoviesId().listen(_behaviorSubjectFavoriteMovies.add),
    );
  }

  final MovieDataRepository _movieRepository;

  final _subscriptions = CompositeSubscription();

  Stream<FavoritesMovieResultState> get favoriteMoviesResultState =>
      _behaviorSubjectFavoriteMovies.stream;
  final _behaviorSubjectFavoriteMovies =
  BehaviorSubject<FavoritesMovieResultState>.seeded(
      FavoritesMovieLoadingState());

  Stream<FavoritesMovieResultState> _fetchFavoriteMoviesId() async* {
    yield FavoritesMovieLoadingState();
    try {
      yield FavoritesMovieSuccessState(
          await _movieRepository.fetchFavoriteMovies());
    } catch (EmptyFavoriteListException) {
      yield FavoritesMovieNoResultState();
    }
  }

  void dispose() {
    _behaviorSubjectFavoriteMovies.close();
    _subscriptions.dispose();
  }
}
