import 'dart:async';

import 'package:domain/domain/model/movie_details/details/movie_details.dart';
import 'package:domain/domain/use_case/add_favorite_movie_uc.dart';
import 'package:domain/domain/use_case/get_movie_details_uc.dart';
import 'package:domain/domain/use_case/remove_favorite_movie_uc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:teste_tokenlab/presentation/movie/movie_details/favorite_movie_result_state.dart';
import 'package:teste_tokenlab/presentation/movie/movie_details/movie_details_result_state.dart';

class MovieDetailsBloc {
  MovieDetailsBloc(this.getMovieDetailsUC, this.addFavoriteMovieUC,
      this.removeFavoriteMovieUC, this._movieId) {
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
  final GetMovieDetailsUC getMovieDetailsUC;
  final AddFavoriteMovieUC addFavoriteMovieUC;
  final RemoveFavoriteMovieUC removeFavoriteMovieUC;
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
      _movieDetails = await getMovieDetailsUC.getFuture(
          params: GetMovieDetailsUCParams(_movieId));
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
        await addFavoriteMovieUC.getFuture(
            params: AddFavoriteMovieUCParams(_movieId));
        _publishSubject.add(SuccessAddFavoriteMovie());
      } else {
        await removeFavoriteMovieUC.getFuture(
            params: RemoveFavoriteMovieUCParams(_movieId));
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
