import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:teste_tokenlab/bloc/movie_details/movie_details_result_state.dart';
import 'package:teste_tokenlab/data/remote/movie/repository/movie_data_repository.dart';

class MovieDetailsBloc {
  MovieDetailsBloc(this._movieRepository, this._movieId) {
    _subscriptions
      ..add(
        _fetchMovieDetails()
            .listen(_behaviorSubject.add),
      )
      ..add(
          _onTryAgain.stream
              .flatMap((_) => _fetchMovieDetails())
              .listen(_behaviorSubject.add)
      );
  }

  final int _movieId;
  final MovieDataRepository _movieRepository;

  final _subscriptions = CompositeSubscription();

  final _onTryAgain = StreamController<int>();

  Sink<int> get onTryAgain => _onTryAgain.sink;

  Stream<MovieDetailsResultState> get movieDetailsResultState =>
      _behaviorSubject.stream;
  final _behaviorSubject = BehaviorSubject<MovieDetailsResultState>.seeded(
      MovieDetailsLoadingState());

  Stream<MovieDetailsResultState> _fetchMovieDetails() async* {
    yield MovieDetailsLoadingState();

    try {
      yield MovieDetailsSuccessState(
        await _movieRepository.fetchMovieDetails(_movieId),
      );
    } catch (e) {
      yield MovieDetailsErrorState();
    }
  }

  void dispose() {
    _behaviorSubject.close();
    _onTryAgain.close();
    _subscriptions.dispose();
  }
}
