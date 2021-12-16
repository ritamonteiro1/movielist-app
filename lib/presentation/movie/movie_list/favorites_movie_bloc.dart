import 'dart:async';

import 'package:domain/domain/use_case/get_favorite_movie_list_uc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:teste_tokenlab/presentation/movie/movie_list/favorites_movie_result_state.dart';

class FavoritesMovieBloc {
  FavoritesMovieBloc(this.getFavoriteMovieListUC) {
    _subscriptions.add(_behaviorSubjectCallbackFavoriteMovies.stream
        .flatMap((_) => _fetchFavoriteMoviesId())
        .listen(_behaviorSubjectFavoriteMovies.add));
  }

  final GetFavoriteMovieListUC getFavoriteMovieListUC;
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
      final favoriteMovies =
          await getFavoriteMovieListUC.getFuture(params: null);
      if (favoriteMovies.isNotEmpty) {
        yield FavoritesMovieSuccessState(favoriteMovies);
      } else {
        yield FavoritesMovieNoResultState();
      }
    } catch (e) {
      yield FavoritesMovieNoResultState();
    }
  }

  void dispose() {
    _behaviorSubjectFavoriteMovies.close();
    _subscriptions.dispose();
    _behaviorSubjectCallbackFavoriteMovies.close();
  }
}
