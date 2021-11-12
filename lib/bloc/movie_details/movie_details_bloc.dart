import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:teste_tokenlab/bloc/movie_details/favorite_movie_result_state.dart';
import 'package:teste_tokenlab/bloc/movie_details/movie_details_result_state.dart';
import 'package:teste_tokenlab/data/repository/movie_data_repository.dart';
import 'package:teste_tokenlab/domain/movie_details/details/movie_details.dart';

class MovieDetailsBloc {
  MovieDetailsBloc(this._movieRepository, this._movieId) {
    _subscriptions
      ..add(
        _fetchMovieDetails().listen(_behaviorSubject.add),
      )
      ..add(_onFavoriteMovie.stream
          .flatMap((_) => _toFavoriteMovie())
          .listen(_behaviorSubject.add))
      ..add(_onTryAgain.stream
          .flatMap((_) => _fetchMovieDetails())
          .listen(_behaviorSubject.add));
  }

  final int _movieId;
  final MovieDataRepository _movieRepository;
  late MovieDetails _movieDetails;

  final _subscriptions = CompositeSubscription();
  final _onTryAgain = StreamController<void>();
  final _onFavoriteMovie = StreamController<void>();

  Sink<void> get onTryAgain => _onTryAgain.sink;

  Sink<void> get onFavoriteMovieInput => _onFavoriteMovie.sink;

  Stream<MovieDetailsResultState> get movieDetailsResultState =>
      _behaviorSubject.stream;
  final _behaviorSubject = BehaviorSubject<MovieDetailsResultState>.seeded(
      MovieDetailsLoadingState());

  Stream<MovieDetailsResultState> _fetchMovieDetails() async* {
    yield MovieDetailsLoadingState();

    try {
      _movieDetails = await _movieRepository.fetchMovieDetails(_movieId);
      yield MovieDetailsSuccessState(_movieDetails);
    } catch (e) {
      yield MovieDetailsErrorState();
    }
  }

  final _publishSubject = PublishSubject<FavoriteMovieResultState>();

  Stream<FavoriteMovieResultState> get addOrRemoveResultState =>
      _publishSubject.stream;

  Stream<MovieDetailsResultState> _toFavoriteMovie() async* {
    try {
      if (!_movieDetails.isFavorite) {
        await _movieRepository.addFavoriteMovie(_movieId);
        _publishSubject.add(SuccessAddFavoriteMovie());
      } else {
        await _movieRepository.removeFavoriteMovie(_movieId);
        _publishSubject.add(SuccessRemoveFavoriteMovie());
      }
      _movieDetails.isFavorite = !_movieDetails.isFavorite;
      yield MovieDetailsSuccessState(_movieDetails);
    } catch (e) {
      _publishSubject.add(ErrorAddOrRemoveFavoriteMovie());
   }
  }

  void dispose() {
    _behaviorSubject.close();
    _onTryAgain.close();
    _onFavoriteMovie.close();
    _subscriptions.dispose();
    _publishSubject.close();
  }
}
